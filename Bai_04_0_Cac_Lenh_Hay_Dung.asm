
; Assembly 04: Mot so lenh (ham) thuong dung

.model small
.stack 100h
.data
msg db "Xin chao!$"
.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg
    int 21h
    
    main endp
end main           


; Phan biet AH va AL
; AH va AL nam trong thanh ghi da nang AX
; H = Hight: Bit cao
; L = Low  : Bit thap
; AH thi thuong chua cac ngat goi ham, vd: mov ah, 01h (Goi ham nhap 1 ky tu)
; AL thi thuong chua cac gia tri, vd: mov al, 01h (Chuyen 1 (hexa) vao thanh ghi al); add al, 1 (cong 1 vao thanh ghi al)

; Phan biet cac gia tri
; 10B = Nhi phan (Binary)
; 10D = Thap phan (Decimal)
; 10H = He 16 (Hexa)




; Mot so lenh hay dung
; mov   :   Gan gia tri, dia chi, thanh ghi...
; VD: mov ds, ax; mov ah, 09h;

; lea   :   Tuong tu nhu mov nhung gan bien vao thanh ghi
; VD: lea dx, bien 

; add   :   Cong khong nho
; VD: add al, 1 :   al = al+1

; adc   :   Cong co nho (Thuong dung de dem trong truong hp thanh ghi cx dang dc su dung)

; sub   :   Tru

; cmp   :   So sanh (Thuong dung voi cac lenh nhay)

; Cac lenh nhay
; ja    : Nhay neu lon hon
; jna   : Nhay neu khong lon hon
; jb    : Nhay neu nho hon
; jnb   : Nhay neu khong nho hon
; je    : Nhay neu bang
; jne   : Nhay neu khong bang
; jc    : Nhay neu le
; jmp   : Nhay khong dieu kien
;
; Lenh nhay thuong di kem voi nhan (label)
;
;
;
;
;
;
;
;
;