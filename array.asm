.data
prompt1: .asciiz "Digite o primeiro numero inteiro: "
prompt2: .asciiz "Digite o segundo numero inteiro: "
resultado_msg: .asciiz "A soma eh: "
newline: .asciiz "\n"

.text

main:
    # Pedir o primeiro n�mero
    li $v0, 4           # syscall code 4: print_string
    la $a0, prompt1     # endere�o da string prompt1
    syscall

    # Ler o primeiro n�mero
    li $v0, 5           # syscall code 5: read_int
    syscall
    move $t0, $v0       # Salvar o inteiro lido em $t0

    # Pedir o segundo n�mero
    li $v0, 4           # syscall code 4: print_string
    la $a0, prompt2     # endere�o da string prompt2
    syscall

    # Ler o segundo n�mero
    li $v0, 5           # syscall code 5: read_int
    syscall
    move $t1, $v0       # Salvar o inteiro lido em $t1

    # Calcular a soma
    add $t2, $t0, $t1   # $t2 = $t0 + $t1 (soma)

    # Imprimir a mensagem de resultado
    li $v0, 4           # syscall code 4: print_string
    la $a0, resultado_msg # endere�o da string resultado_msg
    syscall

    # Imprimir o resultado (a soma)
    li $v0, 1           # syscall code 1: print_int
    move $a0, $t2       # mover o resultado ($t2) para $a0 para impress�o
    syscall

    # Imprimir nova linha para formata��o
    li $v0, 4           # syscall code 4: print_string
    la $a0, newline     # endere�o da string newline
    syscall

    # Terminar o programa
    li $v0, 10          # syscall code 10: exit
    syscall
