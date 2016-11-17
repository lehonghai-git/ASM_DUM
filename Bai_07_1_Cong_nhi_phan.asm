
; Assembly 01: Tong hai so nhi phan

.model small
.data
    tb1 db 'So thu nhat =  $'
    tb2 db 13, 10, 'So thu hai =  $'
    tb3 db 13, 10, 'Tong = $'
    
.stack 100h 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Nhap so thu nhat
    mov ah, 9
    lea dx, tb1
    int 21h
    call readnum
    
    ; Sau khi nhap xong so thu nhat
    push bx     ; Day so thu nhat vao trong stack
    
    ; Nhap so thu hai
    mov ah, 9
    lea dx, tb2
    int 21h
    call readnum
    ; Sau khi nhap xong so thu hai
    mov bx,dx   ; dx = so thu 2
    pop bx      ; bx = so thu 1
    
    ; Tong hai so
    add bx,dx
    
    ; Hien thi tong hai so
    mov ah, 9
    lea dx, tb3
    int 21h
    
    mov ah,2
    mov cx, 16  ; So lan lap = 16 (Vi tinh toan so nhi phan 16 bit)
    
lap:
    mov dx, 8000h
    add dx,bx
    shr dx,15
    add dx,48
    int 21h
    shl bx,1
    loop lap
    jmp kt
    
kt:
    mov AH, 2
    mov DX, 13
    int 21h
    mov DX, 10
    int 21h
    mov AH, 1
    int 21h
    
    
    mov ah,4ch
    int 21h
    
    main endp

; thu tuc readnum
readnum  proc near
    xor bx,bx
    xor cx,cx
    jmp read
        
read:
    mov ah,1
    int 21h
    cmp al,13
    je stop
    add al,0001h
    xor ah,ah
    shl bx,1
    or bx,ax
    inc cx
    jmp read
        
stop:
    cmp cx,0
    je read
    ret

readnum endp

end main