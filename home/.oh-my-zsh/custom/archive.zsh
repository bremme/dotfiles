# alias enterconda="enter_conda3_env"
# alias enteratompy="enter_atom_py"
# alias enteratomcpp="enter_atom_cpp"

# function enter_conda_env() {
#   export OLD_PATH=$PATH
#   export PATH=/home/bremme/miniconda3/bin:$PATH
#   source activate root
#   alias leaveconda="\
#     source deactivate &&\
#     export PATH=$OLDPATH &&\
#     unalias leaveconda3 &&\
#     echo 'Leaving conda Python 3 environment'"
# }

# function enter_atom_py() {
#   echo "Entering Atom Python environment"
#   export ATOM_HOME=/home/bremme/.atompy
#   alias leaveatompy="\
#     export ATOM_HOME=/home/bremme/.atom &&\
#     unalias leaveatompy &&\
#     echo 'Leaving Atom Python environment'"
# }
#
# function enter_atom_cpp() {
#     echo "Entering Atom C++ environment"
#   export ATOM_HOME=/home/bremme/.atomcpp
#   alias leaveatompy="\
#     export ATOM_HOME=/home/bremme/.atom &&\
#     unalias leaveatompy &&\
#     echo 'Leaving Atom Python environment'"
# }

# # program shortcuts
# if [ -x /usr/bin/ncmpcpp ]; then
#   alias mp="ncmpcpp"
# fi
