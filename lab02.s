
.data

array: .word 0, 1, 2, 4, 4, 5

.text

    la a0, array
    li a1, 6    # unsigned
    li a2, 4
prog:
#-----------------------------
# Write your code here!
    add t1, zero, zero #index
    add s0, zero, zero #Address / array[s0]
    
loop:
    beq a1, zero, done 
    slli s1, t1, 2 #OFFSET
    add s1, s1, a0 #Address = Offset + base address / Address of array[i] more
    # specifically address[t1]
    lw t2, 0(s1) # t2 = array[t1]
    bne t2, a2, loop2
    add s0, s1, zero 
    #sw t2, 0(s0)
     
loop2:
    addi t1, t1, 1
    addi a1, a1, -1
    j loop
    
             
    
# Do not remove the prog label or write code above it!
#-----------------------------
done:
    addi a7, zero, 10 
    ecall
