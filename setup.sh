#!/bin/sh -eu

####################
# Checking Option
####################

fflag=""

while (( $# > 0 ))
do
  case "$1" in
    -*)
      if [[ "$1" =~ 'f' ]]; then
        fflag="-f"
      fi
      shift
      ;;
    +)
      ((++argc))
      argv=("${argv[@]}" "$1")
      shift
      ;;
  esac
done


####################
# Checking OS
####################
if [ `uname` = "Darwin" ]; then
  echo "Start Initializing for Machintosh"
  source ./SetupFiles/SetupMackintosh_Standard.sh
  if [ "$fflag" = "-f" ]; then
    sh ./SetupFiles/SetupMacintosh_Extra.sh
  fi
elif [ `uname` = "Linux" ]; then
  ## Check what distribution
  if [ -e /etc/debian_version ] ||
     [ -e /etc/debian_release ]; then
    ## Check Ubuntu or Debian
    if [ -e /etc/lsb-release ]; then
      ## Ubuntu
      distri_name="ubuntu"
    else
      ## Debian
      distri_name="debian"
    fi
  elif [ -e /etc/fedora-release ]; then
    # Fedra
    distri_name="fedora"
  elif [ -e /etc/redhat-release ]; then
    # CentOS
    distri_name="redhat"
  elif [ -e /etc/turbolinux-release ]; then
    # Turbolinux
    distri_name="turbol"
  elif [ -e /etc/SuSE-release ]; then
    # SuSE Linux
    distri_name="suse"
  elif [ -e /etc/mandriva-release ]; then
    # Mandriva Linux
    distri_name="mandriva"
  elif [ -e /etc/vine-release ]; then
    # Vine Linux
    distri_name="vine"
  elif [ -e /etc/gentoo-release ]; then
    # Gentoo Linux
    distri_name="gentoo"
  else
    # Other
    echo "unkown distribution"
    distri_name="unkown"
  fi
fi
