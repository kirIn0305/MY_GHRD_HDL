integer mcd;

initial begin
mcd = $fopen("mem.csv");
$fstrobe(mcd, "time, q");
end

always @(posedge CLK) begin
    $fdisplay(mcd,"%d,%h", $time, q);
end
