reg [7:0] seed;
reg rst;
wire [7:0] rand_out;

lsfr_eight lsft_eight_0(.MCLK(CLK), .MRST_N(rst), .SEED(seed), .LSFR_OUT(rand_out));

initial begin
    $dumpfile("./test.vcd");
    $dumpvars(0,lsft_eight_0);
end
