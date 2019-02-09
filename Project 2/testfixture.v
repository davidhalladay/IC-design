`timescale 1ns / 1ps
`define HALF_CYCLE 1.957

module testfixture();

integer i, j, k, err_count;

reg         clk, rst_n;
reg  [5:0]  im1, im2, im3;
reg  [15:0] comp_gold;
wire [15:0] wgt_sum;
wire        pos;
wire [50:0] gate_count;

reg [5:0]  mem_im1 [0:4095];
reg [5:0]  mem_im2 [0:4095];
reg [5:0]  mem_im3 [0:4095];
reg [15:0] golden  [0:4095];

reg [0:4095] conf_mat;

always #(`HALF_CYCLE) clk = ~clk;

initial begin
	$fsdbDumpfile("LinClass.fsdb");
	$fsdbDumpvars;
end

lin_class u_lin_class(.i_clk(clk),
					  .i_rst_n(rst_n),
					  .i_im1(im1),
					  .i_im2(im2),
					  .i_im3(im3),
					  .o_wgt_sum(wgt_sum),
					  .o_pos(pos),
					  .number(gate_count));

initial begin
	$readmemh("./DAT/im1.txt", mem_im1);
	$readmemh("./DAT/im2.txt", mem_im2);
	$readmemh("./DAT/im3.txt", mem_im3);
	$readmemh("./DAT/golden.txt", golden);
end

initial begin
	clk = 1'b1;
	rst_n = 1'b1;
	@(posedge clk)
		rst_n <= 1'b0;

	err_count = 0;
	for (i = 0; i < 4096 + 4; i = i + 1)
	begin
		comp_gold = golden[i - 4];

		@(posedge clk)
		begin
			rst_n <= 1'b1;

			im1 <= mem_im1[i];
			im2 <= mem_im2[i];
			im3 <= mem_im3[i];
		end

		if (i >= 4)
		begin
			conf_mat[i - 4] <= pos;
			if (wgt_sum !== golden[i - 4] &&
				(wgt_sum !== golden[i - 4] + 1'b1) && (wgt_sum !== golden[i - 4] - 1'b1) &&
				(wgt_sum !== golden[i - 4] + 2'd2) && (wgt_sum !== golden[i - 4] - 2'd2))
			begin
				err_count = err_count + 1;
			end
		end
	end

	if (err_count != 0)
	begin
		$display("=============================================");
		$display("Error Count: %d", err_count);
		$display("=============================================");
	end else
	begin
		$display("\nResults: \n");
		for (j = 10; j < 64; j = j + 1)
		begin
			for (k = 10; k < 64; k = k + 1)
			begin
				$write("%b", conf_mat[(j - 5) * 64 + k - 5]);
			end
			$write("\n");
		end

		$write("\n");
		$display("=============================================");
		$display("Summary: ");
		$display("---------------------------------------------");
		$display("Half Cycle:     %f", `HALF_CYCLE);
		$display("Area:   %d", gate_count);
		$display("Error Count: %d", err_count);
		$display("=============================================");
	end

	$finish;
end

endmodule
