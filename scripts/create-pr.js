#!/usr/bin/env node
const { execSync } = require("child_process");

const branch = execSync("git branch --show-current")
  .toString()
  .trim();
let origin = execSync("git config --get remote.origin.url").toString();

let [url, project, repo] = origin
  .trim()
  .split("@")[1]
  .replace(".git", "")
  .split("/");

url = url.split(":")[0];
url = url.trim();
project = project.trim();
repo = repo.trim();

// Open PR in browser
const command = `open "https://${url}/projects/${project}/repos/${repo}/pull-requests?create&targetBranch=refs/heads/master&sourceBranch=refs/heads/${branch}"`;
execSync(command);

// Change jira ticket status
const message = execSync('git log -1 --pretty=%B').toString();
try {
  const ticket = message.match(/#(.*)/)[1];
  execSync(`jira issue move ${ticket} "In Progress"`)
} catch (e) {
  console.log('no ticket found');
}
