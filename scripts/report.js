const { readFile, writeFile } = require('fs');
const { promisify } = require('util');
const pRead = promisify(readFile);
const pWrite = promisify(writeFile);

const main = async () => {
  const res = await pRead(process.argv[2], 'utf-8');
  return res.split('\n')
    .filter(el => {
    return el.indexOf('ARCHIVED') === -1;
  });
}

(async () => {
  const data = await main();
  await pWrite(`${process.argv[2]}-out.csv`, data, 'utf-8');
})()
