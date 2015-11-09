`timescale 10ps/1ps

module tbench;

    `include "tb/clk_common.h"
    `include "tb/instance_0.h"
    `include "tb/task_lsfr.h"
    `include "tb/fmonitor.h"

    initial begin
        CLK <= 0;
        @(posedge CLK) #DELAY;
            set_seed(8'h15);
        /* @(posedge CLK); */
        #(100 * CYCLE)    $finish();
    end


endmodule
