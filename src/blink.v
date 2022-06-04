module blink (
               input sys_clk,         // 24 MHz
               input sys_rst_n,
               output reg [2:0] led   // 110 G, 101 B, 011 R 
             );

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n)
begin
  if (!sys_rst_n)
    counter <= 32'b0;
  else if(counter == 32'b1111_1111_1111_1111_1111_1111_1111_1111)
         counter <= 32'd0;
       else
         counter <= counter + 1;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
  if (!sys_rst_n)
    led <= 3'b110;
  else if (counter[22:0] == 23'd6_000_000)    // 250 msec
         led[2:0] <= {led[1:0],led[2]};
end

endmodule
