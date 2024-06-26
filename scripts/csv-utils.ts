import { parse } from 'csv-parse';
import { stringify } from 'csv-stringify/sync';
import { createReadStream } from 'fs';
import { writeFile } from 'fs/promises';
import { finished } from 'stream/promises';

export const readCSV = async (path: string) => {
  const records: any = [];

  console.log(path);
  const parser = createReadStream(path).pipe(
    parse({
      columns: true,
      group_columns_by_name: true,
      relax_column_count: true,
      trim: true,
      skip_empty_lines: true,
    }),
  );

  parser.on('readable', () => {
    let record: any;
    while ((record = parser.read()) !== null) {
      // Work with each record
      records.push(record);
    }
  });

  await finished(parser);

  console.log('CSV file successfully processed');
  return records;
};

export const writeToCSV = async (file: string, data: any) => {
  await writeFile(file, stringify(data, { header: true }), 'utf8');
  console.log('Data appended to CSV file successfully');
};

