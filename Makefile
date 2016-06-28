SIM_DIR=SIM1

nogui:
	cd ./TBENCH/${SIM_DIR}; \
	../../SCRIPT/run_msim.sh $(SIM_DIR) -nogui
gui:
	cd ./TBENCH/${SIM_DIR}; \
	../../SCRIPT/run_msim.sh $(SIM_DIR) -gui
icarus:
	cd ./TBENCH/${SIM_DIR}; \
	../../SCRIPT/run_icarus.sh $(SIM_DIR)

tedit:
	cd ./TBENCH/${SIM_DIR}; \ 
	vim tb/tbench.v
