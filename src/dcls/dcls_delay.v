module dcls_delay
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter DCLS_DELAY = 2
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 31:0]  mem_d_data_rd_i
    ,input           mem_d_accept_i
    ,input           mem_d_ack_i
    ,input           mem_d_error_i
    ,input  [ 10:0]  mem_d_resp_tag_i
    ,input           mem_i_accept_i
    ,input           mem_i_valid_i
    ,input           mem_i_error_i
    ,input  [ 63:0]  mem_i_inst_i
    ,input           intr_i
    ,input  [ 31:0]  reset_vector_i
    ,input  [ 31:0]  cpu_id_i
    
    // Outputs
    ,output          rst_o
    ,output [ 31:0]  mem_d_data_rd_o
    ,output          mem_d_accept_o
    ,output          mem_d_ack_o
    ,output          mem_d_error_o
    ,output [ 10:0]  mem_d_resp_tag_o
    ,output          mem_i_accept_o
    ,output          mem_i_valid_o
    ,output          mem_i_error_o
    ,output [ 63:0]  mem_i_inst_o
    ,output          intr_o
    ,output [ 31:0]  reset_vector_o
    ,output [ 31:0]  cpu_id_o
);


reg          rst_d[DCLS_DELAY-1:0];
reg [ 31:0]  mem_d_data_rd_d[DCLS_DELAY-1:0];
reg          mem_d_accept_d[DCLS_DELAY-1:0];
reg          mem_d_ack_d[DCLS_DELAY-1:0];
reg          mem_d_error_d[DCLS_DELAY-1:0];
reg [ 10:0]  mem_d_resp_tag_d[DCLS_DELAY-1:0];
reg          mem_i_accept_d[DCLS_DELAY-1:0];
reg          mem_i_valid_d[DCLS_DELAY-1:0];
reg          mem_i_error_d[DCLS_DELAY-1:0];
reg [ 63:0]  mem_i_inst_d[DCLS_DELAY-1:0];
reg          intr_d[DCLS_DELAY-1:0];
reg [ 31:0]  reset_vector_d[DCLS_DELAY-1:0];
reg [ 31:0]  cpu_id_d[DCLS_DELAY-1:0];

always @ (posedge clk_i) begin
  if (rst_i) begin
    rst_d[0]             <=  0;
    mem_d_data_rd_d[0]   <=  0;
    mem_d_accept_d[0]    <=  0;
    mem_d_ack_d[0]       <=  0;
    mem_d_error_d[0]     <=  0;
    mem_d_resp_tag_d[0]  <=  0;
    mem_i_accept_d[0]    <=  0;
    mem_i_valid_d[0]     <=  0;
    mem_i_error_d[0]     <=  0;
    mem_i_inst_d[0]      <=  0;
    intr_d[0]            <=  0;
    reset_vector_d[0]    <=  0;
    cpu_id_d[0]          <=  0;
  end else begin
    rst_d[0]             <=  rst_i;
    mem_d_data_rd_d[0]   <=  mem_d_data_rd_i;
    mem_d_accept_d[0]    <=  mem_d_accept_i;
    mem_d_ack_d[0]       <=  mem_d_ack_i;
    mem_d_error_d[0]     <=  mem_d_error_i;
    mem_d_resp_tag_d[0]  <=  mem_d_resp_tag_i;
    mem_i_accept_d[0]    <=  mem_i_accept_i;
    mem_i_valid_d[0]     <=  mem_i_valid_i;
    mem_i_error_d[0]     <=  mem_i_error_i;
    mem_i_inst_d[0]      <=  mem_i_inst_i;
    intr_d[0]            <=  intr_i;
    reset_vector_d[0]    <=  reset_vector_i;
    cpu_id_d[0]          <=  cpu_id_i;
  end
end 

genvar i;
generate
  for (i = 1; i < DCLS_DELAY; i = i+1) begin
    always @ (posedge clk_i) begin
      if (rst_i) begin
        rst_d[i]             <=  0;
        mem_d_data_rd_d[i]   <=  0;
        mem_d_accept_d[i]    <=  0;
        mem_d_ack_d[i]       <=  0;
        mem_d_error_d[i]     <=  0;
        mem_d_resp_tag_d[i]  <=  0;
        mem_i_accept_d[i]    <=  0;
        mem_i_valid_d[i]     <=  0;
        mem_i_error_d[i]     <=  0;
        mem_i_inst_d[i]      <=  0;
        intr_d[i]            <=  0;
        reset_vector_d[i]    <=  0;
        cpu_id_d[i]          <=  0;
      end else begin
        rst_d[i]             <=  rst_d[i-1];
        mem_d_data_rd_d[i]   <=  mem_d_data_rd_d[i-1];
        mem_d_accept_d[i]    <=  mem_d_accept_d[i-1];
        mem_d_ack_d[i]       <=  mem_d_ack_d[i-1];
        mem_d_error_d[i]     <=  mem_d_error_d[i-1];
        mem_d_resp_tag_d[i]  <=  mem_d_resp_tag_d[i-1];
        mem_i_accept_d[i]    <=  mem_i_accept_d[i-1];
        mem_i_valid_d[i]     <=  mem_i_valid_d[i-1];
        mem_i_error_d[i]     <=  mem_i_error_d[i-1];
        mem_i_inst_d[i]      <=  mem_i_inst_d[i-1];
        intr_d[i]            <=  intr_d[i-1];
        reset_vector_d[i]    <=  reset_vector_d[i-1];
        cpu_id_d[i]          <=  cpu_id_d[i-1];
      end
    end 
  end
endgenerate

assign  rst_o             =  rst_d[DCLS_DELAY-1];
assign  mem_d_data_rd_o   =  mem_d_data_rd_d[DCLS_DELAY-1];
assign  mem_d_accept_o    =  mem_d_accept_d[DCLS_DELAY-1];
assign  mem_d_ack_o       =  mem_d_ack_d[DCLS_DELAY-1];
assign  mem_d_error_o     =  mem_d_error_d[DCLS_DELAY-1];
assign  mem_d_resp_tag_o  =  mem_d_resp_tag_d[DCLS_DELAY-1];
assign  mem_i_accept_o    =  mem_i_accept_d[DCLS_DELAY-1];
assign  mem_i_valid_o     =  mem_i_valid_d[DCLS_DELAY-1];
assign  mem_i_error_o     =  mem_i_error_d[DCLS_DELAY-1];
assign  mem_i_inst_o      =  mem_i_inst_d[DCLS_DELAY-1];
assign  intr_o            =  intr_d[DCLS_DELAY-1];
assign  reset_vector_o    =  reset_vector_d[DCLS_DELAY-1];
assign  cpu_id_o          =  cpu_id_d[DCLS_DELAY-1];

endmodule
