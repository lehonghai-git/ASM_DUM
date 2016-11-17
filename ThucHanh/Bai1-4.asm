; Bai 1-4: Nhap ky tu thuong, in ra ky tu hoa
.model small
.stack 100h
.data
    msg1 db 'Nhap ky tu thuong: $'
    msg2 db 13,10,'Ky tu in hoa la: $'
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
    sub dl, 20h
    mov ah, 2
    int 21h
    
end
