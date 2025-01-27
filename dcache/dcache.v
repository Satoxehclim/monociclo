/*
	Grupo:5CV3
	Proyecto:    monociclo_FPGA
	Archivo:monociclo.v
	Equipo:Equipo 3
	Integrantes:Abraham Roman Ramírez
					Andrade Jiménez Jonathan 
					Brenda Vergara Martínez
					Kaleb Yael De La Rosa Gutiérrez
					Osmar Alejandro Garcia Jiménez
	Descripcion:Este es el archivo que hace una suma de 4 cada que
					se obtiene un flanco positivo en el reloj 
						
*/

module dcache (
	input					clk_i,
	input		[5:0]		addr_i,
	input		[31:0]	dato_i,
	input 				memwrite_i,
	input					memread_i,
	output	[31:0]	dato_o
);

	//Data cache
	reg 		[31:0] memoria [0:63];
	
	//puerto de escritura
	always @(posedge clk_i)
	begin
		if (memwrite_i)
			memoria[addr_i] <= dato_i;
	end
	
	//puerto de lectura
	assign dato_o = (memread_i) ? memoria[addr_i] : 32'b0;
endmodule
