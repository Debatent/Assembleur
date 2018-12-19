.data
	print:.asciz "%d"
	a1: .word 1
	a2: .word 2
	msg1:.asciz "Entrez un entier a1:"
	msg2:.asciz "Entrez un second entier a2:"
	aff1:.asciz "a1 vaut maintenant %d \n"
	aff2:.asciz "a2 vaut maintenant %d \n"
.text
.global main
main:
	ldr r0, =msg1
	bl printf// demande un entier
	ldr r0, =print
	ldr r1, =a1
	bl scanf // entre un entier
	ldr r0, =msg2
	bl printf // demande le second entier
        ldr r0, =print
        ldr r1, =a2
        bl scanf // entre le second entier

	bl permute

        ldr r0, =aff1
        ldr r2, =a1
        ldr r1, [r2]
        bl printf
        ldr r0, =aff2
        ldr r2, =a2
        ldr r1, [r2]
        bl printf

	bl exit

permute: // permute a1 et a2
	sub sp, sp, #8
	str lr, [sp]

	sub sp, sp, #8

	ldr r2, =a1
	ldr r1, [r2]
	str r1, [sp] // on stocke la valeur en a1 dans la pile

	ldr r2, =a2
	ldr r0, [r2]
	ldr r1, =a1
	str r0, [r1] // On stocke la valeur de a1 a l'adresse de a2

	ldr r1, [sp]
	str r1, [r2] // On stocke la valeur de la pile en r2

	add sp, sp, #8


	ldr lr, [sp]
	add sp, sp, #8

	bx lr
