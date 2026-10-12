module comparator(up_down, cont, reset);
input up_down;
input [3:0]cont;
output wire reset;

assign reset = (up_down)? ((cont==4'd10) ? 1:0 ) : ((cont==4'd15) ? 1:0 );

//assign reset=(cont==4'd10 || cont==4'd15)? 1:0;
endmodule