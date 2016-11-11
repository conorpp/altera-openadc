module openadc(input clk, input[35:0] GPIO_0, input[35:0] GPIO_1, input[3:0] KEY, output[9:0] LEDR);

assign LEDR = {10{clk}} & 10'h55;




endmodule