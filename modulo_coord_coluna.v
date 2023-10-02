module modulo_coord_coluna(mdc,cdc);

    input [2:0] mdc;
    output [3:0] cdc;
    wire [2:0] nmdc;
    wire [1:0] cdc_1_wire;
    wire cdc_2_wire, cdc_3_wire;

    not(nmdc[2],mdc[2]);
    not(nmdc[1],mdc[1]);
    not(nmdc[0],mdc[0]);

    //STDIG0_0;

    and_gate_2_inputs gate_1(.A(mdc[2]),.B(mdc[0]),.S(cdc_1_wire[1]),);

    and_gate_2_inputs gate_2(.A(mdc[2]),.B(mdc[1]),.S(cdc_1_wire[0]),);

    or_gate_2_inputs gate_3(.A(cdc_1_wire[1]),.B(cdc_1_wire[0]),.S(cdc[3]),);

    //STDIG0_1;

    and_gate_2_inputs gate_4(.A(mdc[2]),.B(1'b1),.S(cdc[2]),);

    //STDIG0_2;

    and_gate_2_inputs gate_5(.A(mdc[2]),.B(mdc[0]),.S(cdc_2_wire),);

    or_gate_2_inputs gate_6(.A(mdc[1]),.B(cdc_2_wire),.S(cdc[1]),);
 
    //STDIG0_3

    and_gate_2_inputs gate_7(.A(mdc[2]),.B(mdc[1]),.S(cdc_3_wire),);

    or_gate_2_inputs gate_8(.A(mdc[0]),.B(cdc_3_wire),.S(cdc[0]),);

endmodule 