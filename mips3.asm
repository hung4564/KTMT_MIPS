.data 
      a:.word 0:100
.text
.globl main
main:
li $v0,5
syscall
move $t0,$v0
li $s0,0
li $s1,0
la $a0,a
move $a1,$a0
move $a2,$a0
nhap:
beq $s0,$t0,xuly
li $v0,5
syscall
sw $v0,($a0)
addi $s0,$s0,1
add $a0,$a0,4
j nhap
xuly:
li $s0,0
addi $a1,$a1,-4
fori:
slt $s4,$t0,$s0
beq $s4,1,in
addi $s0,$s0,1
addi $a1,$a1,4
addi $s1,$s0,1
addi $a2,$a1,0
     forj:
     slt $s5,$t0,$s1
     beq $s5,1,fori
     addi $s1,$s1,1
     addi $a2,$a2,4
     lw $t1,($a1)
     lw $t2,($a2)
     slt $t3,$t1,$t2
     beq $t3,1,doicho
     j forj
     doicho:
        sw $t1,($a2)
        sw $t2,($a1)
        j forj
in: la $a1,a
    li $s0,0
    for:
    beq $s0,$t0,exit
    li $v0,1
    lw $a0,($a1)
    syscall
    addi $a1,$a1,4
    addi $s0,$s0,1
    j for
exit: li $s0,2
        
