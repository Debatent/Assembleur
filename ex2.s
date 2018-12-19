.data
	print:.asciz "%d"
	x:.word 5
	y:.word 100
        msg1:.asciz "Entrez un entier x:"
        msg2:.asciz "Entrez un second entier y:"
	msg_res:.asciz "x*x+y*y vaut %d \n"

.text
.global main

main:
	ldr r0, =msg1
        bl printf// demande un entier
        ldr r0, =print
        ldr r1, =x
        bl scanf // entre un entier
        ldr r0, =msg2
        bl printf // demande le second entier
        ldr r0, =print
        ldr r1, =y
        bl scanf // entre le second entier

	ldr r2, =x // appelle la fonction
	ldr r0, [r2]
	ldr r2, =y
	ldr r1, [r2]

	bl sum_sqr // effectue la fonction

	mov r1, r0 // affiche le resultat
        ldr r0, =msg_res
        bl printf

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
