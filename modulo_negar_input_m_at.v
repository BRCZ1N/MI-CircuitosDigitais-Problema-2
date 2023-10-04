module modulo_negar_input_m_at(m_at,N_m_at);

	input [35:0] m_at;
	output [34:0] N_m_at;
	
	not(N_m_at[34],m_at[34]); 
	not(N_m_at[29],m_at[33]);
	not(N_m_at[24],m_at[32]);
	not(N_m_at[19],m_at[31]);
	not(N_m_at[14],m_at[30]);
	not(N_m_at[9],m_at[29]);
	not(N_m_at[4],m_at[28]);
	
	not(N_m_at[33],m_at[27]);
	not(N_m_at[28],m_at[26]);
	not(N_m_at[23],m_at[25]);
	not(N_m_at[18],m_at[24]);
	not(N_m_at[13],m_at[23]);
	not(N_m_at[8],m_at[22]);
	not(N_m_at[3],m_at[21]);
	
	not(N_m_at[32],m_at[20]);
	not(N_m_at[27],m_at[19]);
	not(N_m_at[22],m_at[18]);
	not(N_m_at[17],m_at[17]);
	not(N_m_at[12],m_at[16]);
	not(N_m_at[7],m_at[15]);
	not(N_m_at[2],m_at[14]);
	
	not(N_m_at[31],m_at[13]);
	not(N_m_at[26],m_at[12]);
	not(N_m_at[21],m_at[11]);
	not(N_m_at[16],m_at[10]);
	not(N_m_at[11],m_at[9]);
	not(N_m_at[6],m_at[8]);
	not(N_m_at[1],m_at[7]);
	
	not(N_m_at[30],m_at[6]);
	not(N_m_at[25],m_at[5]);
	not(N_m_at[20],m_at[4]);
	not(N_m_at[15],m_at[3]);
	not(N_m_at[10],m_at[2]);
	not(N_m_at[5],m_at[1]);
	not(N_m_at[0],m_at[0]);
	
	
	

endmodule 
