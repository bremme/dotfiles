# not sure if this is required
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi


# add to path if not already done so
addpath() {
  if [[ ":$PATH:" != *":$1:"* ]] ; then
    PATH=$1:$PATH
  fi
}

showpath() {
  echo $PATH
}
