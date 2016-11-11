module openadc(input clk, input[35:0] GPIO_0, inout[35:0] GPIO_1, input[3:0] KEY, output[9:0] LEDR);

wire[40:0] gpio1;

// for convenience, make it match pinout on schematic
//assign gpio1[1:40] = {GPIO_1[0:9],2'bxx,GPIO_1[10:25],2'bxx,GPIO_1[26:35]};
assign gpio1[40:1] = {GPIO_1[35:26],2'bxx,GPIO_1[25:10],2'bxx,GPIO_1[9:0]};

wire oadc_clk_in = gpio1[38];
wire oadc_trigger = gpio1[36];

wire[9:0] oadc_val;

assign oadc_val[0] = gpio1[16];
assign oadc_val[1] = gpio1[2];
assign oadc_val[2] = gpio1[18];
assign oadc_val[3] = gpio1[3];
assign oadc_val[4] = gpio1[20];
assign oadc_val[5] = gpio1[33];
assign oadc_val[6] = gpio1[28];
assign oadc_val[7] = gpio1[35];
assign oadc_val[8] = gpio1[32];
assign oadc_val[9] = gpio1[40];

wire oadc_clk = gpio1[4];
wire oadc_or = gpio1[34];

wire oadc_lna_gain = gpio1[6];
wire oadc_lna_gain_mode = gpio1[14];


assign LEDR = oadc_val;

assign odc_clk = clk;

endmodule
