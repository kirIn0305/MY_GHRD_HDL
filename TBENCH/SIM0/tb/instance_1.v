reg [7:0]  address;
reg [18:0]  data;
reg wren;
wire [18:0] q;

sram_high RAM_0(.address(address), .clock(CLK), .data(data), .wren(wren), .q(q));

initial begin
    $dumpfile("./test.vcd");
    $dumpvars(0,RAM_0);
end
