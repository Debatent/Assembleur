.data:
	x:.word
	y:.word
.global sqr
sqr:
	ldr r2, =x
	ldr r0, [r2]
	ldr r1, [r2]
	mul r2, r0, r1
	str r2, =x
	bx lr

.global sum_sqr
sum_sqr:
	
