const { exec } = require("node:child_process");
const loggroups = [
  "/aws/cloudfront/function/FR-PROD-MARKET-REDIRECT-FUNCTION",
  "/aws/lambda/us-east-1.FR-PROD-SHIELD-AVAILABILITY-LE",
  "/aws/lambda/us-east-1.FR-SINGLE-API-PROD-OriginRequest",
  "/aws/lambda/us-east-1.fr-PROD-homepage-sec-headers-function",
  "/aws/lambda/us-east-1.FR-SEC-HEADERS-PROD-AppViewerResponseLambda",
  "/aws/lambda/us-east-1.fr-prod-2-frontend-release",
  "/aws/cloudfront/function/FR-PROD-LINKBRIDGE-FUNCTION",
];
const edges = [
  "us-east-1",
  "us-east-2",
  "eu-central-1",
  "eu-west-1",
  "eu-west-2",
  "ap-southeast-1",
  "ap-south-1",
];

for (group of loggroups) {
  for (zone of edges) {
    console.log(group, zone);
    exec(
      ` aws logs put-retention-policy --log-group-name ${group}  --retention-in-days 7 --region ${zone}`
    );
  }
}
