#!/bin/sh
(podman compose -f docker-compose.podman.yml down || :) && \
(podman rmi -f $(podman images -f 'dangling=true' -q) || :)