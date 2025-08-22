.data 
meu_array: .word 5, -2, 8, 1, 9, 15, -7, 22
tamanho_array: .word 8

prompt_busca: .asciiz "Digite o valor ointeiro a buscar no array: "
msg_encontrado: .asciiz "valor encontrado no indice: "
msg_nao_encontrado: .asciiz "Valor nao encontrado no array"
newline: .asciiz "\n"

.text
main:
la $s0, meu_array
lw $s1, tamanho_array

li $v0, 4
la $a0, prompt_busca
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 0
li $t2, -1

busca_loop:
bge $t1, $s1, fim_busca

mul $t3, $t1, 4
add $t4, $s0, $t3

lw $t5, 0($t4)
beq $t5, $t0, encontrado

addi $t1, $t1, 1
j busca_loop

encontrado:
move $t2, $t1

fim_busca:
li $t3, -1
beq $t2, $t3, nao_encontrado

li $v0, 4
la $a0, msg_encontrado
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, newline
syscall
j fim_programa

nao_encontrado:
li $v0, 4
la $a0, msg_nao_encontrado
syscall

fim_programa:
li $v0, 10 
syscall
