task set_seed;
input [7:0] value_seed;
begin
    rst = 1'b0;
    seed = value_seed; 
    @(posedge CLK) #DELAY;
        seed = 8'bz; rst = 1'b1;
end
endtask

task write_ram;
input [7:0] value_address;
begin
    wren = 1'b1;
    data = 19'b3;
    address = value_address;
    @(posedge CLK) #DELAY
        wren = 1'b0;
end
endtask

task read_ram;
input [7:0] value_address;
begin
    wren = 1'b0;
    address = value_address;
    @(posedge CLK) #DELAY
end
endtask
