`timescale 10ps/1ps

module tbench;

    `include "tb/clk_common.h"
    `include "tb/instance_1.v"
    `include "tb/task_ram.v"
    `include "tb/fmonitor.h"

    initial begin
        CLK <= 0;
        @(posedge CLK) #DELAY;
        write_ram(8'b0,19'd1);
        read_ram(8'b0);
        read_ram(8'b1);
        write_ram(8'b1, 19'd2);
        read_ram(8'd5);
        write_ram(8'd2, 19'd3);
        read_ram(8'd2);
        read_ram(8'd0);
        read_ram(8'd1);

        /* @(posedge CLK); */
        #(10 * CYCLE)    $display("Simulaton done");
        $finish;
    end


endmodule
