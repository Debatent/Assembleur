.data 
.balign 4
	a1: .word 1
.balign 4
	a2: .word 2
.text
.global main
main:
	bl permute
	bl exit

permute:
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
