FROM silviosilva/ubuntu:22.04 AS base

RUN  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
| gpg --dearmor --output /usr/share/keyrings/postgresql-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/postgresql-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt jammy-pgdg main" \
  | tee /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && \
  apt-get install \
    postgresql-client-15 \
    --yes

FROM base

ENTRYPOINT [ "/usr/bin/psql" ]
