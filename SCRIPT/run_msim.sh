#!/bin/sh

if [ $# -ne 2 ]; then
    echo "select arguments is $#" 1>&2
    echo "Usage : $CMDNAME SIMULATION_DIRECTORY GUI_SELECT" 1>&2
    exit 1
fi

# RTL directory
RTL_DIR="../../RTL"

# TBENCH .v
# sim_file=$1

# SIM directory
sim_dir=$1
sim_file="./tb/tbench.v"
echo "Test Pattern = " $sim_dir


# make work dir
if [ ! -e ./work ]; then
    vlib ./work 
fi


# compile
vlog \
    +notimingchecks \
    -sv \
    -y ${RTL_DIR} \
    +incdir+${RTL_DIR}/+ \
    +libext+.v+ \
    ${sim_file}

# simulation
if [ "$2" = "-nogui" ]; then 
## if you use on CUI
vsim -c -keepstdout test_module 
# run -all
#vsim -c -keepstdout test_module <<EOF
#EOF
elif [ "$2" = "-gui" ]; then
## if you use on GUI
#vsim -gui test_module <<EOF
vsim -gui test_module 
# run -all
#EOF
else
	echo "boo, select window on or off"
fi
