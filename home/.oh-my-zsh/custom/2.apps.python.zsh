export PYTHONBREAKPOINT=ipdb.set_trace

_pl() {
  if [ $# -eq 0 ]; then
    pip list
  else
    pip list | grep -i "$1"
  fi
}

alias p="python"
alias pl=_pl
# python install default
alias pid="pip install -U pip wheel ipython ipdb pytest flake8 flake8-isort pep8-naming flake8-docstrings flake8-bugbear pylint black isort"

PYCUSTOM_SYSPY2_ENV="py2"
PYCUSTOM_SYSPY3_ENV="py3"
PYCUSTOM_CONDA_ENV="conda"
PYCUSTOM_PYENV_ENV="pyenv"

export PYCUSTOM_ENVS=()

if [ -x "$(which python)" ]; then
  PYCUSTOM_ENVS+=( $PYCUSTOM_SYSPY2_ENV )
fi

if [ -x "$(which python3)" ]; then
  PYCUSTOM_ENVS+=( $PYCUSTOM_SYSPY3_ENV )
fi

if [ -f "$HOME/.miniconda3/etc/profile.d/conda.sh" ]; then
  PYCUSTOM_ENVS+=( $PYCUSTOM_CONDA_ENV )
fi

if [ -d "$HOME/.pyenv" ]; then
  PYCUSTOM_ENVS+=( $PYCUSTOM_PYENV_ENV )
  # run pyenv init --path only once
  export PYENV_ROOT="$HOME/.pyenv"

  export PATH_BEFORE_PYENV="$PATH"
  
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

export PYCUSTOM_OLD_PATH=$PATH
export PYCUSTOM_CUR_ENV=""

__display_help() {
  echo "pyact: easily switch between different Python environments."
  echo ""
  echo "Usage: pyact  [ENVNAME|help|list]"
  echo ""
  echo "ENVNAME         Activate any of the available envs: $PYCUSTOM_ENVS"
  echo
  echo "list            List available and active environment"
  echo "help            Display this help"
}

__list_envs() {
  echo "Available Python environments are"
  for e in ${PYCUSTOM_ENVS[@]}
  do
    if [ "$e" = "$PYCUSTOM_CUR_ENV" ]
    then
      echo "(*) $e"
    else
      echo "( ) $e"
    fi
  done
}

__deactivate_current_custom_python_env() {
  # restore old PATH
  export PATH=$PYCUSTOM_OLD_PATH

  case $PYCUSTOM_CUR_ENV in
    $PYCUSTOM_SYSPY2_ENV)
      echo "Deactivate system Python 2 environment"
      deactivate_syspy2
      ;;
    $PYCUSTOM_SYSPY3_ENV)
      echo "Deactivate system Python 3 environment"
      deactivate_syspy3
      ;;
    $PYCUSTOM_CONDA_ENV)
      echo "Deactivate Miniconda environment"
      deactivate_conda
      ;;
    $PYCUSTOM_PYENV_ENV)
      echo "Deactivate PyEnv environment"
      deactivate_pyenv
      ;;
    *)
      # echo "Unknown custom python environment: $PYCUSTOM_CUR_ENV"
      ;;
  esac
}

activate_custom_python_environment() {

  if [[ "$#" -eq "0" ]]; then
    __display_help
    return
  fi

  case $1 in
    $PYCUSTOM_SYSPY2_ENV)
      __deactivate_current_custom_python_env
      echo "Activate system Python 2 environment"
      activate_syspy2
      ;;
    $PYCUSTOM_SYSPY3_ENV)
      __deactivate_current_custom_python_env
      echo "Activate system Python 3 environment"
      activate_syspy3
      ;;
    $PYCUSTOM_CONDA_ENV)
      __deactivate_current_custom_python_env
      echo "Activate Miniconda environment"
      activate_conda
      ;;
    $PYCUSTOM_PYENV_ENV)
      __deactivate_current_custom_python_env
      echo "Activate PyEnv environment"
      activate_pyenv
      ;;
    "list")
      __list_envs
      return
      ;;
    "help")
      __display_help
      return
      ;;
    *)
      echo "Unknown custom Python environment: '$1'"
      __display_help
      return
      ;;
  esac

  # store selected custom env
  export PYCUSTOM_CUR_ENV=$1
}

# use conda ###################################################################
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
activate_conda() {
  __conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/.miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      \eval "$__conda_setup"
  else
      if [ -f "$HOME/.miniconda3/etc/profile.d/conda.sh" ]; then
          . "$HOME/.miniconda3/etc/profile.d/conda.sh"
          CONDA_CHANGEPS1=false conda activate base
      else
          \export PATH="$HOME/.miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
}
deactivate_conda() {
  # unset alias
  unset -f conda
  # unset environmental variables
  unset CONDA_EXE
  unset _CE_M
  unset _CE_CONDA
  unset CONDA_PYTHON_EXE
  unset CONDA_SHLVL
  unset CONDA_PREFIX
  unset CONDA_DEFAULT_ENV
  unset CONDA_PROMPT_MODIFIER
  unset CONDA_PYTHONBREAKPOINT
}

__activate_venv() {
  if [ -d "venv" ]; then
    source venv/bin/activate
  elif [ -d ".venv" ]; then
    source .venv/bin/activate
  fi
}

# use system python 2
activate_syspy2() {
  alias a="__activate_venv"
  alias da="deactivate"
}
deactivate_syspy2() {

}

# user system python 3
activate_syspy3() {
  alias python=python3
  alias pip=pip3
  alias a="__activate_venv"
  alias da="deactivate"
}
deactivate_syspy3() {
  unalias python
  unalias pip
}

# Activate pyenv virtual env with name of current directory
__activate_pyenv_virtualenv() {
  if [ "$#" -eq 0 ]; then
    pyenv activate "${PWD##*/}"
  else
    pyenv activate "$@"
  fi

}
# Uninstall pyenv virtual env with name of current directory
__remove_pyenv_virtualenv() {
  if [ "$#" -eq 0 ]; then
    	pyenv uninstall "${PWD##*/}"
  else
      pyenv uninstall "$@"
  fi
}
# create pyenv virtual env with name of current directory and current interperter
__make_pyenv_virtualenv() {
  # pyenv virtualenv [-f|--force] [VIRTUALENV_OPTIONS] [version] <virtualenv-name>
  venv_options="--upgrade-deps"

  if [ "$#" -eq 0 ]; then
    venv_name="${PWD##*/}"
    pyenv virtualenv "$venv_options" "$venv_name"
  else
    pyenv virtualenv "$venv_options" "$@"
  fi

  # activate environment
  __activate_pyenv_virtualenv
  # install/upgrade base pacakges
  pip install -U pip wheel

}

# user pyenv
activate_pyenv() {
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  eval "$(pyenv init -)"

  if [ -d "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv virtualenv-init -)"
  fi

  alias pyvenv="pyenv virtualenv"
  alias pls="pyenv versions"
  alias pgl="pyenv global"
  alias plo="pyenv local"
  alias pac="pyenv activate"
  alias pda="pyenv decativate"

  alias a="__activate_pyenv_virtualenv"     # activate pyenv venv
  alias da="pyenv deactivate"               # deactivate pyenv venv

  alias els="pyenv virtualenvs"             # list pyen venv's
  alias erm="__remove_pyenv_virtualenv"     # remove pyenv venv
  alias emk="."       # make pyenv venv
}
deactivate_pyenv() {
  export PATH="$PATH_BEFORE_PYENV"
  unset PYENV_ROOT
  unset PYENV_SHELL
  unset PYENV_VERSION
  unset PYENV_VIRTUALENV_DISABLE_PROMPT
  unalias pyvenv pls pgl plo pac pda els erm emk
}

alias pyact=activate_custom_python_environment


# activate the default environment
# pyact ${PYCUSTOM_ENVS[-1]} 2>&1 > /dev/null
pyact ${PYCUSTOM_ENVS[-1]}
