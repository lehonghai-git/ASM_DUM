; Assemble 01: Cau truc chung cua mot chuong trinh asm

; Khai bao kich thuoc chuong trinh
.model small

; Khai bao kich thuoc ngan xep (Stack)
.stack 100h

; Khai bao doan du lieu
.data
    ; Const, Variable, Array... duoc khai bao tai day

; Khai bao doan code
.code
main proc
    ; Khoi tao thanh ghi DS (Neu doan .data co khai bao cac du lieu: bien, hang, mang...)
    mov ax, @data
    mov ds, ax


    ; Do something here!


    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main



; Note:
; - Neu doan du lieu (.data) co khai bao cac bien, hang, mang... thi ta moi can khoi tao thanh ghi ds
; - Cau truc chung nay hau nhu chuong trinh nao cung giong nhau