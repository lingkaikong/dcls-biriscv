module dcls_comparator 
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
    // outputs from core_main
    ,input  [ 31:0]  dport_addr_w_main_i
    ,input  [ 31:0]  dport_data_wr_w_main_i
    ,input           dport_rd_w_main_i
    ,input  [  3:0]  dport_wr_w_main_i
    ,input           dport_cacheable_w_main_i
    ,input  [ 10:0]  dport_req_tag_w_main_i
    ,input           dport_invalidate_w_main_i
    ,input           dport_writeback_w_main_i
    ,input           dport_flush_w_main_i
    ,input           ifetch_rd_w_main_i
    ,input           ifetch_flush_w_main_i
    ,input           ifetch_invalidate_w_main_i
    ,input  [ 31:0]  ifetch_pc_w_main_i
    // outputs from core_sec
    ,input  [ 31:0]  dport_addr_w_sec_i
    ,input  [ 31:0]  dport_data_wr_w_sec_i
    ,input           dport_rd_w_sec_i
    ,input  [  3:0]  dport_wr_w_sec_i
    ,input           dport_cacheable_w_sec_i
    ,input  [ 10:0]  dport_req_tag_w_sec_i
    ,input           dport_invalidate_w_sec_i
    ,input           dport_writeback_w_sec_i
    ,input           dport_flush_w_sec_i
    ,input           ifetch_rd_w_sec_i
    ,input           ifetch_flush_w_sec_i
    ,input           ifetch_invalidate_w_sec_i
    ,input  [ 31:0]  ifetch_pc_w_sec_i
    // inputs to clear comparator results
    ,input           dcls_comparator_clear_0_i
    ,input           dcls_comparator_clear_1_i

    // OUTPUTS
    ,output          dcls_comparator_error_0_o
    ,output          dcls_comparator_error_1_o
    ,output [ 31:0]  dcls_comparator_error_vector_0_o
    ,output [ 31:0]  dcls_comparator_error_vector_1_o
);


reg  [ 31:0]  dport_addr_w_main_d[DCLS_DELAY:0];
reg  [ 31:0]  dport_data_wr_w_main_d[DCLS_DELAY:0];
reg           dport_rd_w_main_d[DCLS_DELAY:0];
reg  [  3:0]  dport_wr_w_main_d[DCLS_DELAY:0];
reg           dport_cacheable_w_main_d[DCLS_DELAY:0];
reg  [ 10:0]  dport_req_tag_w_main_d[DCLS_DELAY:0];
reg           dport_invalidate_w_main_d[DCLS_DELAY:0];
reg           dport_writeback_w_main_d[DCLS_DELAY:0];
reg           dport_flush_w_main_d[DCLS_DELAY:0];
reg           ifetch_rd_w_main_d[DCLS_DELAY:0];
reg           ifetch_flush_w_main_d[DCLS_DELAY:0];
reg           ifetch_invalidate_w_main_d[DCLS_DELAY:0];
reg  [ 31:0]  ifetch_pc_w_main_d[DCLS_DELAY:0];

reg  [ 31:0]  dport_addr_w_sec_d;
reg  [ 31:0]  dport_data_wr_w_sec_d;
reg           dport_rd_w_sec_d;
reg  [  3:0]  dport_wr_w_sec_d;
reg           dport_cacheable_w_sec_d;
reg  [ 10:0]  dport_req_tag_w_sec_d;
reg           dport_invalidate_w_sec_d;
reg           dport_writeback_w_sec_d;
reg           dport_flush_w_sec_d;
reg           ifetch_rd_w_sec_d;
reg           ifetch_flush_w_sec_d;
reg           ifetch_invalidate_w_sec_d;
reg  [ 31:0]  ifetch_pc_w_sec_d;

reg  [DCLS_DELAY:0] rst_d;



always @ (posedge clk_i) begin
  rst_d[0] <=  rst_i;
end
genvar i;
generate begin
  for (i = 1; i < DCLS_DELAY; i = i + 1) begin
    always @ (posedge clk_i) begin
      rst_d[i] <= rst_d[i-1];
    end
  end
endgenerate

always @ (posedge clk_i) begin
  if (rst_i) begin
    dport_addr_w_main_d[0]         <=  0; 
    dport_addr_w_main_d[0]         <=  0; 
    dport_data_wr_w_main_d[0]      <=  0;
    dport_rd_w_main_d[0]           <=  0; 
    dport_wr_w_main_d[0]           <=  0; 
    dport_cacheable_w_main_d[0]    <=  0;
    dport_req_tag_w_main_d[0]      <=  0;
    dport_invalidate_w_main_d[0]   <=  0;
    dport_writeback_w_main_d[0]    <=  0;
    dport_flush_w_main_d[0]        <=  0; 
    ifetch_rd_w_main_d[0]          <=  0; 
    ifetch_flush_w_main_d[0]       <=  0;
    ifetch_invalidate_w_main_d[0]  <=  0;
    ifetch_pc_w_main_d[0]          <=  0; 
  end else begin
    dport_addr_w_main_d[0]         <=  dport_addr_w_main_i;
    dport_addr_w_main_d[0]         <=  dport_addr_w_main_i;
    dport_data_wr_w_main_d[0]      <=  dport_data_wr_w_main_i;
    dport_rd_w_main_d[0]           <=  dport_rd_w_main_i;
    dport_wr_w_main_d[0]           <=  dport_wr_w_main_i;
    dport_cacheable_w_main_d[0]    <=  dport_cacheable_w_main_i;
    dport_req_tag_w_main_d[0]      <=  dport_req_tag_w_main_i;
    dport_invalidate_w_main_d[0]   <=  dport_invalidate_w_main_i;
    dport_writeback_w_main_d[0]    <=  dport_writeback_w_main_i;
    dport_flush_w_main_d[0]        <=  dport_flush_w_main_i;
    ifetch_rd_w_main_d[0]          <=  ifetch_rd_w_main_i;
    ifetch_flush_w_main_d[0]       <=  ifetch_flush_w_main_i;
    ifetch_invalidate_w_main_d[0]  <=  ifetch_invalidate_w_main_i;
    ifetch_pc_w_main_d[0]          <=  ifetch_pc_w_main_i;
  end
end

generate begin
  for (i = 1; i < DCLS_DELAY; i = i + 1) begin
    always @ (posedge clk_i) begin
      if (rst_i) begin
        dport_addr_w_main_d[i]         <=  0;
        dport_addr_w_main_d[i]         <=  0;
        dport_data_wr_w_main_d[i]      <=  0;
        dport_rd_w_main_d[i]           <=  0;
        dport_wr_w_main_d[i]           <=  0;
        dport_cacheable_w_main_d[i]    <=  0;
        dport_req_tag_w_main_d[i]      <=  0;
        dport_invalidate_w_main_d[i]   <=  0;
        dport_writeback_w_main_d[i]    <=  0;
        dport_flush_w_main_d[i]        <=  0;
        ifetch_rd_w_main_d[i]          <=  0;
        ifetch_flush_w_main_d[i]       <=  0;
        ifetch_invalidate_w_main_d[i]  <=  0;
        ifetch_pc_w_main_d[i]          <=  0;
      end else begin
        dport_addr_w_main_d[i]         <=  dport_addr_w_main_d[i-1];
        dport_addr_w_main_d[i]         <=  dport_addr_w_main_d[i-1];
        dport_data_wr_w_main_d[i]      <=  dport_data_wr_w_main_d[i-1];
        dport_rd_w_main_d[i]           <=  dport_rd_w_main_d[i-1];
        dport_wr_w_main_d[i]           <=  dport_wr_w_main_d[i-1];
        dport_cacheable_w_main_d[i]    <=  dport_cacheable_w_main_d[i-1];
        dport_req_tag_w_main_d[i]      <=  dport_req_tag_w_main_d[i-1];
        dport_invalidate_w_main_d[i]   <=  dport_invalidate_w_main_d[i-1];
        dport_writeback_w_main_d[i]    <=  dport_writeback_w_main_d[i-1];
        dport_flush_w_main_d[i]        <=  dport_flush_w_main_d[i-1];
        ifetch_rd_w_main_d[i]          <=  ifetch_rd_w_main_d[i-1];
        ifetch_flush_w_main_d[i]       <=  ifetch_flush_w_main_d[i-1];
        ifetch_invalidate_w_main_d[i]  <=  ifetch_invalidate_w_main_d[i-1];
        ifetch_pc_w_main_d[i]          <=  ifetch_pc_w_main_d[i-1];
      end
    end
  end
endgenerate


always @ (posedge clk_i) begin

  if (rst_i) begin
    dport_addr_w_sec_d         <=  0;
    dport_addr_w_sec_d         <=  0;
    dport_data_wr_w_sec_d      <=  0;
    dport_rd_w_sec_d           <=  0;
    dport_wr_w_sec_d           <=  0;
    dport_cacheable_w_sec_d    <=  0;
    dport_req_tag_w_sec_d      <=  0;
    dport_invalidate_w_sec_d   <=  0;
    dport_writeback_w_sec_d    <=  0;
    dport_flush_w_sec_d        <=  0;
    ifetch_rd_w_sec_d          <=  0;
    ifetch_flush_w_sec_d       <=  0;
    ifetch_invalidate_w_sec_d  <=  0;
    ifetch_pc_w_sec_d          <=  0;
  end else begin
    dport_addr_w_sec_d         <=  dport_addr_w_sec_i;
    dport_addr_w_sec_d         <=  dport_addr_w_sec_i;
    dport_data_wr_w_sec_d      <=  dport_data_wr_w_sec_i;
    dport_rd_w_sec_d           <=  dport_rd_w_sec_i;
    dport_wr_w_sec_d           <=  dport_wr_w_sec_i;
    dport_cacheable_w_sec_d    <=  dport_cacheable_w_sec_i;
    dport_req_tag_w_sec_d      <=  dport_req_tag_w_sec_i;
    dport_invalidate_w_sec_d   <=  dport_invalidate_w_sec_i;
    dport_writeback_w_sec_d    <=  dport_writeback_w_sec_i;
    dport_flush_w_sec_d        <=  dport_flush_w_sec_i;
    ifetch_rd_w_sec_d          <=  ifetch_rd_w_sec_i;
    ifetch_flush_w_sec_d       <=  ifetch_flush_w_sec_i;
    ifetch_invalidate_w_sec_d  <=  ifetch_invalidate_w_sec_i;
    ifetch_pc_w_sec_d          <=  ifetch_pc_w_sec_i;
  end
end

// bit-wise xor and then word or

assign  dport_addr_w_error         =  |  (dport_addr_w_main_d[DCLS_DELAY]         ^  dport_addr_w_sec_d);
assign  dport_data_wr_w_error      =  |  (dport_data_wr_w_main_d[DCLS_DELAY]      ^  dport_data_wr_w_sec_d);
assign  dport_rd_w_error           =  |  (dport_rd_w_main_d[DCLS_DELAY]           ^  dport_rd_w_sec_d);
assign  dport_wr_w_error           =  |  (dport_wr_w_main_d[DCLS_DELAY]           ^  dport_wr_w_sec_d);
assign  dport_cacheable_w_error    =  |  (dport_cacheable_w_main_d[DCLS_DELAY]    ^  dport_cacheable_w_sec_d);
assign  dport_req_tag_w_error      =  |  (dport_req_tag_w_main_d[DCLS_DELAY]      ^  dport_req_tag_w_sec_d);
assign  dport_invalidate_w_error   =  |  (dport_invalidate_w_main_d[DCLS_DELAY]   ^  dport_invalidate_w_sec_d);
assign  dport_writeback_w_error    =  |  (dport_writeback_w_main_d[DCLS_DELAY]    ^  dport_writeback_w_sec_d);
assign  dport_flush_w_error        =  |  (dport_flush_w_main_d[DCLS_DELAY]        ^  dport_flush_w_sec_d);
assign  ifetch_rd_w_error          =  |  (ifetch_rd_w_main_d[DCLS_DELAY]          ^  ifetch_rd_w_sec_d);
assign  ifetch_flush_w_error       =  |  (ifetch_flush_w_main_d[DCLS_DELAY]       ^  ifetch_flush_w_sec_d);
assign  ifetch_invalidate_w_error  =  |  (ifetch_invalidate_w_main_d[DCLS_DELAY]  ^  ifetch_invalidate_w_sec_d);
assign  ifetch_pc_w_error          =  |  (ifetch_pc_w_main_d[DCLS_DELAY]          ^  ifetch_pc_w_sec_d);

assign dcls_comparator_error_vector_0 = 
        (dport_addr_w_error         << 0 ) | 
        (dport_data_wr_w_error      << 1 ) | 
        (dport_rd_w_error           << 2 ) | 
        (dport_wr_w_error           << 3 ) | 
        (dport_cacheable_w_error    << 4 ) | 
        (dport_req_tag_w_error      << 5 ) | 
        (dport_invalidate_w_error   << 6 ) | 
        (dport_writeback_w_error    << 7 ) | 
        (dport_flush_w_error        << 8 ) | 
        (ifetch_rd_w_error          << 9 ) | 
        (ifetch_flush_w_error       << 10 ) | 
        (ifetch_invalidate_w_error  << 11 ) |
        (ifetch_pc_w_error          << 12 ) ; 
assign dcls_comparator_error_0 = | dcls_comparator_error_vector_0;

// no optimization for this one
assign dcls_comparator_error_vector_1 = 
        (dport_addr_w_error         << 0 ) | 
        (dport_data_wr_w_error      << 1 ) | 
        (dport_rd_w_error           << 2 ) | 
        (dport_wr_w_error           << 3 ) | 
        (dport_cacheable_w_error    << 4 ) | 
        (dport_req_tag_w_error      << 5 ) | 
        (dport_invalidate_w_error   << 6 ) | 
        (dport_writeback_w_error    << 7 ) | 
        (dport_flush_w_error        << 8 ) | 
        (ifetch_rd_w_error          << 9 ) | 
        (ifetch_flush_w_error       << 10 ) | 
        (ifetch_invalidate_w_error  << 11 ) |
        (ifetch_pc_w_error          << 12 ) ; 
assign dcls_comparator_error_1 = | dcls_comparator_error_vector_1;

always @ (posedge clk_i) begin
  if (rst_d[DCLS_DELAY]) begin
    dcls_comparator_error_0_o         <=  dcls_comparator_error_0;
    dcls_comparator_error_1_o         <=  dcls_comparator_error_1;
    dcls_comparator_error_vector_0_o  <=  dcls_comparator_error_vector_0;
    dcls_comparator_error_vector_1_o  <=  dcls_comparator_error_vector_1;
  end else begin
    dcls_comparator_error_0_o         <=  dcls_comparator_clear_0_i ? 0 : dcls_comparator_error_0;
    dcls_comparator_error_1_o         <=  dcls_comparator_clear_1_i ? 0 : dcls_comparator_error_1;
    dcls_comparator_error_vector_0_o  <=  dcls_comparator_clear_0_i ? 0 : dcls_comparator_error_vector_0;
    dcls_comparator_error_vector_1_o  <=  dcls_comparator_clear_1_i ? 0 : dcls_comparator_error_vector_1;
  end
end

endmodule
