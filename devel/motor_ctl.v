`timescale 1ns / 1ps
module motor_ctl(
input clk,
input rst_32,
input [31:0] din_32,
input [0:0] wr_en_32,
input [0:0] rd_en_32,
output [31:0] dout_32,
output [0:0] full_32,
output [0:0] empty_32,
output [0:0] dir_out_r,
output [0:0] dir_out_l,
output [0:0] en_out_r,
output [0:0] en_out_l
);
// //copy this instance to top module
//motor_ctl motor_ctl(
//.clk(bus_clk),
//.rst_32(!user_w_write_32_open && !user_r_read_32_open),
//.din_32(user_w_write_32_data),
//.wr_en_32(user_w_write_32_wren),
//.rd_en_32(user_r_read_32_rden),
//.dout_32(user_r_read_32_data),
//.full_32(user_w_write_32_full),
//.empty_32(user_r_read_32_empty),
//
// .dir_out_r(dir_out_r),
// .dir_out_l(dir_out_l),
// .en_out_r(en_out_r),
// .en_out_l(en_out_l)
//);
parameter INIT_32 = 0,
			READY_RCV_32 	= 1,
			RCV_DATA_32 	= 2,
			POSE_32		= 3,
			READY_SND_32	= 4,
			SND_DATA_32	= 5;

// for input fifo
wire [31:0] rcv_data_32;
wire rcv_en_32;
wire data_empty_32;
// for output fifo
wire [31:0] snd_data_32;
wire snd_en_32;
wire data_full_32;
// state register
reg [3:0] state_32;

////fifo 32bit
fifo_32x512 input_fifo_32(
	.clk(clk),
	.srst(rst_32),
	
	.din(din_32),
	.wr_en(wr_en_32),
	.full(full_32),
	
	.dout(rcv_data_32),
	.rd_en(rcv_en_32),
	.empty(data_empty_32)
	);
	
fifo_32x512 output_fifo_32(
	.clk(clk),
	.srst(rst_32),
	
	.din(snd_data_32),
	.wr_en(snd_en_32),
	.full(data_full_32),
	
	.dout(dout_32),
	.rd_en(rd_en_32),
	.empty(empty_32)
	);

//for 32bbit FIFO
reg[0:0] dir_right;
reg[14:0] para_right;
reg[0:0] dir_left;
reg[14:0] para_left;


//instance for pwm_ctl
pwm_ctl right(
.clk(clk),
.rst(rst_32),
.para_in(para_right),
.dir_in(dir_right),
.dir_out(dir_out_r),
.en_out(en_out_r)
);


//instance for pwm_ctl
pwm_ctl left(
.clk(clk),
.rst(rst_32),
.para_in(para_left),
.dir_in(dir_left),
.dir_out(dir_out_l),
.en_out(en_out_l)
);

always @(posedge clk)begin
	if(rst_32)
		state_32 <= 0;
	else
		case (state_32)
			INIT_32: 										state_32 <= READY_RCV_32;
			READY_RCV_32: if(data_empty_32 == 0) 	state_32 <= RCV_DATA_32;
			RCV_DATA_32: 									state_32 <= POSE_32;
			POSE_32:											state_32 <= READY_SND_32;
			READY_SND_32: if(data_full_32 == 0)		state_32 <= SND_DATA_32;
			SND_DATA_32:									state_32 <= READY_RCV_32;
		endcase
end

assign rcv_en_32 = (state_32 == RCV_DATA_32);
assign snd_en_32 = (state_32 == SND_DATA_32);

always @(posedge clk)begin
	if(rst_32)begin
/*user defined init*/
		dir_right <= 0;
		para_right <= 0;
		dir_left <= 0;
		para_left <= 0;
	end
	else if (state_32 == READY_SND_32)begin
/*user defined rcv*/
		dir_right <= rcv_data_32[0:0];
		para_right <= rcv_data_32[15:1];
		dir_left <= rcv_data_32[16:16];
		para_left <= rcv_data_32[31:17];
	end
	else if (state_32 == READY_RCV_32)begin
/*user defined */
	end
end

/*user assign*/


endmodule