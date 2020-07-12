#!/bin/bash
# fish shell にdocker/docker-compose のcompletion を有効化する

mkdir -p ~/.config/fish/completions

# docker
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
# docker-compose
curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/docker-compose.fish

