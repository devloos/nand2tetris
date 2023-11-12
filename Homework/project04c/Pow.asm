// init R5
@R5     
M=0     

// pow loop control variable
@R4
D=M
@powlcv  
M=D 

// R0 = R3
@R3     
D=M
@R0 
M=D 

// Counter for mult
@R1    
M=1 

// The sign of the result
@temp  
M=1

// If power is only 1, then
@R4
D=M-1   
@RETURNBASE 
D;JEQ

@R3
D=M
@MAINLOOP
D;JGT       
@R0    
M=-M   


(MAINLOOP)
@R2
M=0 

(MULTLOOP)
@R1
D=M
@BREAK  // break; if R1 is 0
D;JEQ

// R2 = R2 + R0
@R0
D=M
@R2
M=M+D  

@R1
M=M-1  

@MULTLOOP
0;JMP

(BREAK)    
@R3        
D=M        
@NEGATE    
D;JGT      
@temp
M=-M   

(NEGATE)
@R2
D=M
@R1
M=D  

@powlcv
M=M-1      
D=M
@EXIT
D;JEQ     

@MAINLOOP
0;JMP


(RETURNBASE)
@R3
D=M
@R2
M=D 


(EXIT)
@temp
D=M
@SKIPNEGATE   
D;JGT
@R2
M=-M

(SKIPNEGATE)
@R2
D=M
@R5
M=D


(END)
@END
0;JMP