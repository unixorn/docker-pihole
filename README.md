# docker-pihole-controller

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Funixorn%2Fdocker-pihole-controller%2Fbadge&style=plastic)](https://actions-badge.atrox.dev/unixorn/docker-pihole-controller/goto)

Command line controller for [pi-hole](https://pi-hole.net/).

Basically, I wanted a quick way to temporarily disable my piholes from the command line so I wouldn't have to hassle with opening a browser tab.

## Usage

`pihole-controller --server servername --password PASSWORD --seconds SECONDS_TO_DISABLE_PIHOLE`

The default number of seconds is 300.

You can also specify a settings file with --configuration-file=/path/to/yaml/file. Currently the only settings are `password` and `server`.

See the example `pihole-controller.yaml` in this repository for an example.
