.data
	prompt1: .asciiz "Nhap ho ten:"
	prompt2: .asciiz "Nhap tuoi:"
	hoten: .space 24
	tuoi: .word 0
.text
.globl main
main:
	li	$v0,4
	la	$a0,prompt1
	syscall
	
	li	$v0,8
	la	$a0,hoten
	li	$a1,24
	syscall
	
	li	$v0,4
	la	$a0,prompt2
	syscall
	li	$v0,5
	syscall
	la	$a0,tuoi
	sw	$v0,($a0)
	li	$v0,4
	la	$a0,prompt1
	syscall
	li	$v0,4
	la	$a0,hoten
	syscall
	li	$v0,4
	la	$a0,prompt2
	syscall
	li	$v0,1
	la	$a1,tuoi
	lw	$a0,($a1)
	syscall
	li	$v0,10
	syscall
