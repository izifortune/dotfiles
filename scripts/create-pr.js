#!/usr/bin/env node
const { execSync } = require("child_process");

const branch = execSync("git branch --show-current")
  .toString()
  .trim();
let origin = execSync("git config --get remote.origin.url").toString();

console.log(origin);

let [url, project] = origin
  .trim()
  .split("@")[1]
  .replace(".git", "")
  .split("/");

[url, workspace] = url.split(":");
url = url.trim();
project = project.trim();

console.log(url, project, workspace);

// Open PR in browser
const command = `open "https://${url}/${workspace}/${project}/pull-requests/new?dest=master&source=${branch}"`;
execSync(command);

// Change jira ticket status
const message = execSync('git log -1 --pretty=%B').toString();
try {
  const ticket = message.match(/#(.*)/)[1];
  execSync(`jira issue move ${ticket} "In Progress"`)
} catch (e) {
  console.log('no ticket found');
}
