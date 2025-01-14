module  InstrMem #(parameter WORD_LENGTH=16,parameter ADDRESS_SPACE=21) ( MAR, MDR, reset);
input  [ADDRESS_SPACE-1:0] MAR;
input  reset;
output reg[WORD_LENGTH-1:0]   MDR;

reg [WORD_LENGTH-1:0] cache [((2 ** ADDRESS_SPACE)-1):0];

/* Note: reset is an active low signal */
integer i;
always @ (*)
    if (!reset)
        begin
            MDR = 'b0;
        end
    else
        begin
            MDR = cache[MAR];

        end

endmodule
