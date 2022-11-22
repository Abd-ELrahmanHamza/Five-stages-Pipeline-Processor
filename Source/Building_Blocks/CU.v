
module CU(opcode,dmr,dmw,data_read,data_write,alu_function);
	// Opcodes of instructions
	parameter LOAD_OP = 9'b1;
	parameter STORE_OP = 9'b10;
	parameter ADD_OP = 9'b011;
	parameter NOT_OP = 9'b100;
	parameter NOP_OP = 9'b101;

	// Alu functions of instructions
	parameter LOAD = 2'b00; // NOP
	parameter STORE = 2'b10; // MOV
	parameter ADD = 2'b11;
	parameter NOT = 2'b01;
	parameter NOP = 2'b00;

	input [8:0] opcode;
	output reg dmr;
	output reg dmw;
	output reg data_read;
	output reg data_write;
	output reg [2:0] alu_function;
	
	always @(*) begin
		// Avoid unwanted latches	
		dmr = 0;
		dmw = 0;
		data_read = 0;
		data_write = 0;	
		alu_function = 0;
		case(opcode)
			LOAD_OP: begin
				dmr = 1;
				data_write = 1;
				alu_function = LOAD;
			end
			STORE_OP: begin
				dmw = 1;
				data_read = 1;
				alu_function = STORE;
			end
			ADD_OP: begin
				data_read = 1;
				data_write = 1;
				alu_function = ADD;
			end
			NOT_OP: begin
				data_read = 1;
				data_write = 1;
				alu_function = NOT;
			end
			NOP_OP: begin
				alu_function = NOP;
			end
		endcase
//		if(ir[15:4] == LOAD_OP)begin 
//			dmr = 1;
//			data_write = 1;
//		end else if(ir[15:4] == STORE_OP)begin 
//			dmw = 1;
//			data_read = 1;
//		end else if(ir[15:4] == ADD_OP)begin 
//			data_read = 1;
//			data_write = 1;
//			alu_function = ADD;
//		end else if(ir[15:4] == NOT_OP)begin 
//			data_read = 1;
//			data_write = 1;
//			alu_function = NOT;
//		end else if(ir[15:4] == NOP_OP)begin 
//			data_read = 1;
//			data_write = 1;
//			alu_function = NOP;
//		end 
	end		

endmodule