`include "../alu_module/alu.v"
`include "../reg_file_module/reg_file.v"

`include "../supported_modules/mux2to1_3bit.v"
`include "../immediate_select_module/immediate_select.v"
`include "../control_unit_module/control_unit.v"
// Haven't included debug outputs yet
// Haven't included interrupt signal 

// TODO : write testbench 
module cpu(PC, INSTRUCTION, CLK, RESET, memReadEn, memWriteEn, DATA_CACHE_ADDR, DATA_CACHE_DATA, DATA_CACHE_READ_DATA, DATA_CACHE_BUSY_WAIT, 
    insReadEn, INS_CACHE_BUSY_WAIT);

    input [31:0] INSTRUCTION;           // fetched INSTRUCTIONS
    input CLLK, RESET;                  // clock and reset for the cpu
    input DATA_CACHE_BUSY_WAIT;         // busy wait signal from the memory
    input INS_CACHE_BUSY_WAIT;          // busy wait from the instruction memory 
    input [31:0] DATA_CACHE_READ_DATA;     // input from the memory read
    output reg [31:0] PC;               // programme counter
    output [3:0] memReadEn;             // control signal to the data memory 
    output [2:0] memWriteEn;            // control signal to the data memory 
    output reg insReadEn;               // read enable for the instruction read
    output [31:0] DATA_CACHE_ADDR, DATA_CACHE_DATA;  // output signal to memory 

    wire FLUSH;


//================= STAGE 1 ==========================

    //data lines
    reg [31:0] PR_INSTRUCTION, PR_PC_S1;

    // structure
    wire [31:0] PC_NEXT, PC_NEXT_FINAL, PC_NEXT_REGFILE;
    //wire INTERUPT_PC_REG_EN;

    //additional registers
    reg [31:0] PC_PLUS_4;

    //units
    // TODO : ALUOUT and BRANCHSELSECT 
//    mux2tol_32bit muxjump(PC_PLUS_4, ALU_OUT, PC_NEXT, BRANCH_SELECT_OUT);

   // interrupt control unit
   // TODO;


   always @(posedge CLK)
   begin   
        PC_PLUS_4 = PC + 4;
   end 

//================= STAGE 2 ==========================
    // data lines
    reg[31:0] PR_PC_S2, PR_DATA_1_S2, PR_DATA_2_S2, PR_IMMEDIATE_SELECT_OUT;
    reg[4:0] PR_REGISTER_WRITE_ADDR_S2;

    // for the forwarding unit
    reg [4:0] REG_READ_ADDR1_S2, REG_READ_ADDR2_S2;

    // control lines
    reg [3:0] PR_BRANCH_SELECT_S2, PR_MEM_READ_S2;
    reg [5:0] PR_ALU_SELECT;
    reg PR_OPERAND1_SEL, PR_OPERAND2_SEL;
    reg [2:0] PR_MEM_WRITE_S2;
    reg [1:0] PR_REG_WRITE_SELECT_S2;
    reg PR_REG_WRITE_EN_S2;

    // structure
    wire [31:0] DATA1_S2, DATA2_S2, IMMEDIATE_OUT_S2;
    wire [3:0] IMMEDIATE_SELECT;
    wire [3:0] BRANCH_SELECT, MEM_READ_S2;
    wire [5:0] ALU_SELECT; 
    wire OPERAND1_SEL, OPERAND2_SEL;

    wire [2:0] MEM_WRITE_S2;
    wire [1:0] REG_WRITE_SELECT_S2;
    wire REG_WRITE_EN_S2;

    // random number generator module

    // units 
    // TODO : WRITE_DATA, WRITE_ADDR, WRITE_EN

    reg_file myreg (REG_WRITE_DATA
                    DATA1_S2,
                    DATA2_S2,
                    PR_REGISTER_WRITE_ADDR_S2,
                    PR_INSTRUCTION[19:15],
                    PR_INSTRUCTION[24:20],
                    PR_REG_WRITE_EN_S2,
                    CLK,
                    RESET);
// s2 or s4 ? 

    immediate_select myImmediate (PR_INSTRUCTION, IMMEDIATE_SELECT, IMMEDIATE_OUT_S2);

    control_unit myControl (PR_INSTRUCTION,
                            ALU_SELECT,
                            REG_WRITE_EN_S2,
                            MEM_WRITE_S2,
                            BRANCH_SELECT,
                            IMMEDIATE_SELECT,
                            OPERAND1_SEL,
                            OPERAND2_SEL,
                            REG_WRITE_SELECT_S2,
                            RESET);


//================= STAGE 3 ==========================
//================= STAGE 4 ==========================
//================= STAGE 5 ==========================


endmodule
