module tb;
  reg a;
  reg b;
  wire sum;
  wire c_out;
  HalfAdder uut1(.a(a) , .b(b) , .sum(sum) , .c_out(c_out));
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
    $monitor("a = %0d \t b = %0d \t sum = %0d \t c_out = %0d" , a , b , sum , c_out);
  end
endmodule
