; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
	push {lr}
	bl stage1a_min
	mov r1, r0
	push {r1}
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl stage1b_max
	pop {r1}

	cmp r0, r1
	bgt .if_gt
	blt .if_lt
	sub r0, r1, r0 ;assumes the only option after lt and gt is eq so subtracts contents
	b .return

.if_lt:
	sub r0, r1, r0
	b .return

.if_gt:
	sub r0, r0, r1
	b .return

.return:
	pop {lr}
        bx lr
