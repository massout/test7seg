module test7seg(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,


	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,
	output	[6:0] HEX0,
	output	[6:0] HEX1,
	output	[6:0] HEX2,
	output	[6:0] HEX3,
	output	[6:0] HEX4,
	output	[6:0] HEX5

); 
	 
//nios_sistemi u0 (
//  .clk_clk       (CLOCK_50),       //   clk.clk
//  .reset_reset_n (1'b1), // reset.reset_n
//  .pio_export    (LEDR)     //   pio.export
//);
////////////SAGSOL////////////
reg [6:0] list [8:0];
parameter sayi = 59;
parameter bolme = sayi /10;
parameter mod = sayi % 10;
parameter [3:0] bcd = bolme;
parameter [3:0] acd = mod;

function [7:0] mod;
	input [7:0] num;
	begin
		
		


function [7:0] seg;

	input [3:0] bcd;
	
	begin
	
		seg[0]= ((~bcd[3])&(~bcd[2])&(~bcd[1])&bcd[0]) | ((~bcd[3])&bcd[2]&(~bcd[1])&(~bcd[0])); //Logical expression for segment0 (Segment A)
		
		seg[1]= ((~bcd[3])&bcd[2]&(~bcd[1])&bcd[0]) | ((~bcd[3])&bcd[2]&bcd[1]&(~bcd[0])); //Logical expression for segment1 (Segment B)
		
		seg[2]= ((~bcd[3])&(~bcd[2])&bcd[1]&(~bcd[0])); //Logical expression for segment2 (Segment C)

		seg[3] = ((~bcd[3])&(~bcd[2])&(~bcd[1])&bcd[0]) | ((~bcd[3])&bcd[2]&(~bcd[1])&(~bcd[0])) | ((~bcd[3])&bcd[2]&bcd[1]&bcd[0]); //Logical expression for segment3 (Segment D)
		
		seg[4] = ((~bcd[3])&bcd[0]) | ((~bcd[3])&bcd[2]&(~bcd[1])) | (~(bcd[2])&(~bcd[1])&bcd[0]); //Logical expression for segment4 (Segment E)
		
		seg[5] = ((~bcd[3])&(~bcd[2])&bcd[0]) | ((~bcd[3])&(~bcd[2])&bcd[1]) | ((~bcd[3])&bcd[1]&bcd[0]); //Logical expression for segment5 (Segment F)
		
		seg[6] = ((~bcd[3])&(~bcd[2])&(~bcd[1]))|((~bcd[3])&bcd[2]&bcd[1]&bcd[0]); //Logical expression for segment6 (Segment G)
		
		seg[7] = 1;
	
	end
endfunction
	
	
assign HEX5 = seg(bolme); /*SOL*/
assign HEX4 = seg(mod);//list[mod]; /*SAG*/


////////////// HEX ///////////////
/*reg sifir = 7'b1000000;
reg bir = 7'b1111001;
reg iki = 7'b0100100;
reg uc = 7'b0110000;
reg dort = 7'b0011001;
reg bes = 7'b0010010;
reg alti = 7'b0000010;
reg yedi = 7'b1111000;
reg sekiz = 7'b0000000;
reg dokuz = 7'b0010000;

//reg [6:0] list [8:0];
assign list[0]=sifir;
assign list[1]=bir;
assign list[2]=iki;
assign list[3]=uc;
assign list[4]=dort;
assign list[5]=bes;
assign list[6]=alti;
assign list[7]=yedi;
assign list[8]=sekiz;
assign list[9]=dokuz;*/

reg [31:0] sayac;
reg i = 8'b00000000;
/*
always @ (posedge CLOCK_50)
begin
	  if (i  == 8'b10000000)
	  begin
			state <= 1'b1;
			i  <= 8'b10000000;
	  end
	  
	  if (i  == 8'b00000000)
	  begin
			state <= 1'b0;
			i  <= 8'b00000010;
	  end
	  
	  counter <= counter + 1'b1;
	  
	  if (counter >= 30000000)
	  begin
			if (state == 1'b0)
				 i  <= i  << 1;
			else if()
				 
			counter <= 0;
	  end
 end

*/
assign HEX0=7'b0110000;
assign HEX1=7'b1000000;
assign HEX2=7'b0010000;
assign HEX3=7'b1111001;



////////// END HEX ///////////////
////////////// LEDR //////////////

reg [31:0] counterc;
reg LED_buf;
reg LED_status;

initial begin 
	counterc <= 32'b0;
	LED_status <= 1'b0;
	LED_buf <= 18'b0;
end

always @ (posedge CLOCK_50)
begin
	counterc <= counterc + 1'b1;
		if (counterc > 50000000)
			begin
				LED_buf <= !LED_buf;
				counterc <= 32'b0;
		end

end

assign LEDR[0] = LED_buf;
assign LEDR[1] = LED_buf;
assign LEDR[2] = LED_buf;
assign LEDR[3] = LED_buf;
assign LEDR[4] = LED_buf;
assign LEDR[5] = LED_buf;
assign LEDR[6] = LED_buf;
assign LEDR[7] = LED_buf;
assign LEDR[8] = LED_buf;
assign LEDR[9] = LED_buf;
assign LEDR[10] = LED_buf;
assign LEDR[11] = LED_buf;
assign LEDR[12] = LED_buf;
assign LEDR[13] = LED_buf;
assign LEDR[14] = LED_buf;
assign LEDR[15] = LED_buf;
assign LEDR[16] = LED_buf;
assign LEDR[17] = LED_buf;


/////////// END LEDR /////////////
////////////// LEDG //////////////
 
 reg     [24:0] counter;
 reg     [8:0] leds  = 8'b00000001;
 reg     state = 1'b0;

 always @(posedge CLOCK_50)
 begin
	  if (leds  == 8'b10000000)
	  begin
			state <= 1'b1;
			leds  <= 8'b10000000;
	  end
	  
	  if (leds  == 8'b00000000)
	  begin
			state <= 1'b0;
			leds  <= 8'b00000010;
	  end
	  
	  counter <= counter + 1'b1;
	  
	  if (counter >= 30000000)
	  begin
			if (state == 1'b0)
				 leds  <= leds  << 1;
			else if (state == 1'b1) 
				 leds  <= leds  >> 1;
				 
			counter <= 0;
	  end
 end

 assign LEDG[0] = leds [0];
 assign LEDG[1] = leds [1];
 assign LEDG[2] = leds [2];
 assign LEDG[3] = leds [3];
 assign LEDG[4] = leds [4];
 assign LEDG[5] = leds [5];
 assign LEDG[6] = leds [6];
 assign LEDG[7] = leds [7];

/////////// END LEDG //////////////

endmodule
