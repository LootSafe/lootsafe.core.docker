if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: Docker Compose is Not Installed!!! Install it Dawg' >&2
  exit 1
fi

git clone git@github.com:LootSafe/lootsafe.core.git
cd lootsafe.core
git submodule update --init --recursive
cd ../
