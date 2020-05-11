#! /bin/bash

function __parse_args
{
    grep --ignore-case ${1} /proc/version > /dev/null
}

if   __parse_args "arch";   then install_command="sudo pacman -Syu"
elif __parse_args "ubuntu"; then install_command="sudo apt update && sudo apt install"
elif __parse_args "fedora"; then install_command="sudo dnf install" #TODO finish this and below
elif __parse_args "centos"; then install_command="sudo yum install"
elif __parse_args "suse";   then install_command="sudo zypper install git"
elif __parse_args "redhat"; then install_command="sudo rpm --install git"
else echo "Error: Can't find out distribution of Linux" && exit 1
fi

echo -e "export install_command=\"${install_command}\"" > ${HOME}/.install_command

# Then
# source ${HOME}/.install_command

exit 0
