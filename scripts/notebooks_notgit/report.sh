jupyter nbconvert stash-weekly.ipynb --no-input --no-prompt --to pdf
mv stash-weekly.pdf ~/code/knowledge/content/ryanair/cloud-reports/$1-stash.pdf
jupyter nbconvert jira-weekly.ipynb --no-input --no-prompt --to pdf
mv jira-weekly.pdf ~/code/knowledge/content/ryanair/cloud-reports/$1-jira.pdf
jupyter nbconvert cloudfront-weekly.ipynb --no-input --no-prompt --to pdf
mv cloudfront-weekly.pdf ~/code/knowledge/content/ryanair/cloud-reports/$1-cloudfront.pdf
jupyter nbconvert weekly-sca.ipynb --no-input --no-prompt --to pdf
mv weekly-sca.pdf ~/code/knowledge/content/ryanair/cloud-reports/$1-sca.pdf
