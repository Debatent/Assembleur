.data
	x:.word 5
	y:.word 100
.text
.global main

main:
	ldr r2, =x
	ldr r0, [r2]
	ldr r2, =y
	ldr r1, [r2]
	bl sum_sqr
	bl exit

sqr: // r0 a la valeur donc on renvoit le carre (modifie r0 a r3)
	mov r1, r0
	mul r0, r1, r0
	bx lr

sum_sqr: // r0 et r1 ont les valeurs dont on veut la somme des carrés (r0 a r3)
	sub sp, sp, #8
	str lr, [sp]

	sub sp, sp, #8
	str r1, [sp] // sauve r1 dans sp

	bl sqr // appelle sqr sur r0

	ldr r1, [sp]
	str r0, [sp]

	mov r0, r1

	bl sqr // appelle sqr sur la deuxieme valeur

	ldr r1, [sp]
	add sp, sp, #8

	add r0, r0, r1

	ldr lr, [sp]
	add sp, sp, #8
	bx lr
