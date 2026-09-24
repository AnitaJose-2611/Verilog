module tb;
  reg a , b , b_in;
  wire diff , b_out;
  FullSubtractor uut1(.a(a) , .b(b) , .b_in(b_in) , .diff(diff) , .b_out(b_out));
  initial begin
    a = 0 ; b = 0 ; b_in = 0;
    #10;
    a = 0 ; b = 0 ; b_in = 1;
    #10;
    a = 0 ; b = 1 ; b_in = 0;
    #10;
    a = 0 ; b = 1 ; b_in = 1;
    #10;
    a = 1 ; b = 0 ; b_in = 0;
    #10;
    a = 1 ; b = 0 ; b_in = 1;
    #10;
    a = 1 ; b = 1 ; b_in = 0;
    #10;
    a = 1 ; b = 1 ; b_in = 1;
    #10;
  end
  initial begin
    $monitor("a = %0d \t b = %0d \t b_in = %0d \t diff = %0d \t b_out = %0d" , a , b , b_in , diff , b_out);
  end
endmodule
