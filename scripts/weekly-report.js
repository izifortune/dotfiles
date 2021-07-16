const { readFile, writeFile } = require("fs");
const { basename } = require("path");
const { promisify } = require("util");
const pRead = promisify(readFile);
const pWrite = promisify(writeFile);

// Get first week date and last
const getWeekDays = (date) => {
  let curr = new Date(date); // get current date
  const first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
  const last = first + 4; // last day is the first day + 6

  const firstday = new Date(curr.setDate(first));
  return [
    firstday.toISOString().split("T")[0],
    new Date(firstday.setDate(first + 1)).toISOString().split("T")[0],
    new Date(firstday.setDate(first + 2)).toISOString().split("T")[0],
    new Date(firstday.setDate(first + 3)).toISOString().split("T")[0],
    new Date(firstday.setDate(first + 4)).toISOString().split("T")[0],
  ];
};

const getOpenTasks = async (date) => {
  try {
    const diary = await pRead(
      `../code/knowledge/content/diary/${date}` + ".md",
      "utf-8"
    );
    return diary
      .split("\n")
      .filter((el) => {
        return el.indexOf("[ ]") > -1;
      })
      .map((el) => `${el}  [[${date}]]`);
  } catch (e) {
    console.log(`⚠ No entries for for ${date}`);
    return [];
  }
};

const main = async () => {
  const weekDays = getWeekDays(process.argv[2]);
  const openTasks = await Promise.all(
    weekDays.map((el) => {
      return getOpenTasks(el);
    })
  );
  console.log(openTasks.flat());
};

(async () => {
  await main();
})();
