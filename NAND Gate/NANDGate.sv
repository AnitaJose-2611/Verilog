module tb;
  reg a;
  reg b;
  wire out;
  NANDGate uut1(.a(a) , .b(b) , .out(out));
  initial begin
    a = 0 ; b = 0;
    #10;
    a = 0 ; b = 1;
    #10;
    a = 1 ; b = 0;
    #10;
    a = 1 ; b = 1;
    #10;
  end
  initial begin
    $monitor("a = %0d \t b = %0d \t out = %0d" , a , b , out);
  end
endmodule  
