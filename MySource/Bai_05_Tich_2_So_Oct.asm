
; Assembly 05: Tich hai 2 so Oct, Hien thi dang Hex
; So Oct = He co so 8
.model small
.stack 100h
.data  
    num1 db 'Number 1 = $'
    num2 db 13,10,'Number 2 = $'
    num3 db 13,10,'Ket qua = $'

.code
main proc
    ; Khoi tao thanh ghi ds
    mov ax, @data
    mov ds, ax
    
    ; Hien thi thong bao nhap so thu nhat
    mov ah,09h
    lea dx,num1
    int 21h
    
    ; Nhap so thu nhat
    mov bx,0    ; Khoi tao bx = 0
nhap:
    mov ah,1    ;Goi ham nhap tu ban phim
    int 21h
    cmp al,13   ; So sanh voi ky 13 trong ACII (Ky tu Enter)
    je nhap2     ; Nhay neu nhan phim enter
    sub al,30h
    mov ah,0    ; Reset AH
    push ax     ; Day AL vao Stack
    mov ax,8
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
    jmp nhap
    
    ; Nhap so thu hai
    
nhap2:
    ; Cat so thu nhat vao Stack
    push bx
    
    
    ; Hien thi thong bao nhap so thu hai
    mov ah,09h
    lea dx,num2
    int 21h
    
    ; Nhap so thu nhat
    mov bx,0    ; Khoi tao bx = 0
    
n2:
    mov ah,1    ;Goi ham nhap tu ban phim
    int 21h
    cmp al,13   ; So sanh voi ky 13 trong ACII (Ky tu Enter)
    je tich     ; Nhay neu nhan phim enter
    sub al,30h
    mov ah,0    ; Reset AH
    push ax     ; Day AL vao Stack
    mov ax,8
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
    jmp n2
    
    ; Nhu vay la da co mot so trong stack, mot so trong bx
    ; Tinh tich
    
tich:
    pop ax  ; Lay so thu nhat ra luu vao ax
    mul bx  ; ax = ax*bx, result store to ax
    mov bx,ax   ; Chuyen ket qua ra bx, vi ax con phai dung cho 09h de hien thi ket qua ben duoi
    
    ; Hien thi thong bao num3
    mov ah,09h
    lea dx,num3
    int 21h
   
hienthi:
    mov cx,0
    mov ax,bx
top:
    mov bl,16
    div bl
    push ax
    inc cx
    mov ah,0
    cmp al,0
    je ht1
    jmp top
ht1:
    pop bx
    cmp bh,9
    ja hienchu
    add bh,30h
    jmp ht2
    
hienchu:   
    add bh,55


ht2:
    mov ah,2
    mov dl,bh
    int 21h
    loop ht1
    
     
thoat:    
    ; Ket thuc
    mov ah, 4ch
    int 21h
    main endp
end main

; Note:
; Cong thuc de nhap: bx * 8 + stack = bx

; 13h = enter
;
;
;
;
;
;