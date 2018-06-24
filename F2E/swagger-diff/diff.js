
const fs = require('fs');

const conf = {
  path: {
    data: '/Users/yihua/data/nuclias',
  },
};

const files = fs.readdirSync(conf.path.data);
const dates = {};

files.forEach((file) => {
  // console.log('file:', file);

  const matched = file.match(/(.*)-(\d{8}).*/)
  
  if (matched) {
    const filename = matched[0];
    const type = matched[1];
    const date = matched[2];

    console.log(matched);

    if (! dates[date]) {
      dates[date] = {
        date: date,
      };
    }

    if (type === 'restful-api') {
      dates[date]['restful-api'] = filename;
    }

    if (type === 'json-diff') {
      dates[date]['json-diff'] = filename;
  }}
});

const result = {
  data: [],
};

Object.keys(dates).forEach((key) => {
  result.data.push(dates[key]);
});

console.log(result);

const index = JSON.stringify(result);

fs.writeFileSync(conf.path.data + '/restful-api-diff.json', index);


