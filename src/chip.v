
module mini_light_up_game (
    input  clk,         
    input  reset,       
    input  btn,         
    output [6:0] seg0,  
    output [6:0] seg1,  
    output [6:0] seg2,  
    output [6:0] seg3   
);

    
    reg btn_prev;
    wire btn_pulse;
    always @(posedge clk or posedge reset) begin
        if (reset) btn_prev <= 1'b0;
        else       btn_prev <= btn;
    end
    assign btn_pulse = btn & ~btn_prev;

    
    reg [5:0] cursor;
    always @(posedge clk or posedge reset) begin
        if (reset) cursor <= 6'b000001;
        else       cursor <= {cursor[4:0], cursor[5]};
    end

   
    reg [1:0] cnt;

   
    reg [5:0] mem0, mem1, mem2, mem3;

   
    reg [3:0] done_ff;

    wire sel0 = (cnt == 2'b00);
    wire sel1 = (cnt == 2'b01);
    wire sel2 = (cnt == 2'b10);
    wire sel3 = (cnt == 2'b11);

    wire wr0 = btn_pulse & sel0;
    wire wr1 = btn_pulse & sel1;
    wire wr2 = btn_pulse & sel2;
    wire wr3 = btn_pulse & sel3;

    wire [5:0] nxt0 = wr0 ? (mem0 | cursor) : mem0;
    wire [5:0] nxt1 = wr1 ? (mem1 | cursor) : mem1;
    wire [5:0] nxt2 = wr2 ? (mem2 | cursor) : mem2;
    wire [5:0] nxt3 = wr3 ? (mem3 | cursor) : mem3;

    
    wire [3:0] done_comb;
    assign done_comb[0] = &nxt0;
    assign done_comb[1] = &nxt1;
    assign done_comb[2] = &nxt2;
    assign done_comb[3] = &nxt3;


    wire cnt_advance = btn_pulse & done_ff[cnt] & ~sel3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt     <= 2'b00;
            mem0    <= 6'b0;  mem1 <= 6'b0;
            mem2    <= 6'b0;  mem3 <= 6'b0;
            done_ff <= 4'b0;
        end else begin
           
            mem0 <= nxt0;
            mem1 <= nxt1;
            mem2 <= nxt2;
            mem3 <= nxt3;
           
            done_ff <= done_comb;
           
            if (cnt_advance)
                cnt <= cnt + 1'b1;
        end
    end

    // 
    assign seg0 = {1'b0, mem0 | (cursor & {6{sel0}})};
    assign seg1 = {1'b0, mem1 | (cursor & {6{sel1}})};
    assign seg2 = {1'b0, mem2 | (cursor & {6{sel2}})};
    assign seg3 = {1'b0, mem3 | (cursor & {6{sel3}})};

endmodule