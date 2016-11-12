
; Assembly 06: Xuat so co nhieu chu so
; VD: In o 12346 ra man hinh

.model small
.stack 100h
.data
    count db 0
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cl,10
    mov ax,1234
    
label1:
    mov dx,0
    div cx
    add dl,30h
    push dx
    inc count
    cmp ax,0
    jne label1

label2:
    pop dx
    mov ah,2
    int 21h
    dec count
    cmp count,0
    jne label2
    
    ; end
    mov ah,4ch
    int 21h

    main endp
end main



; Note: De xuat so co nhieu chu so ta thuc hien tach so tu phai sang trai bang lenh div
; va cat vao stack, sau do lai lay tu stack ra