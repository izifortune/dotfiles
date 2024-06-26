//@ts-nocheck
const { writeFile } = require('fs').promises;
// multiple resources
// const apikey = 'ZC7n6fd5liAnMbXc1SxXeENtZQrkbjkk'
// const apiSecret = 'xSGCmEQlei8J7gjGZZ1ZHc4ZGfzX_UN7qg9PUH1743oM2IISbRUXtn90Frlxla2D'

// const apikey = 'SYIPwIsKsCOerqhNbMyWOJ5lOzcuYWXh'
// const apiSecret = 'Zb7tTDS6osCXDB8pOdzZIeHZ-YVGAv8TacVTNAhvcNGeamCjOQBAb1T-YGAc3Ml1'
//
const apikey = '7gWO7x0MFdTKtdcZuBbinmM5fb98YzXy'
const apiSecret = 'XvTIllUPFESb6mbIlJRQoZStorbtElCuHjx_7d7eBJtrRgMncblZhxNrrtilV7lw'

interface Export {
  exports: [{
    url: string;
  }]
}

const getAccessToken = async (): Promise<string> => {
  const res = await fetch('https://auth.sitecorecloud.io/oauth/token', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams({
      client_id: apikey,
      client_secret: apiSecret,
      grant_type: 'client_credentials',
      audience: 'https://api.sitecorecloud.io',
    })
  }).then(res => res.json())
  console.log(res);
  return res;
}


const getLatestExport = async (token): Promise<Export> => {
  const res = await fetch('https://api-engage-eu.sitecorecloud.io/v2/audienceExports/definitions/test/latestExport', {
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json',
    }
  }).then(res => res.json())
  return res;
  // TODO save files
  // {
  //   "executionRef": "fe351e84-3504-4668-8e5f-574d320b9679",
  //   "definitionRef": "d6c5335a-4028-49c0-8d55-a534e89127c9",
  //   "friendlyId": "daily_loyalty_members",
  //   "clientKey": "pqsPERS3lw12v5a9rrHPW1c4hET73GxQ",
  //   "expireAt": "2024-11-05T12:08:00.145Z",
  //   "numberOfFiles": 2,
  //   "totalSizeKB": 54,
  //   "exports": [
  //     {
  //       "url": "https://sitecore-cdp-...",
  //       "sizeKB": 52
  //     },
  //     {
  //       "url": "https://sitecore-cdp-...",
  //       "sizeKB": 2
  //     }
  //   ]
  // }
}

const downloadExport = async (url: string) => {
  const res = await fetch(url).then(res => res.body)
  return res;
}

const saveExport = async (name: string, blob: any) => {
  await writeFile(name, blob)
}
(async () => {
  const accessToken = await getAccessToken();
  const lastExport = await getLatestExport(accessToken.access_token);
  for (const index of lastExport.exports.keys()) {
    const exportChunk = lastExport.exports[index];
    console.log('Downloading export ', index, ' of ', lastExport.exports.length)
    const output = await downloadExport(exportChunk.url);
    await saveExport(`./boxever-export/${index}-export.json.gz`, output);
    console.log('saved file', index)
  }
})()
