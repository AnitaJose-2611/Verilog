module tb;
  reg a , b , c_in;
  wire sum , c_out;
  FullAdder uut1(.a(a) , .b(b) , .c_in(c_in) , .sum(sum) , .c_out(c_out));
  initial begin
    a = 0 ; b = 0 ; c_in = 0;
    #10;
    a = 0 ; b = 0 ; c_in = 1;
    #10;
    a = 0 ; b = 1 ; c_in = 0;
    #10;
    a = 0 ; b = 1 ; c_in = 1;
    #10;
    a = 1 ; b = 0 ; c_in = 0;
    #10;
    a = 1 ; b = 0 ; c_in = 1;
    #10;
    a = 1 ; b = 1 ; c_in = 0;
    #10;
    a = 1 ; b = 1 ; c_in = 1;
    #10;
  end
  initial begin
    $monitor("a = %0d \t b = %0d \t c_in = %0d \ t sum = %0d \t c_out = %0d" , a , b , c_in , sum , c_out);
  end
endmodule
