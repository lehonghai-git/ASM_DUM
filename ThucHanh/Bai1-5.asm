; Bai 1-5: Nhap ky tu in hoa, in ra ky tu thuong
.model small
.stack 100h
.data
    msg1 db 'Nhap ky tu in hoa: $'
    msg2 db 13,10,'Ky tu thuong la: $'
    ch db ?
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah,9    
    int 21h
    
    ; Nhap ky tu
    mov ah, 1
    int 21h
    mov ch, al 
    
    lea dx, msg2
    mov ah,9    
    int 21h
    
    ; Xuat ky tu hoa
    mov dl, ch
    add dl, 20h
    mov ah, 2
    int 21h
    
end
