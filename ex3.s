.data
        print:.asciz "%d"
	n:.word 10
        msg1:.asciz "Entrez un entier n:"
        aff1:.asciz "La somme des entiers inferieurs à n est %d \n"

.text
.global main
main:
	ldr r0, =msg1
        bl printf// demande un entier
        ldr r0, =print
        ldr r1, =n
        bl scanf // entre un entier

	ldr r1, =n // appelle la fonction
	ldr r2, [r1]
	mov r0, r2
	bl sumI

	mov r1, r0
	ldr r0, =aff1
	bl printf

	bl exit

sumI: // quand on appelle sum depuis le main, r0 = r2 = nbr dont on veut la somme inferieure
	sub  sp, sp, #8
	str lr, [sp]
	b sum
sum:
	cmp r0, #0
	ble sum0
	sub sp, sp, #8
	str r0, [sp]
	sub r0, #1
	b sum
depil:
	ldr r0, [sp]
	add sp, sp, #8
	add r1, r1, r0
	cmp r2, r0
	bgt depil
	b endfunc
sum0:
	sub sp, sp, #8
        str r0, [sp]
	mov r1, #0 //r1 va etre la somme
	cmp r2, r0
	bgt depil
endfunc:
	mov r0, r1
	ldr lr, [sp]
	add sp, sp, #8
	bx lr
