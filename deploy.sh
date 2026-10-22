#!/bin/bash

ENV=""
VER=""
usage() {
 cat <<EOF
 Usage: deploy.sh [OPTIONS]

 Options:
  --env or -e  <name>        Target environment (dev, staging, prod)
  --version or -v <ver>     Version to deploy.Should be semantic (1.2.3, 1.12.3, ...)
  --help or -h              Show this help message and exit
EOF
}

while [ $# -gt 0 ]; do
 case $1 in
  -h|--help)
 	usage
	exit 0
	;;
  -e|--env)
	ENV="$2"
	case $ENV in
	  dev|DEV|staging|STAGING|prod|PROD)
	  	shift 2
		;;
	  *)
	        echo "Invalid environment '$ENV'. Valid values: dev, staging, prod" >&2
		exit 1
		;;
	esac
	;;
  -v|--version)
	VER="$2"
	if [[ $VER =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	  shift 2
	else
	  echo "Invalid version '$VER'. Valid values should match the semantic versioning" >&2
	  exit 1
	fi
	;;
  *)
	echo "Unknown option: $1" >&2
	usage
	exit 1
	;;
 esac
done
if [[ -z $ENV || -z $VER ]]; then
 echo "Please provide required parameters" >&2
 usage
 exit 1
else
 echo "Deploying version $VER to $ENV"
 exit 0
fi
