
; Assembly 03.4: Nhap - Xuat chuoi ky tu

.model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"
    ;input db 200,?,200 dup('$') ; Bien luu chuoi nhap vao
    input db 100 dup('$')
    xuongdong db 13,10,'Ket qua: $'

.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    ; Doan in ra chuoi tb1
    mov ah, 09h
    lea dx, tb1
    int 21h
    
    ; Nhap chuoi va luu vao bien input
    mov ah, 0ah
    lea dx, input
    int 21h
    
    ; Xuong dong
    mov ah, 09h
    lea dx, xuongdong
    int 21h
    
    ; Hien thi chuoi da nhap
    mov ah, 09h
    lea dx, input+2
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main

; Note:
; - mov ah, 0ah     : Goi ham 10 (Ham nhap chuoi)
; - mov ah, 09h     : Goi ham 09 (Ham xuat chuoi)

;Note: Doan hien thi chuoi da nhap
;Neu de: input => Se in ca dia chi 00h va 01h cua input 
;Neu de: input+2 => Se bo qua 00h va 01h cua input