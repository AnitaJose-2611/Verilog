module tb;
  reg a;
  wire out;
  NOTGate uut1(.a(a) , .out(out));
  initial begin
    a = 0;
    #10;
    a = 1;
    #10;
  end
  initial begin
    $monitor("a = %0d \t out = %0d" , a , out);
  end
endmodule
