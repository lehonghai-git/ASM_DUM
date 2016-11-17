; Bai 1-1: Nhap vao mot ky tu, Xuat ra ky tu do
.model small
.stack 100h
.data
.code
    mov ah,1    ; Goi ham 1: Ham nhap du lieu
    int 21h
    
    mov dl,al   
    mov ah,2    ; Goi ham 2: Ham xuat du lieu
    int 21h

end
; Ham 1 cua ngat 21 luu du lieu nhap vao thanh ghi AL
; Ham 2 cua ngat 21 xuat du lieu trong thanh ghi DL