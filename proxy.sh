#/bin/sh

SERVICE="Wi-Fi" # or "Ethernet"
PROXY_HOST="0.0.0.0"
PROXY_PORT="8080"

while [[ $# > 0 ]]
do
  case "$1" in
    on)
      networksetup -setwebproxystate $SERVICE on
      networksetup -setwebproxy $SERVICE $PROXY_HOST $PROXY_PORT off
      networksetup -setsecurewebproxystate $SERVICE on
      networksetup -setsecurewebproxy $SERVICE $PROXY_HOST $PROXY_PORT off
      echo 'Web proxy is on'
    shift
    ;;
    off)
      networksetup -setwebproxystate $SERVICE off
      networksetup -setsecurewebproxystate $SERVICE off
      echo 'Web proxy is off'
    shift
    ;;
  esac
done
