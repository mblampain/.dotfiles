#!/usr/bin/env bash

## Ubuntu based distro.
## working on 24.04LTS.


# Updating repos
sudo apt update -y && sudo apt upgrade -y

sudo apt install -y zsh

cat <<'EOF' > /tmp/bootstrap.zsh
#!/usr/bin/env zsh

sh ./deps.sh

sh ./style.sh

EOF

# Run the rest of the script in zsh
zsh /tmp/bootstrap.zsh