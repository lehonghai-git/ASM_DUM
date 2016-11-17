; Bai 1-2: Xuat ra man hinh mot so dong 
.model small
.stack 100h
.data
    msg1 db 'Dong 1$'
    msg2 db 13,10,'Dong 2$'
    msg3 db 13,10,'Dong 3$'

.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah,9    
    int 21h
    
    lea dx, msg2
    mov ah,9    
    int 21h
    
    lea dx, msg3
    mov ah,9    
    int 21h

end
