const urls = [
  "https://prodlogs-opendistro.fr151.ryanair.com/app/kibana#/dashboard/e0d5e2c0-405a-11eb-a854-299cafff8cfb?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-1w,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:!f,useMargins:!t),panels:!((embeddableConfig:(),gridData:(h:15,i:'8e4dbac0-3558-416f-9ca5-20018c265b2a',w:24,x:0,y:0),id:'9a95d5f0-4059-11eb-a854-299cafff8cfb',panelIndex:'8e4dbac0-3558-416f-9ca5-20018c265b2a',type:visualization,version:'7.4.2'),(embeddableConfig:(),gridData:(h:15,i:'14f81eb9-ae62-455d-afcf-26e3ae64427b',w:24,x:24,y:0),id:'084e0fe0-405a-11eb-a854-299cafff8cfb',panelIndex:'14f81eb9-ae62-455d-afcf-26e3ae64427b',type:visualization,version:'7.4.2')),query:(language:kuery,query:''),timeRestore:!f,title:CSP,viewMode:view)",
  "https://eu-west-1.console.aws.amazon.com/cloudwatch/home?region=eu-west-1#dashboards:name=Recaptcha",
];

// urls.forEach((el) => window.open(el, "_blank"));
const pUrls = urls.map((url) =>
  browser.tabs.create({
    url,
  })
);

Promise.all(pUrls).then(console.log);
