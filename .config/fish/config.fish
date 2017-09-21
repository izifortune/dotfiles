source ~/.fish_aliases

function pythonserve
  if [ "$1" != "" ]
    then
      python -m SimpleHTTPServer $1
  else
    python -m SimpleHTTPServer 8000
  end
end

function toggle_proxy
  if [ -z "$http_proxy" ]
    echo "setting up proxy";
    set -g -x http_proxy 'http://proxy01:8080'
    set -g -x https_proxy 'http://proxy01:8080'
    set -g -x HTTP_PROXY 'http://proxy01:8080'
    set -g -x HTTPS_PROXY 'http://proxy01:8080'
  else
    echo "removing up proxy";
    set -g -x http_proxy ''
    set -g -x https_proxy ''
    set -g -x HTTP_PROXY ''
    set -g -x HTTPS_PROXY ''
  end
end

set -gx PATH ~/Library/Python/2.7/bin $PATH
