http -a $JIRA_USER:$JIRA_PASS POST https://jira.ryanair.com/rest/api/2/issue/ \
"Content-Type:application/json" \
fields:='{"project": { "key": "TP"},
"assignee": {"name": "barahonab"},
"summary": "Tracking Boxever interactions",
"description": "We should track boxever API responses in NR.\n The code was already developed in the homepage https://stash.ryanair.com/projects/RA/repos/homepage.ryanair.com/browse/src/common/services/performance-tracking.service.ts.\n It should be included as part of the NR common component and then added to the seats page to measure the callFlow performance", 
"labels": ["technical-fe"],
"issuetype": {"name": "Bug"}}'

