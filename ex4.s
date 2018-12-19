.data
	n: .word 10
        print:.asciz "%d"
        msg1:.asciz "Entrez un entier N:"
        aff1:.asciz "fib(n) vaut %d \n"


.text
.global main
main:
        ldr r0, =msg1
        bl printf// demande un entier
        ldr r0, =print
        ldr r1, =n
        bl scanf // entre un entier

	ldr r1, =n
	ldr r0, [r1]
	bl fib0

        mov r1, r0
        ldr r0, =aff1
        bl printf

	bl exit
fib0:
	cmp r0, #1
	bgt fib
	mov r0, #1
	bx lr

fib:
        sub sp, sp, #8
        str lr, [sp]
	cmp r0, #2
	ble fin

	sub r0, #1
	bl fib
depil:
	add r0, r1, r2
	mov r2, r1
	mov r1, r0
	ldr lr, [sp]
	add sp, sp, #8
	bx lr

fin:
	mov r1, #1
	mov r2, #1
	b depil
