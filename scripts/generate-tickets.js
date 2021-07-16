/*
 * Set JIRA_USER and JIRA_PASS environment variables
 * Modify `multi-tickets.json` with the template necessary
*/

const readline = require('readline');
const https = require('https');
const { readFile } = require('fs').promises;

const teamcontacts = ["faleirot", "cacerespradoa", "aggarwala", "dudynskyim", "brylam", "sanchezjl", "shpaka", "shpakp"];
const linkedIssues = [];

let auth = `${process.env.JIRA_USER}`;

const createIssueOptions = {
  hostname: 'jira.ryanair.com',
  port: 443,
  path: '/rest/api/2/issue/',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  }
};

const linkIssueOptions = {
  hostname: 'jira.ryanair.com',
  port: 443,
  path: '/rest/api/2/issueLink',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  }
};

const linkIssueData = {
  type: {
    name: "Relates"
  },
  inwardIssue: {
    key: ''
  },
  outwardIssue: {
    key: ''
  }
};

const sendRequest = (options, data) => 
  new Promise((resolve, reject) => {
    const req = https.request(options, res => {
      res.on('data', d => {
        resolve(JSON.parse(d));
      });
      res.on('error', d => {
        reject(d);
      });
    });

    req.write(JSON.stringify(data));
    req.end();
  });

(async () => {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  })

  rl.stdoutMuted = true;

  rl.query = "Password : ";


  rl.question(rl.query, async (password) => {
    try {
      rl.close();
      auth += `:${password}`;
      createIssueOptions.auth = auth;
      linkIssueOptions.auth = auth;
      const data = await readFile('multi-tickets.json', 'utf8');
      for (contact of teamcontacts) {
        const ticket = JSON.parse(data);
        ticket.fields.assignee.name = contact;
        const jiraIssue = await sendRequest(createIssueOptions, ticket);
        console.log(jiraIssue)
        linkedIssues.push(jiraIssue.key);
      }
      for ([i, v] of linkedIssues.entries()) {
        if (i == 0) {
          linkIssueData.inwardIssue.key = v;
        } else {
          linkIssueData.outwardIssue.key = v;
          await sendRequest(linkIssueOptions, linkIssueData);
        }
      }
    } catch(e) {
      console.log(e);
    }
  });

  rl._writeToOutput = function _writeToOutput(stringToWrite) {
  if (rl.stdoutMuted)
    rl.output.write("\x1B[2K\x1B[200D"+rl.query+"["+((rl.line.length%2==1)?"=-":"-=")+"]");
  else
    rl.output.write(stringToWrite);
};

})();

