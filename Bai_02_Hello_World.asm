
; Assembly 02: Chuong trinh Hello World!

.model small
.stack 100h
.data
    msg db 'Hello World!$'
.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    ; Doan in ra Hello World!
    mov ah, 09h
    lea dx, msg
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    
    main endp
end main

; Note:
; - .model small    : Khai bao kich thuoc chuong trinh
; - .stack 100h     : Khai bao kich thuoc ngan xep
; - .data           : Khai bao doan du lieu
; - msg             : Ten bien, luu tai doan du lieu
; - db              : Toan tu gia?(pseudo-op) - Dinh nghia so lieu kieu byte
; - 'Hello World!$' : Chuoi gia tri cua bien msg, dau '$' la ky hieu ket thuc chuoi
; - .code           : Khai bao doan code
; - proc            : Toan tu gia, se khong duoc bien dich, truong hop nay proc tao gia mot thu tuc (procedure)
; - endp            : Ket thuc thu tuc
; - end             : Ket thuc chuong trinh