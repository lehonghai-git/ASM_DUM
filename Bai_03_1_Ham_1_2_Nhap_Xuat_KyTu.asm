
; Assembly 03.1: Nhap - Xuat mot ky tu

.model small
.stack 100h
.data

.code
main proc
    ; Khong can khoi tao thanh ghi ds Vi bai nay ta khong khai bao bien, hang, mang... o doan code
    
    ; Nhap mot ky tu tu ban phim
    ;mov ah, 01h
    ;int 21h
    
    ; Hien thi mot ky tu ra man hinh
    mov ah, 02h
    mov dl, "a"
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main

; Note:
; - mov ah, 01h     : Goi ham 1 (Ham doi nhap mot ky tu tu ban phim), Gia tri 1 luu vao thanh ghi ah
; - int 21h         : Sau khi goi ham 1 thi goi ham ngat 21 (Dung man hinh de cho nhap ky tu), Ket qua luu vao thanh ghi al

; - mov ah, 02h     : Goi ham 2 (Ham hien thi mot ky tu ra man hih), Gia tri 2 luu vao thanh ghi ah
; - mov dl, "a"     : Gan gia tri a vao thanh ghi dl
; - int 21h         : Goi ngat 21, luc nay thanh thi al = dl = 'a' va hien thi ra man hinh