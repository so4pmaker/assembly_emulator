.factorial:
	cmp r0, 2       
	beq .return
	cmp r0, 1
	beq .return
	bgt .continue
	b .return

.continue:
	sub sp, sp, 12   
	st r0, [sp]     
	st ra, 4[sp]    
	sub r0, r0, 1
	call .factorial
	st r1, 8[sp] 
	ld r0, [sp]
	sub r0, r0, 2
	call .factorial
	ld r0 , [sp]     
	ld ra, 4[sp]
	ld r2, 8[sp]    
	add r1, r2, r1  
	add sp, sp, 12   
	ret           
.return:
	mov r1, 1
	ret

.main:
	mov r0, 3
	call .factorial

	.print r1