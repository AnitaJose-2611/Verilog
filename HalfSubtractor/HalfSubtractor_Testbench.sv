module tb;
  reg a , b;
  reg diff , b_out;
  HalfSubtractor uut1(.a(a) , .b(b) , .diff(diff) , .b_out(b_out));
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
    $monitor("a = %0d \t b = %0d \t diff = %0d \t b_out = %0d" , a , b , diff , b_out);
  end
endmodule
