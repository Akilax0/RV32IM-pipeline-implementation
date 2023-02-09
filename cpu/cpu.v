`include "./alu.v"
`include "./reg_file.v"

// Haven't included debug outputs yet
// Haven't included interrupt signal 

// TODO : write testbench 
module cpu(PC, INSTRUCTION, CLK, RESET, memReadEn, memWriteEn, DATA_CACHE_ADDR, DATA_CACHE_DATA, DATA_CACHE_READ_DATA, DATA_CACHE_BUSY_WAIT, insReadEn, INS_CACHE_BUSY_WAIT, CLK_RAND_GEN );

    input [31:0] INSTRUCTION;       // fetched INSTRUCTIONS
    input CLLK, RESET, CLK_RAND_GEN;    // clock and reset for the cpu
    input DATA_CACHE_BUSY_WAIT;         // busy wait signal from the memory
    input INS_CACHE_BUSY_WAIT;          // busy wait from the instruction memory 
    input [31:0] DATA_CACHE_READ_DATA;     // input from the memory read
    output reg [31:0] PC;               // programme counter
    output [3:0] memReadEn;             // control signal to the data memory 
    output [2:0] memWriteEn;            // control signal to the data memory 
    output reg insReadEn;               // read enable for the instruction read
    output [31:0] DATA_CACHE_ADDR, DATA_CACHE_DATA;     // output signal to memory 


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
    mux2tol_32bit muxjump(PC_PLUS_4, ALU_OUT, PC_NEXT, BRANCH_SELECT_OUT);

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



//================= STAGE 3 ==========================
//================= STAGE 4 ==========================
//================= STAGE 5 ==========================


endmodule
