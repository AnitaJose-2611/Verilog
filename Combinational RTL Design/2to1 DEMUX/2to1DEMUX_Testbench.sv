module tb;
  reg i , s;
  wire y0 , y1;
  DEMUX2to1 uut1(.i(i) , .s(s) , .y0(y0) , .y1(y1));
  initial begin
    i = 0 ; s = 0;
    #10;
    i = 0 ; s = 1;
    #10;
    i = 1 ; s = 0;
    #10;
    i = 1 ; s = 1;
    #10;
  end
  initial begin
    $monitor("i = %0d \t s = %0d \t y0 = %0d \t y1 = %0d" , i , s , y0 , y1);
  end
