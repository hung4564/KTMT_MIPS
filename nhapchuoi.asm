.data
	str1:	.asciiz "nhap chuoi:"
	chuoi: 	.space 24
.text
.globl main
main:
	li	$v0,4
	la	$a0,str1
	syscall	
	li	$v0,8
	la	$a0,chuoi
	li	$a1,24
	syscall
	li	$v0,4
	la	$a0,chuoi
	syscall
	li	$v0,10
	syscall
	
	