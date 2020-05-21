


conda() {
  load_conda
  conda "$@"
}
python() {
  load_conda
  python "$@"
}
ipython() {
  load_conda
  ipython "$@"
}
pip() {
  load_conda
  pip "$@"
}
disable_conda() {
  echo "Remove all Conda aliases. Now you can use the default python interperter"
  unset -f conda
  unset -f python
  unset -f ipython
  unset -f pip
  unset -f load_conda
}


# use conda ###################################################################
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
load_conda() {
  echo "Loading Conda environment..."
  unset -f conda
  unset -f python
  unset -f ipython
  unset -f pip
  unset -f load_conda
  __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/bremme/.miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      \eval "$__conda_setup"
  else
      if [ -f "/home/bremme/.miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/bremme/.miniconda3/etc/profile.d/conda.sh"
          CONDA_CHANGEPS1=false conda activate base
      else
          \export PATH="/home/bremme/.miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
}


# use system python 2

# user system python 3

# user pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"