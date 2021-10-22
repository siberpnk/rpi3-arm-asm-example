; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
	cmp r0, r1
	bgt .if_gt
	blt .if_lt_OR_eq
	beq .if_lt_OR_eq

.if_gt:
	mov r0, r1
	mov r1, r2
	cmp r0, r1
	ble .return
	b stage1a_min

.if_lt_OR_eq:
	cmp r0, r2
	ble stage1a_min	

.return:
        bx lr
