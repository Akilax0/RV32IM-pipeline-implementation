`timescale 1ns/100ps

module control_unit(INSTRUCTION, alu_signal, reg_file_write, main_mem_write, 
    branch_control, immediate_select, operand_1_select, operand_2_select, 
    reg_write_select,RESET);

    input [31:0] INSTRUCTION;
    input RESET;


    //output control signals
    output wire reg_file_write, operand_1_select, operand_2_select;
    output wire [4:0] alu_signal;
    output wire [2:0] main_mem_write;
    output wire [3:0] main_mem_read;
    output wire [3:0] branch_control, immediate_select;
    output wire [1:0] reg_write_select;

    //decoded instructions
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7; 

    // to select the alu signal between funct3 and predefined 
    // values for JAL & AUIPC
    wire funct3_mux_select; 
    wire funct3_mux_out; 

    assign opcode = INSTRUCTION[6:0];
    assign funct3 = INSTRUCTION[14:12];
    assign funct7 = INSTRUCTION[31:25];

    // ALU control signal generation 



    
endmodule