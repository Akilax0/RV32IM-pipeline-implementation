`timescale 1ns/100ps

module immediate_select(INSTRUCTION, SELECT, OUTPUT);

    input [31:0] INSTRUCTION;
    input [3:0] SELECT;
    output reg [31:0] OUTPUT;

    wire [19:0] TYPE1, TYPE2;
    wire [11:0] TYPE3, TYPE4, TYPE5;
    wire [4:0] TYPE6;


    // Combinations
    assign TYPE1 = INSTRUCTION[31:12];  //  U - Immediate
    assign TYPE2 = INSTRUCTION[31:12];  // J - Immediate
    assign TYPE3 = INSTRUCTION[31:20];
    assign TYPE4 = (INSTRUCTION[31:25],INSTRUCTION[11:7]);
    assign TYPE5 = (INSTRUCTION[31:25],INSTRUCTION[11:7]);
    assign TYPE6 = INSTRUCTION[29:25];


// SELECT[3] == 1'b1 used for signed

always @(*)begin
    case (SELECT[2:0])
        // TYPE 1
        3'b000:
            OUT = {TYPE1, {12{1'b0}}};
        // TYPE 2
        3'b001:
            // leave this for now else: by default
            if(SELECT[3] == 1'b1)
                OUT = {{11{1'b0}},TYPE2,1'b0};
            else
                // seperate INSTRUCTION[31] on 2nd position to show similarity with signed
                //OUT = {{11{INSTRUCTION[31]}},INSTRUCTION[31], INSTRUCTION[19:12], INSTRUCTION[30:21],1'b1}; 
                OUT = {{11{INSTRUCTION[31]}},INSTRUCTION[31], INSTRUCTION[19:12],INSTRUCTION[20], INSTRUCTION[30:21],1'b0}; 
        // TYPE 3
        3'b010:
            if(SELECT[3] == 1'b1)
                OUT = {{20{1'b0}},TYPE3};
            else
                OUT = {{20{TYPE3[11]}}, TYPE3};
        // TYPE 4
        3'b011:
            if (SELECT[3] == 1'b1)
                OUT = {{20{1'b0}},INSTRUCTION[31],INSTRUCTION[7],INSTRUCTION[30:25],INSTRUCTION[11:8],1'b0};
            else
                OUT = {{20{INSTRUCTION[31]}},INSTRUCTION[31],INSTRUCTION[7],INSTRUCTION[30:25],INSTRUCTION[11:8],1'b0};
        // Type 5
        3'b100:
            if (SELECT[3] == 1'b1)
                OUT = {{20{1'b0}}, TYPE5};
            else
                OUT = {{20{TYPE5[11]}}, TYPE5};
        // Type 6
        3'b101:
            OUT = {{27{1'b0}}, TYPE6};
    endcase
end

endmodule