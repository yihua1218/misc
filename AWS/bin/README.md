# Scripts for managing AWS

# EC2

Shutdown all EC2 instances and RDS which matched keyword.

``` bash
$ aws --profile nuclias --region ap-northeast-1 autoscaling describe-auto-scaling-groups | jq '.AutoScalingGroups[].AutoScalingGroupName' | grep test2
```