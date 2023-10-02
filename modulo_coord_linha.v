module modulo_coord_linha(mdl,cdl);

    input [2:0] mdl;
    output [3:0] cdl;
    wire [2:0] nmdl;

    not(nmdl[2],mdl[2]);
    not(nmdl[1],mdl[1]);
    not(nmdl[0],mdl[0]);

    //STDIG0_0;

    and_gate_3_inputs gate_1(.A(mdl[2]),.B(mdl[1]),.C(mdl[0]),.S(cdl[3]),);

    //STDIG0_1;
    and_gate_2_inputs gate_2(.A(mdl[2]),.B(1'b1),.S(cdl[2]),);

    //STDIG0_2;
    and_gate_2_inputs gate_3(.A(mdl[1]),.B(1'b1),.S(cdl[1]),);

    //STDIG0_3
    and_gate_2_inputs gate_4(.A(mdl[0]),.B(1'b1),.S(cdl[0]),);

endmodule 