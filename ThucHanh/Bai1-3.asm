; Bai 1-3: Nhap mot ky tu. Xuat ky tu dung truoc va dung sau ky tu do 
.model small
.stack 100h
.data
    msg1 db 'Nhap ky tu: $'
    msg2 db 13,10,'Ky tu truoc: $'
    msg3 db 13,10,'Ky tu sau: $'
    ch db ?
.code
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 9    
    int 21h
    
    ; Nhap ky tu
    mov ah, 1
    int 21h
    mov ch, al  ; Ky tu nhap luu vao al sau do duoc chuyen sang luu vao bien ch

    lea dx, msg2
    mov ah, 9
    int 21h
    
    ; Hien thi ky tu dung truoc   
    mov dl, ch
    sub dl, 1
    mov ah, 2
    int 21h
    
    lea dx, msg3
    mov ah, 9
    int 21h
    
    ; Hien thi ky tu dung sau
    mov dl, ch
    add dl, 1
    mov ah, 2    
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h

end