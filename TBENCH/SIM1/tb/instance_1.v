reg [7:0]  address;
reg [18:0]  data;
reg wren;
wire q;

local_memory RAM_0(.MCLK(CLK),
                   .data(data),
                   .rdaddress(address),
                   .wraddress(address),
                   .wren(wren),
                   .q(q));


    initial begin
        $dumpfile("./test.vcd");
        $dumpvars(0,RAM_0);
    end
