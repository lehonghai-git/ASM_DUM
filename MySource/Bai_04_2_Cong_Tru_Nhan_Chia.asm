
; Assembly 4.2: Cong, tru, nhan, chia

.model small
.stack 100h
.data

.code
main proc

    ; Cong - Tru
    ;mov ax, 5
    ;sub al, 1
    ;int 21h
    
    ; Nhan
    ;mov bx, 10  ; bl = 10
    ;mov ax, 5   ; al = 10
    ;mul bx  ; ax = ax*bl (Mac dinh thi toan hang dich la ax)
            ; Ket qua luu vao thanh ghi bit thap AL
            
    ; Chia    
    mov bl, 10
    mov ax, 23
    div bl  ; ax/bx=thuong luu trong al, so du luu trong ah
     

    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main        
      
      
; So lon hon 8 bit (255) thi se luu sang ca bit cao con khong se luu vao bit thap
      
; Note: Su dung cac lenh:
; ADD   : Cong khong nho
; SUB   : Tru
; MUL   : Nhan (Chi lam viec voi thanh ghi bit thap, vd, AL, BL...)
; DIV   : Chia (Chi lam viec voi thanh ghi bit thap, vd, AL, BL...)
; Voi phep chia 2 so thuc thi thuong luu vao thanh ghi bit thap, so du luu vao thanh ghi bit cao

; Phan biet: mov ah,1 va mov ax,1
; mov ah, 1 la truyen gia tri 1 vao thanh ghi bit cao (hight)
; mov ax, 1 = mov al, 1 la truyen 1 vao thanh ghi bit thap (low)
; Truong hop 1 la goi ham 1 (Ham doi nhap tu ban phim) con truong hop 2 la truyen gia tri de tinh toan
