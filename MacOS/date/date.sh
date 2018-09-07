#!/bin/bash

if [ "$1" != "" ]; then
  TODAY_S=$1
fi


if [ "$TODAY_S" == "" ]; then
  TODAY_S=`date +%s`
fi

function date_cmd {
  DATE_CMD=date

  date -d 'last-month' >& /dev/null
  if [ $? -eq 0 ] ; then
    DATE_CMD=date
  fi

  gdate -d 'last-month' >& /dev/null
  if [ $? -eq 0 ]; then
    DATE_CMD=gdate
  fi

  $DATE_CMD -d 'last-month' >& /dev/null
  if [ $? -eq 0 ]; then
    DATE_STRING_SUPPORT=1
  else
    DATE_CMD=date
    DATE_STRING_SUPPORT=0
  fi
}

function one_month_seconds {
  # seconds of 31 days
  ONE_MONTH_S=2678400
  echo $ONE_MONTH_S
}

function thirty_days_seconds {
  echo 2592000
}

function this_mon {
  if [ $DATE_STRING_SUPPORT -gt 0 ]; then
    $DATE_CMD -d 'this month' '+%Y-%m'
  else
    $DATE_CMD -r $TODAY_S '+%Y-%m'
  fi
}

function last_mon {
  if [ $DATE_STRING_SUPPORT -gt 0 ]; then
    $DATE_CMD -d 'last month' '+%Y-%m'
  else
    ONE_MONTH_S=`thirty_days_seconds`    
    LAST_MON_S=`expr $TODAY_S - $ONE_MONTH_S`
    LAST_MON=`$DATE_CMD -r $LAST_MON_S '+%Y-%m'`
    if [ "$LAST_MON" == "$THIS_MON" ]; then
      ONE_MONTH_S=`one_month_seconds`
      LAST_MON_S=`expr $TODAY_S - $ONE_MONTH_S`
      LAST_MON=`$DATE_CMD -r $LAST_MON_S '+%Y-%m'`
    fi

    echo $LAST_MON
  fi
}

function two_mon_ago {
  if [ $DATE_STRING_SUPPORT -gt 0 ]; then
    $DATE_CMD -d '2 months ago' '+%Y-%m'
  else
    last_mon >& /dev/null
    ONE_MONTH_S=`thirty_days_seconds`    
    TWO_MON_AGO_S=`expr $LAST_MON_S - $ONE_MONTH_S`
    TWO_MON_AGO=`$DATE_CMD -r $TWO_MON_AGO_S '+%Y-%m'`
    if [ "$TWO_MON_AGO" == "$LAST_MON" ]; then
      ONE_MONTH_S=`one_month_seconds`
      TWO_MON_AGO_S=`expr $LAST_MON_S - $ONE_MONTH_S`
      TWO_MON_AGO=`$DATE_CMD -r $TWO_MON_AGO_S '+%Y-%m'`
    fi

    echo $TWO_MON_AGO
  fi
}

function months {
  THIS_MON=`this_mon`
  LAST_MON=`last_mon`
  TWO_MON_AGO=`two_mon_ago`
}

function print_months {
  echo "THIS_MON: $THIS_MON"
  echo "LAST_MON: $LAST_MON"
  echo "TWO_MON_AGO: $TWO_MON_AGO"
}

date_cmd
months
