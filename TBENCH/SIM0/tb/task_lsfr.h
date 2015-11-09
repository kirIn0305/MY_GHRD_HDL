task set_seed;
input [7:0] value_seed;
begin
    rst = 1'b0;
    seed = value_seed; 
    @(posedge CLK) #DELAY;
        seed = 8'bz; rst = 1'b1;
end
endtask
