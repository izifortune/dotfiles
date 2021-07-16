title=$1
description=$2
issutype=$3

teamcontacts=("meeseeks", "bazinga", "scrumdogs", "spaceinvaders", "kakauko", "kabuki", "wanderlust", "dragonflies")

for t in ${teamcontacts[@]}; do
  echo $t
  http -a $JIRA_USER:$JIRA_PASS POST https://jira.ryanair.com/rest/api/2/issue/ \
    "Content-Type:application/json" \
    fields:=@multi-tickets-${t}.json
done

