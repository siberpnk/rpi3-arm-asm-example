; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
	push {lr}
	push {r0, r1, r2, r3, r4, r5, r6, r7, r8}

	;initialisation
	mov r4, r1 ; array size
	mov r5, r2 ; numarray1
	mov r2, $25000 ; FLASH pause time
	mov r6, 0  ; iterator
	mov r7, 4  ; mul opperand

.function:
	cmp r6, r4
	bge .return
	mul r8, r6, r7
	ldr r1, [r5, r8] ; current index
	bl FLASH
	mov r1, $250000
	bl PAUSE
	add r6, #1
	b .function

.return:
	pop {r0, r1, r2, r3, r4, r5, r6, r7, r8}
	pop {lr}
        bx lr
