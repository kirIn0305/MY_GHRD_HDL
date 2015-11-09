integer mcd;

initial begin
mcd = $fopen("lsfr.csv");
$fstrobe(mcd, "time,lsfr");
end

always @(posedge CLK) begin
    $fdisplay(mcd,"%d,%h", $time, rand_out);
end
