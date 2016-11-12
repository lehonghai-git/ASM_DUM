
; Assembly 03.3: Xuat hai chuoi ky tu, moi chuoi mot dong

.model small
.stack 100h
.data
    tb1 db "Le Hong Hai$"
    tb2 db 13,10,"Studies Information Secuirty$"

.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    ; Doan in ra chuoi tb1
    mov ah, 09h
    lea dx, tb1
    int 21h
    
    ; Doan in ra chuoi tb2
    mov ah, 09h
    lea dx, tb2
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main

; Note:
; - 13,10       : Ky tu xuong hang va ve dau dong

; Note:
; CR = 0Dh(ASCII): Quay ve dau dong
; LF = 0Ah(ASCII): Xuong dong moi
; Bai tren su dung ket hop: xuong dong + quay ve dau dong
; Ta co the chia nho thanh cac doan code nhu sau:

;Xuong dong
;mov ah, 02h
;mov dl, 0Ah
;int 21

;Ve dau dong nhung khong xuong dong
;mov ah, 02h
;mov dl, 0Dh
;int 21h

;Xuong dong + Ve dau dong
;mov ah, 02h
;mov dl, 0Ah
;int 21
;mov dl, 0Dh
;int 21h
