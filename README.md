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

`docker run -P -e "GITHUB_ACCESS_TOKEN=<your-github-tocken-here>" -e "GITROB_PG_USERNAME=<postgresql-username-for-database>" -e "GITROB_PG_PASSWORD=<postgresql-password-for username>" -e "GITROB_PG_SERVER=<postgresql-server-address>" -e "GITROB_PG_PORT=<postgresql-server-port>" -e "GITROB_SERVER_ADDRESS=<address-gitrob-should-bind-to>" -e "GITROB_SERVER_PORT=<port-gitrob-should-bind-to>" -e "GITHUB_ORG=<your-github-organization-name>" -e "GITROB_MODE=<scan>" tesglboal/gorob`

If you simply want to run the webserver included:

`docker run -P -e "GITHUB_ACCESS_TOKEN=<your-github-tocken-here>" -e "GITROB_PG_USERNAME=<postgresql-username-for-database>" -e "GITROB_PG_PASSWORD=<postgresql-password-for username>" -e "GITROB_PG_SERVER=<postgresql-server-address>" -e "GITROB_PG_PORT=<postgresql-server-port>" -e "GITROB_SERVER_ADDRESS=<address-gitrob-should-bind-to>" -e "GITROB_SERVER_PORT=<port-gitrob-should-bind-to>" -e "GITHUB_ORG=<your-github-organization-name>" -e "GITROB_MODE=<server>" tesglboal/gorob`

Ideally you would start and leave the 'server' running while you cron the 'scan' to the fequency you care about

## Licence

MIT