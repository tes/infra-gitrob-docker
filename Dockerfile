# Use the Ubuntu 14.04.3 as the base image
FROM ubuntu:14.04.3

# Own up to this
MAINTAINER khushil "khushil.dep@daemondreams.co.uk"

# Basics we need in this container
RUN apt-get update && \
    apt-get -y install ruby1.9.3 git libpq-dev build-essential postgresql-server-dev-all

# Install bundler
RUN gem install bundler

# Install the gem we require and deps
RUN gem install gitrob

# Copy in the start script
COPY gorob.sh /usr/local/bin/

# Set the correct exec perms
RUN chmod +x /usr/local/bin/gorob.sh

# Accept agreement for the particular version that got installed (bash fu baby!)
RUN touch /var/lib/gems/1.9.1/gems/gitrob-$(gem list | grep -E gitrob | awk '{print $2}' | tr -d '(' | tr -d ')')/agreement

# Clean up
RUN apt-get -y purge build-essential
RUN apt-get clean

# Docker 'networking' - yeah sure
EXPOSE 9393

# Docker 'main()'
ENTRYPOINT ["/usr/local/bin/gorob.sh"]