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

const command = `open "https://${url}/projects/${project}/repos/${repo}/pull-requests?create&targetBranch=refs/heads/master&sourceBranch=refs/heads/${branch}"`;
execSync(command);
