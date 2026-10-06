# add to path if not already done so
addpath() {
  if [[ ":$PATH:" != *":$1:"* ]] ; then
    PATH=$1:$PATH
  fi
}

showpath() {
  echo $PATH
}
