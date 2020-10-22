function FindProxyForURL(url, host) {
  if (isResolvable("choaemtst12") && !isResolvable(host)) {
    alert("Match internal ryanair")
    return "PROXY 10.11.19.40:8080; HTTP 10.11.19.40:8080; HTTPS 10.11.19.40:8080; DIRECT";
  }

  if (isResolvable("choaemtst12") && isResolvable(host)) {
    if (shExpMatch(host, "*.ryanair.com")) {
      alert('Match ryanair domain')
        return "PROXY 10.11.19.40:8080; HTTP 10.11.19.40:8080; HTTPS 10.11.19.40:8080; DIRECT";
    }
  }

  alert('No proxy needed')
  // by default use no proxy
  return "DIRECT";
}
