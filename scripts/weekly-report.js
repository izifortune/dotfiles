const { readFile, writeFile } = require('fs');
const { basename } = require('path');
const { promisify } = require('util');
const pRead = promisify(readFile);
const pWrite = promisify(writeFile);


const main = async () => {
  const res = {};
  for (let arg of process.argv.slice(2)) {
    const tmp = await pRead(arg, 'utf-8');
    res[basename(arg)] = 
      tmp.split('\n')
      .filter(el => {
        return el.indexOf('[x]') > -1 || el.indexOf('[X]') > -1;
      })
  }
  return res;
}

(async () => {
  console.log(new Date().toISOString().split('T')[0]);
  // Get start of the week
  // Get end of the week
  // Get the fies
  const data = await main();
  console.log(data);
  // await pWrite(`${process.argv[2]}-out.csv`, data, 'utf-8');
})()
