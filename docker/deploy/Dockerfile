FROM treyedocker/debian_elixir_deploy:latest

RUN mkdir /home/elixir
COPY whats_where_release.zip /home/elixir/
RUN cd /home/elixir && unzip whats_where_release.zip
ENV ELIXIR_VERSION=1.10.1 \
      LANG=en_US.utf8 \
      LANGUAGE=en_US.utf8 \
      LC_ALL=en_US.utf8
COPY docker/deploy/start_server /home/elixir/whats_where/
RUN chmod u+x /home/elixir/whats_where/start_server
WORKDIR /home/elixir/whats_where