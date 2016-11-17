
; Assembly 4.1: Nhap password la mot ky tu cho den khi dung, neu sai bat nhap lai
; Bai tap lam quen voi lenh nhay (jump) va nhan (label)

.model small
.stack 100h
.data
    msg1 db 13,10,'Nhap Password: $'
    msg2 db 13,10,'Dang nhap thanh cong!$'
.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax             

nhap:    
    ; Thong bao yeu cau nhap mat khau
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    ; Nhap mat khau
    mov ah, 01h
    int 21h
    cmp al, "a" ; So sanh gia tri trong thanh ghi al voi ky tu 'a'
    jne nhap    ; Nhay den nhan 'nhap' neu ket qua so sanh khong bang
    
    ; Thong bao dang nhap thanh cong
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    
    main endp
end main