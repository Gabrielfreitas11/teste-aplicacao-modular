const fs = require('fs');

exports.importCsvData = async () => {
  const data = fs.readFileSync('data/world-cities.csv', 'utf8').split('\n');

  return data.map((x) => x.split(','));
};
