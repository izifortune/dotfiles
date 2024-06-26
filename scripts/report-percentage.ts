#!/usr/bin/env ts-node

import { writeToCSV, readCSV } from './csv-utils';

(async () => {
  const file = process.argv[2];

  const data = await readCSV(file);

  data.sort((a: any, b: any) => {
    parseInt(a.total_sum) - parseInt(b.total_sum);
  })

  const filtered = data.filter((row: any) => {
    return row.message !== 'REWRITE'
  })

  const initial = parseInt(filtered[0].total_sum);
  for (const row of filtered) {
    row.percentage = ((parseInt(row.total_sum) / initial) * 100).toFixed(2);
  }

  console.log(filtered);
  await writeToCSV(`${file}.perc.csv`, filtered)
})();

