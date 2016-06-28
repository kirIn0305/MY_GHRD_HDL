task write_ram;
input [7:0] value_address;
input [18:0] value_data;
begin
    wren = 1'b1;
    data = value_data;
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
        wren = 1'b0;
end
endtask
