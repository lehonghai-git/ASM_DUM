
; Assembly 03.2: Xuat chuoi ky tu

.model small
.stack 100h
.data
    tb1 db "Le Hong Hai$"

.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    ; Doan in ra chuoi tb1
    mov ah, 09h
    lea dx, tb1
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main

; Note:
; - mov ah, 09h: Goi ham 9, gia tri 9 luu vao ah, Ham 9 de hien thi chuoi tb1 ra man hinh

