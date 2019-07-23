  .data
  smallletter:.asciiz  "alpha ","bravo ","china ","delta ","echo ","foxtrot ",  "golf ","hotel ","india ","juliet ","kilo ","lima ",  "mary ","november ","oscar ","paper ","quebec ","research ",  "sierra ","tango ","uniform ","victor ","whisky ","x-ray ",  "yankee ","zulu "
Capital:.asciiz  "Alpha ","Bravo ","China ","Delta ","Echo ","Foxtrot ",  "Golf ","Hotel ","India ","Juliet ","Kilo ","Lima ",  "Mary ","November ","Oscar ","Paper ","Quebec ","Research ",  "Sierra ","Tango ","Uniform ","Victor ","Whisky ","X-ray ",  "Yankee ","Zulu "
number:.asciiz  "zero ", "First ", "Second ", "Third ", "Fourth ",  "Fifth ", "Sixth ", "Seventh ","Eighth ","Ninth "
L:  .word  0,7,14,21,28,34,43,49,56,63,71,  77,83,89,99,106,113,121,131,  139,146,155,163,171,178,186
N:.word  0,6,13,21,28,36,43,50,59,67
U:  .word  0,7,14,21,28,34,43,49,56,63,71,  77,83,89,99,106,113,121,131,  139,146,155,163,171,178,186 
 .text
 main:  li $v0, 12 #read input 
  syscall 
sub $t1, $v0, 63 # if it is '?'
  beqz $t1, bye 
sub $t1, $v0, 48 
#strange things 
 slt $s0, $t1, $0  
  bnez $s0, strange_things
 #number
 sub $t2, $t1, 10 
slt $s1, $t2, $0
bnez $s1, Num 
 # capital
sub $t2, $v0, 91
slt $s3, $t2, $0 
sub $t3, $v0, 64
 sgt $s4, $t3, $0
and $s0, $s3, $s4
bnez $s0, Cap
  # small letter 
sub $t2, $v0, 123 
 slt $s3, $t2, $0 
  sub $t3, $v0, 96 
 sgt $s4, $t3, $0 
and $s0, $s3, $s4
bnez $s0, Small
  j strange_things
strange_things: and $a0, $a0,$a0  
add $a0, $a0, 42
  li $v0, 11 
 syscall  
 j main
 Num:add $t2, $t2, 10  
 sll $t2, $t2, 2 
  la $s0, N  
 add $s0, $s0, $t2 
  lw $s1, ($s0)
 la $a0, number  
 add $a0, $a0, $s1  
 li $v0, 4
syscall
  j main  
 # upper case word
 Cap:sub $t3, $t3, 1 
 sll $t3, $t3, 2 
la $s0, U  
add $s0, $s0, $t3 
 lw $s1, ($s0)
la $a0, Capital
  add $a0, $s1, $a0 
li $v0, 4
syscall
  j main  
  # lower case word
  Small:sub $t3, $t3, 1 
sll $t3, $t3, 2 
la $s0, L
  add $s0, $s0, $t3  
  lw $s1, ($s0)
 la $a0, smallletter 
 add $a0, $s1, $a0 
  li $v0, 4
 syscall 
j main
bye:  li $v0, 10 #nice!!!!!!!!! 
 syscall