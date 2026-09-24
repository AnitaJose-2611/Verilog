module tb;
  reg i0 , i1 , s;
  wire y;
  MUX2to1 uut1(.i0(i0) , .i1(i1) , .s(s) , .y(y));
  initial begin
    i0 = 0 ; i1 = 0 ; s = 0;
    #10;
    i0 = 0 ; i1 = 1 ; s = 0;
    #10;
    i0 = 1 ; i1 = 0 ; s = 0;
    #10;
    i0 = 1 ; i1 = 1 ; s = 0;
    #10;
    i0 = 0 ; i1 = 0 ; s = 1;
    #10;
    i0 = 0 ; i1 = 1 ; s = 1;
    #10;
    i0 = 1 ; i1 = 0 ; s = 1;
    #10;
    i0 = 1 ; i1 = 1 ; s = 1;
    #10;
  end
  initial begin
    $monitor("i0 = %0d \t i1 = %0d \t s = %0d \t y = %0d" , i0 , i1 , s , y);
  end
endmodule
