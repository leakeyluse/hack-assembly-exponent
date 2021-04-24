// A = RAM[16] = 3
@5
D=A
@A
M=D

// s = RAM[17] = 4
@6
D=A
@s
M=D

// C = RAM[18] = 0
@C
M=0

// set exponential
@A
D=M
@E
M=D

//Set outer counter i
@i
M=1

(EXP)
	@i
	D=M
	@s
	A=M
	D=D-A
	@EndExp
	D;JEQ
	
	@i
	M=M+1
	
	//Set inner counter j
	@A
	D=M
	@j
	M=D
	
	//update exponential if C > 0
	@C
	D=M
	@UpdateExp
	D;JGT

	@MULT
	0;JMP
	
(UpdateExp)
	//update exponential
	@C
	D=M
	@E
	M=D
	
	@C
	M=0

	@MULT
	0;JMP
	
(MULT)
	@j
	D=M
	@EXP
	D;JEQ
	
	//get current value of exponential
	@E		
	D=M 
	
	//add value at address of X to value at address of C
	// C = C + X
	@C      
	M=M+D
	
	//decrement counter
	// j = j - 1
	@j        
	M=M-1 
	
	@MULT
	0;JMP

(EndExp)
	@EndExp
	0;JMP