function myip --description 'Current external IP address'
    argparse 4/ipv4 6/ipv6 -- $argv; or return

    set -l URL 'https://myip-proud-surf-2427.fly.dev/'
    set CURL_CMD "curl --silent -H 'Accept: application/json' $URL"
    if set -ql _flag_ipv4
        set CURL_CMD "curl -g -4 --silent -H 'Accept: application/json' $URL"
    end
    if set -ql _flag_ipv6
        set CURL_CMD "curl -g -6 --silent -H 'Accept: application/json' $URL"
    end

    set -l RESP (eval "$CURL_CMD"; or '{"ip": "disconnected"}')
    echo $RESP | jq -r '.ip'
end
