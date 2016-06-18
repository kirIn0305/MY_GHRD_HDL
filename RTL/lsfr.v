/*================================================================================
| LFSR (Linear Feedback Shift Register)
|---------------------------------------------------------------------------------
| Description:
|     - 8bit Fibonacci LSFR
|     - feedback polynomial : x^8 + x^6 + x^5 + x^4 +1
|     - look about LFSR! : Wikipedia or Xilinx Efficient Shift Registers, LFSR...
|---------------------------------------------------------------------------------
| Created by : 
\===============================================================================*/

module lsfr_eight(MCLK, MRST_N,SEED, LSFR_OUT);

//================================================================================
// Declare Input and Output Pins
//================================================================================
    input MCLK;
    input MRST_N;
    input [7:0] SEED;
    
    output [7:0] LSFR_OUT;

//================================================================================
// Declare Wires and Reg
//================================================================================
    reg [7:0] LSFR_OUT_R;

//================================================================================
// Shift calculation
//================================================================================

   always @(posedge MCLK or negedge MRST_N) begin
       if(!MRST_N)
           LSFR_OUT_R <= SEED;
       else
           LSFR_OUT_R <= {LSFR_OUT_R[6:0], ( (LSFR_OUT_R[7] ^ LSFR_OUT_R[5]) ^ (LSFR_OUT_R[4] ^ LSFR_OUT_R[3]) )};
   end 

   assign LSFR_OUT = LSFR_OUT_R;

endmodule
