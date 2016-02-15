# Docker gitrob

[gitrob](https://github.com/michenriksen/gitrob) is an awesome tool and we wanted to have a docker container for it. Our version tries to be as intelligent in it's setup and configuration as possible.

## Assumptions

* You've created a [personal access token](https://github.com/settings/applications) with relevant access levels.
* You've got a postgresql data container or service such as AWS RDS setup and configured.


## Building

* Clone the [repo](https://github.com/tes/infra-gitrob-docker) and move into the directory.
* Build the docker image:
  `docker build -t "tesglobal/gorob" .`

## Pull from DockerHub

`docker pull tesglobal/gorob`

## Engage!

If this is your first run, you should definately do a scan:

`docker run -P -e "GITHUB_ACCESS_TOKEN=<your-github-tocken-here>" -e "GITROB_PG_USERNAME=<postgresql-username-for-database>" -e "GITROB_PG_PASSWORD=<postgresql-password-for-username>" -e "GITROB_PG_SERVER=<postgresql-server-address>" -e "GITROB_PG_PORT=<postgresql-server-port>" -e "GITROB_SERVER_ADDRESS=<address-gitrob-should-bind-to>" -e "GITROB_SERVER_PORT=<port-gitrob-should-bind-to>" -e "GITHUB_ORG=<your-github-organization-name>" -e "GITROB_MODE=scan" tesglobal/gorob`

If you simply want to run the webserver included:

`docker run -d -P -e "GITHUB_ACCESS_TOKEN=<your-github-tocken-here>" -e "GITROB_PG_USERNAME=<postgresql-username-for-database>" -e "GITROB_PG_PASSWORD=<postgresql-password-for-username>" -e "GITROB_PG_SERVER=<postgresql-server-address>" -e "GITROB_PG_PORT=<postgresql-server-port>" -e "GITROB_SERVER_ADDRESS=<address-gitrob-should-bind-to>" -e "GITROB_SERVER_PORT=<port-gitrob-should-bind-to>" -e "GITHUB_ORG=<your-github-organization-name>" -e "GITROB_MODE=server" tesglobal/gorob`

Ideally you would start and leave the 'server' running (note the -d) while you cron the 'scan' to the fequency you care about

## TODO

- [ ] Stop running things as root
- [ ] Allow the option of linking a persitence container running postgresql

## Licence

The MIT License (MIT)

Copyright (c) 2016 TES Global

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
