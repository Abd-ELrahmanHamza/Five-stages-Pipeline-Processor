#this is a comment 
#all numbers are in hexadecimal
#the reset signal is raised before this code is executed and the flags and the registers are set to zeros.
.ORG 0 #this is the interrupt code
LDM R1,15     #R1=0015
ADD R1,R4
STD R4,(R1)
RTI
.ORG 200 #this is the instructions code
IN R2        #R2=0019 add 19 in R2
IN R3        #R3=000F
IN R4        #R4=F320
LDM R1,5     #R1=5
PUSH R1      #SP=000007FE,M[000007FF]=5
PUSH R2      #SP=000007FD,M[000007FE]=19
POP R1       #SP=000007FE,R1=00000019
POP R2       #SP=000007FF,R2=00000005
LDD (R3),R5  #R5=M[0000000F]
STD R1,(R5)  #M[00000000]=00000019
LDD (R5),R7  #R7=M[000000019]
