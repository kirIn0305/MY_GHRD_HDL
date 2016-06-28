/*================================================================================
| local_memory
|---------------------------------------------------------------------------------
| Block name  : local memory
| Version     : 1.0
| Description :
|     - 
|
|---------------------------------------------------------------------------------
| Created by  : 
\===============================================================================*/

`default_nettype none

module local_memory (MCLK, data, rdaddress, wraddress, wren, q);

   `include "global.h" 

    input wire MCLK;
    input wire [W_WIDTH-1:0] data;
    input wire [W_ADDR-1:0] rdaddress;
    input wire [W_ADDR-1:0] wraddress;
    input wire wren;
    output wire q;


    //====================== Wire and Reg ======================
    wire [W_WIDTH_INT-1:0] q_high;
    wire [W_WIDTH-1-W_WIDTH_INT:0] q_low;
    wire [W_WIDTH-1:0] q_all; //q_high + q_low
    

    //================================================================================
    // Logic
    //================================================================================


    sram_high RAM_H(.clock(MCLK),
                    .data(data[W_WIDTH-1:W_WIDTH-1 - W_WIDTH_INT]),
                    .rdaddress(rdaddress),
                    .wraddress(wraddress),
                    .wren(wren),
                    .q(q_high));

    sram_low RAM_L(.clock(MCLK),
                    .data(data[W_WIDTH-1 - W_WIDTH_INT:0]),
                    .rdaddress(rdaddress),
                    .wraddress(wraddress),
                    .wren(wren),
                    .q(q_low));

    defparam RAM_H.init_file = "rom_test_H.mif";
    defparam RAM_L.init_file = "rom_test_L.mif";

    assign q_all = {q_high, q_low};
    assign q = q_all[0];

endmodule

`default_nettype wire
