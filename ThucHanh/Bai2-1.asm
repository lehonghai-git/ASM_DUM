; Bai 2-1: Nhap vao ky tu, in ra thong bao Sang, Trua, Chieu tuong ung
; S hoac s => Sang
; T hoac t => Trua
; C hoac c => Chieu
; E hoac e => Thoat
; Cac truong hop con lai thi bao nhap sai

.model small
.stack 100h
.data
    str0 db 'Moi nhap(e = exit): $'
    str1 db 13,10,'Chao buoi Sang',13,10,'$'
    str2 db 13,10,'Chao buoi Trua',13,10,'$'
    str3 db 13,10,'Chao buoi Chieu',13,10,'$'
    str4 db 13,10,'Nhap sai!',13,10,'$'
    str5 db 13,10,'Exit!',13,10,'$'
    
.code
    mov ax, @data
    mov ds, ax
    
    NHAP:
    lea dx, str0
    mov ah,9    
    int 21h
    mov ah, 1
    int 21h
    cmp al, 73h
    je SANG
    cmp al, 53h
    je SANG
    
    cmp al, 74h
    je TRUA
    cmp al, 54h
    je TRUA
    
    cmp al, 63h
    je CHIEU
    cmp al, 43h
    je CHIEU
    
    cmp al, 65h
    je EXIT
    cmp al, 45h
    je EXIT
    
    jmp SAI  
    
    SANG:
    lea dx, str1
    mov ah,9    
    int 21h
    jmp NHAP
    
    TRUA:
    lea dx, str2
    mov ah,9    
    int 21h
    jmp NHAP
    
    CHIEU:
    lea dx, str3
    mov ah,9    
    int 21h
    jmp NHAP
    
    SAI:
    lea dx, str4
    mov ah,9    
    int 21h
    jmp NHAP
    
    EXIT:
    lea dx, str5
    mov ah,9    
    int 21h
    
end
