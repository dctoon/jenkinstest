

# Export RELEASE env var
export RELEASE=1

# Verifies that is running from the right directory
if ! [ -e tools/deploy.sh ]; then
  echo >&2 "Please run tools/deploy.sh from the repo root"
  exit 1
fi

# Func to validate semver
validate_semver() {
  if ! [[ $1 =~ ^[0-9]\.[0-9]+\.[0-9](-.+)? ]]; then
    echo >&2 "Version $1 is not valid! It must be a valid semver string like 1.0.2 or 2.3.0-beta.1"
    exit 1
  fi
}


CURRENT_VERSION=$(node -p "require('./package').version")

validate_semver $CURRENT_VERSION