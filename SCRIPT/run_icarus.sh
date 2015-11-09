RTL_DIR="../../RTL/*"
TBENCH_DIR="./tb/tbench.v"

iverilog -o ./test.vpp ${TBENCH_DIR} ${RTL_DIR}
./test.vpp
gtkwave ./test.vcd
