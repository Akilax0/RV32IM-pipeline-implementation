`timescale 1ns/100ps

module data_cache_memory(
    clock,
    reset,
    read,
    write,
    address,
    writedata,
    readdata,
    busywait,
    MAIN_MEM_READ,
    MAIN_MEM_WRITE,
    MAIN_MEM_WRITE_DATA,
    MAIN_MEM_READ_DATA,
    MAIN_MEM_BUSY_WAIT
);

    input               clock;
    input               reset;
    input[3:0]          read;
    input[2:0]          write;
    input[31:0]         address;
    input[31:0]         writedata;
    output reg [31:0]   readdata;
    output reg          busywait;

    //main memory input outputs
    output              MAIN_MEM_READ;
    output              MAIN_MEM_WRITE;
    output[27:0]        MAIN_MEM_ADDRESS;
    output[127:0]       MAIN_MEM_WRITE_DATA;
    input[127:0]        MAIN_MEM_READ_DATA;
    input               MAIN_MEM_BUSY_WAIT;


    // Declare cache memory array 256x8 bits
    reg [127:0] data_array  [8:0];
    // Declare tag array 256x8 - bits
    reg [24:0] tag_array    [8:0];
    // Declare dirty bit array 256x8-bits
    reg [1:0] dirty_bit_array   [8:0];
    // Declare valid bit array 256x8-bits
    reg [1:0] valid_bit_arry [8:0];

    parameter IDLE = 2'b00, MEM_READ = 2'b01,MEM_WRITE = 2'b10;
    reg [1:0] state, next_state;


