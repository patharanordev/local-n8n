#!/bin/sh
(podman compose -f docker-compose.podman.yml down || :) && \
(podman rmi -f $(podman images -f 'dangling=true' -q) || :) && \
(podman network create localnet || :) && \
podman compose -f docker-compose.podman.yml up --build
