; Bai 1-6: Nhap vao hai so nguyen duong x1, x2 (1<=x2<x1<9)
; Xuat rax1-1; x1+2; x1+x2; x1-x2

.model small
.stack 100h
.data
    str1 db 'X1 =  $'
    str2 db 13,10,'X2 = $'
    str3 db 13,10,'X1 - 1 = $'
    str4 db 13,10,'X1 + 2 = $'
    str5 db 13,10,'X1 + X2 = $'
    str6 db 13,10,'X1 - X2 = $'
    x1 db ?
    x2 db ?
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, str1
    mov ah,9    
    int 21h
    
    ; Nhap x1
    mov ah, 1
    int 21h
    mov x1, al
    
    lea dx, str2
    mov ah,9    
    int 21h
    
    ; Nhap x2
    mov ah, 1
    int 21h
    mov x2, al 
    
    lea dx, str3
    mov ah,9    
    int 21h
    mov dl, x1
    sub dl, 1   ; x1-1
    mov ah, 2
    int 21h
    
    sub x1, 48  ; chuyen ky tu sang so trong bang ma ascii
    sub x2, 48
    
    lea dx, str4
    mov ah,9    
    int 21h
    mov dl, x1
    add dl, 2   ; x1+2
    add dl, 48  ; chuyen so thanh ky tu trong bang ma ascii
    mov ah, 2
    int 21h
    
    lea dx, str5
    mov ah,9    
    int 21h
    mov dl, x1
    add dl, x2
    add dl, 48
    mov ah, 2
    int 21h
    
    lea dx, str6
    mov ah,9    
    int 21h
    mov dl, x1
    sub dl, x2
    add dl, 48
    mov ah, 2
    int 21h
    
end
