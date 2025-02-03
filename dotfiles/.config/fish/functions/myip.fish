function myip --description 'Current external IP address'
    set -l RESP (curl --silent --location -H 'Accept: application/json' https://api.kaiwells.me/myip; or '{"ip": "disconnected"}')
    echo $RESP | jq -r '.ip'
end
