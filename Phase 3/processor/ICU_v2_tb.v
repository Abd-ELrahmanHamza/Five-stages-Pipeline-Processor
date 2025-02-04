module ICU_tb();

localparam PERIOD = 100;

localparam NOP_OP = 16'b0000000000000000;
localparam PUSH_CCR_OP = 16'b0110000000001010;
localparam PUSH_PCL_OP = 16'b0110000000001000;
localparam PUSH_PCH_OP = 16'b0110000000001001;

reg int_flag;
wire ack;
wire stall;
wire [15:0] instruction;
wire [31:0] PC_VALUE;

reg clk, enable, reset;

reg [7:0] cycles_counter;

ICU U(int_flag, ack, stall, instruction, PC_VALUE, clk, enable, reset);

initial 
begin
    /* Initialize the clk and reset */
    clk = 1;
    cycles_counter = 0;
    reset = 1;
    enable = 1;
    int_flag = 0;

    /* Reset it first */
    #(PERIOD);
    reset = 0;
    #(PERIOD);
    reset = 1;

    /* ===================================================== TEST CASE #1 ===================================================== */
    /*
        Test Case #1:
                    C1: No interrupt!
                    C2: No interrupt!
                    C3: No interrupt!
                    C4: No interrupt!
                    C5: No interrupt!
    */
    int_flag = 0;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #1 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #1 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #1 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #1 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #1 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #1 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #1 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #1 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #1 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #1 - IDLE_STATE : Failed!");
        end

    /* ===================================================== TEST CASE #2 ===================================================== */
    /*
        Test Case #2:
                    C1: Interrupt is fired by user!
                    C2: One stall
                    C3: CCR is pushed!
                    C4: PCL is pushed!
                    C5: PCH is pushed!
                    C6: PC is moved to 0, then ack is raised by hardware!
                    C7: Ack is still raising because the user doesn't realized that the ack is fired yet!
                    C8: Ack is still raising because the user doesn't realized that the ack is fired yet!
                    C9: Ack is still raising because the user doesn't realized that the ack is fired yet!
    */
    int_flag = 1;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b1) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - STALL_1_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - STALL_1_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_CCR_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - PUSH_CCR_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - PUSH_CCR_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCL_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - PUSH_PCL_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - PUSH_PCL_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCH_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - PUSH_PCH_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - PUSH_PCH_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 1) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE == 0))
        begin
            $display("Test case #2 - PC_CHANGE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - PC_CHANGE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 1) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 1) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - IDLE_STATE : Failed!");
        end

    if ((ack == 1) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #2 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #2 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    /* ===================================================== TEST CASE #3 ===================================================== */
    /*
        Test Case #3:
                    C1: User realized that ack is fired, so he cleared the interrupt flag, So the ack is cleared by hardware!
                    C2: Interrupt is fired by user!
                    C3: One stall
                    C4: CCR is pushed!
                    C5: PCL is pushed!
                    C6: PCH is pushed!
                    C7: PC is moved to 0, then ack is raised by hardware!
                    C8: Interrupt flag is cleared by user, then ack is cleared by hardware!
    */
    int_flag = 0;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - IDLE_STATE : Failed!");
        end

    int_flag = 1;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b1) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - STALL_1_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - STALL_1_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_CCR_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - PUSH_CCR_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - PUSH_CCR_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCL_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - PUSH_PCL_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - PUSH_PCL_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCH_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - PUSH_PCH_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - PUSH_PCH_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 1) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE == 0))
        begin
            $display("Test case #3 - PC_CHANGE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - PC_CHANGE_STATE : Failed!");
        end

    int_flag = 0;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #3 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #3 - IDLE_STATE : Failed!");
        end

    /* ===================================================== TEST CASE #4 ===================================================== */
    /*
        Test Case #4:
                    C1: Interrupt is fired by user!
                    C2: One stall
                    C3: CCR is pushed! User has cleared the interrupt flag suddenly!
                    C4: PCL is pushed!
                    C5: PCH is pushed!
                    C6: PC is moved to 0, then ack is raised by hardware!
                    C7: As the interrupt flag is previously cleared, ack is cleared too!
    */
    int_flag = 1;

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b1) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - IDLE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - STALL_1_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - STALL_1_STATE : Failed!");
        end

    #(PERIOD/2);
    int_flag = 0;
    #(PERIOD/2);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_CCR_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - PUSH_CCR_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - PUSH_CCR_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCL_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - PUSH_PCL_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - PUSH_PCL_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall == 1) && (instruction == PUSH_PCH_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - PUSH_PCH_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - PUSH_PCH_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 1) && (stall == 1) && (instruction == NOP_OP) && (PC_VALUE == 0))
        begin
            $display("Test case #4 - PC_CHANGE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - PC_CHANGE_STATE : Failed!");
        end

    #(PERIOD);

    if ((ack == 0) && (stall === 1'b0) && (instruction === NOP_OP) && (PC_VALUE === 32'bz))
        begin
            $display("Test case #4 - IDLE_STATE : Succeeded!");
        end
    else
        begin
            $display("Test case #4 - IDLE_STATE : Failed!");
        end
end

always
    begin
        #(PERIOD/2);
        clk = ~clk;
    end

always @(posedge clk)
    begin
        cycles_counter = cycles_counter + 1;
    end
endmodule