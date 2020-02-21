FROM treyedocker/debian_elixir_1_10_1:latest

ENV ELIXIR_VERSION=1.10.1 \
      LANG=en_US.utf8 \
      LANGUAGE=en_US.utf8 \
      LC_ALL=en_US.utf8

COPY . /home/elixir/whats_where
COPY docker/testing/testing_status_report /home/elixir/whats_where/
COPY docker/testing/test.exs /home/elixir/whats_where/config/
WORKDIR /home/elixir/whats_where
SHELL ["/bin/bash", "-cl"]
RUN mix deps.get && pushd assets && yarn install && popd && pushd test_reports && yarn install && popd
