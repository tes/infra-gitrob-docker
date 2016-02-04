#!/usr/bin/env /bin/bash

echo "---" >> /root/.gitrobrc
echo "github_access_tokens:" >> /root/.gitrobrc
echo "- $GITHUB_ACCESS_TOKEN" >> /root/.gitrobrc
echo "sql_connection_uri: postgres://$GITROB_PG_USERNAME:$GITROB_PG_PASSWORD@$GITROB_PG_SERVER:$GITROB_PG_PORT/gitrob" >> /root/.gitrobrc

echo -e "
WARNING
=======
Gitrob is designed to help you stop doing stupid things. If you use any information
found through this tool for malicious purposes that are not authorized by
the organization, you are violating the terms of use and license of this
tool. By using this application, you agree to the terms of use and that you will use
this tool for lawful purposes only.

Don't be an ass with this tool, or in general."

if [[ $GITROB_MODE = "server" ]]; then
    gitrob -b $GITROB_SERVER_ADDRESS -s -t 50 -p $GITROB_SERVER_PORT
elif [[ $GITROB_MODE = "scan" ]]; then
    gitrob -b $GITROB_SERVER_ADDRESS --no-color --no-server --no-banner -o $GITHUB_ORG
fi
