set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx PATH $PATH $HOME/.local/bin

# pyenv
status --is-interactive; and source (pyenv init -|psub)
set -gx PYENV_SHELL fish

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# spacefish
set SPACEFISH_KUBECONTEXT_SHOW false
set SPACEFISH_PACKAGE_SHOW false
set SPACEFISH_NODE_SHOW false
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_RUBY_SHOW false

# awscli completion
#complete -c aws -f -a '(begin; set -lx COMP_SHELL fish; set -lx COMP_LINE (commandline); /usr/local/bin/aws_completer; end)'

