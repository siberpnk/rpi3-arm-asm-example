; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; your function must mov the address of the sorted array to r0
	push {lr}
	push {r1, r2, r3, r4, r5, r6, r7, r8}

	;initialisation
	mov r3, r0 ; array size
	mov r4, r1 ; array
	mov r0, r2 ; BASE address
	mov r1, r3 ; array size
	push {r1}
	mov r2, r4 ; array
	mov r3, 0  ; iterator
	mov r6, 0  ; 
	mov r7, 4  ; mul opperand/index width

.sort:
	cmp r6, r1
	bge .rst_itr

	cmp r1, #1 ; check full pass
	ble .print

	ldr r4, [r2, r3] ; current index
	add r6, 1
	mul r3, r6, r7   ; iterate index
	ldr r5, [r2, r3] ; current index
	cmp r4, r5
	bgt .swap
	ble .sort

.swap:
	sub r6, 1
	mul r3, r6, r7
	str r5, [r2, r3]
	add r6, 1
	mul r3, r6, r7
	str r4, [r2, r3]
	;bx lr ; break point
	b .sort

.rst_itr:
	sub r1, #1
	mov r6, 0
	mov r3, 0
	b .sort

.print:
	pop {r1}
	bl stage2_flash_array	
	

.return:
	pop {r1, r2, r3, r4, r5, r6, r7, r8}
	pop {lr}
        bx lr
