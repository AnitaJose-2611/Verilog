module tb;
  reg i0 , i1 , i2, i3, s0, s1;
  wire y;
  MUX4to1 uut1(.i0(i0) , .i1(i1) , .i2(i2) , .i3(i3) , .s0(s0) , .s1(s1) , .y(y));
  initial begin
    i0 = 0 ; i1 = 0 ; i2 = 0 ; i3 = 0 ; s0 = 0; s1 = 0;
    #10;
    i0 = 0 ; i1 = 0 ; i2 = 0 ; i3 = 1 ; s0 = 0; s1 = 1;
    #10;
    i0 = 0 ; i1 = 0 ; i2 = 1 ; i3 = 0 ; s0 = 1; s1 = 0;
    #10;
    i0 = 0 ; i1 = 0 ; i2 = 1 ; i3 = 1 ; s0 = 1; s1 = 1;
    #10;
    i0 = 0 ; i1 = 1 ; i2 = 0 ; i3 = 0 ; s0 = 0; s1 = 0;
    #10;
    i0 = 0 ; i1 = 1 ; i2 = 0 ; i3 = 1 ; s0 = 0; s1 = 1;
    #10;
    i0 = 0 ; i1 = 1 ; i2 = 1 ; i3 = 0 ; s0 = 1; s1 = 0;
    #10;
    i0 = 0 ; i1 = 1 ; i2 = 1 ; i3 = 1 ; s0 = 1; s1 = 1;
    #10;
  end
  initial begin
    $monitor("i0 = %0d \t i1 = %0d \t s = %0d \t y = %0d" , i0 , i1 , s , y);
  end
endmodule
