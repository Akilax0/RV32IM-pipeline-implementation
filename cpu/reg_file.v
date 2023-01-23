module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
    
    input   [31:0]  IN; // 32 bit data input
    input   [4:0]   INADDRESS, OUT1ADDRESS, OUT2ADDRESS;    //5bit data inputs
    input   WRITE, CLK, RESET;  //1 bit data inputs
    
    output  [31:0]  OUT1, OUT2; //32 bit data outputs
    
    reg     [31:0]  REGISTERS   [31:0]; //32 bit x 32 register reg_file

    // output 
    assign  OUT1 = REGISTERS[OUT1ADDRESS];
    assign  OUT2 = REGISTERS[OUT2ADDRESS];


    integer i;
    always @ (posedge CLK) // on positive clock edge 
    begin
        if (RESET == 1'b1)
        begin
            for (i=0; i<32; i = i + 1) // looping through register file and 
                // settingn 0
            begin
                REGISTERS[i] = 0;   
            end
        end
        else
        begin
            if (WRITE == 1'b1)
            begin
                REGISTERS[INADDRESS] = IN;    
            end
        end
    end


endmodule
