module ALU(
 input  [15:0] a,  //src1
 input  [15:0] b,  //src2
 input  [5:0] alu_control,
 output reg [15:0] result,  //result 
 output zero
    );
reg [3:0] flags; // [0]-zero, [1]-negative, [2]-carry, [3]-overflow
//flags[0]<= 0;
//flags[1]<= 0;
//flags[2]<= 0;
//flags[3]<= 0;
always @(*)
begin 
 case(alu_control)
 6'b000000:begin result = a + b;//add
    if(a==b && a==0) flags[0]=1'b1; 
    if(a[15]==0 && b[15]==0 && result[15]==1) flags[3]=1'b1; //a,b>0, res<0
    if(a[15]==1 && b[15]==1 && result[15]==0) flags[3]=1'b1; //a,b<0,res>0
    if(result>32767) flags[3]=1'b1;
	end
 6'b000001: begin
result = a - b;  //sub
    if(a<b) begin flags[1]=1'b1; end 
    if(a==b) begin flags[0]=1'b1; end
end
 6'b000010: result = a << b; //shift logic
 6'b000011: result = a >> b; //shift logic
 6'b000100: begin
     result = a <<< b; //shit aritmetic
     flags[2]<=a[15];
end
 6'b000101: begin result = a >>> b; // shift aritmetic
    flags[2]<=a[0];
end
 6'b000110: result = a; // 
 6'b000111: begin
    result = a * b; //MUL
    if((a>0 && b<0) || (a<0 && b>0)) begin flags[0]=1'b1; end
    if(result==0) begin flags[0]= 1'b1; end
end
 6'b001000: begin
    result = a / b; //div
    if(result==0) begin flags[0]= 1'b1; end
    if(result<0) begin flags[1]= 1'b1; end
end
 6'b001001: result = a % b; //mod
 6'b001010: begin
    result = a & b; //and
    if(result==0) begin flags[0]= 1'b1; end
    if(result<0) begin flags[1]= 1'b1; end
end
 6'b001011: begin
    result = a | b; //or
    if(result==0) begin flags[0]= 1'b1; end
    if(result<0) begin flags[1]= 1'b1; end
end
 6'b001101:begin 
    result = a ^ b; //xor
    if(result==0) begin flags[0]= 1'b1; end
    if(result<0) begin flags[1]= 1'b1; end
end
 6'b001110: begin
    result = ~a;  //not
    if(result==0) begin flags[0]= 1'b1; end
    if(result<0) begin flags[1]= 1'b1; end
end
 6'b001111: begin 
	result = a - b; // cmp
	if(result == 0) flags[0] = 1'b1;
	if(result < 0) flags[1] = 1'b1;
end
 6'b010000: result = a & b; // tst
 6'b010001: result = a + 1; //inc
 6'b010010: begin
    result = a - 1; //dec
    if(result==0) begin flags[0]= 1'b1; end 
    if(result<0) begin flags[1]= 1'b1; end
end
 endcase
end
assign zero = (result==16'd0) ? 1'b1: 1'b0;
 
endmodule
