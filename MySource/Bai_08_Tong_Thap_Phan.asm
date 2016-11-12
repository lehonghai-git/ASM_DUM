.model small
.stack 100h
.data
    tb1 db 'Nhap so = $'
    tb2 db 'So vua nhap = ',13,10,'$'

.code
    ; Ham main
    main proc       
        mov ax, @data
        mov ds, ax
        
        ;mov ah,9
        ;lea dx, tb1
        ;int 21h
        ; Goi ham nhap so
        call nhap
        
    
        ; Goi ham xuat so
    
    
    
    
        ; Ket thuc ham main
        mov ah, 4ch
        int 21h
    main endp
    
    ; Ham nhap so
    nhap proc                  
        ; Lan luot day cac gia tri trong thanh ghi vao ngan xep
        push bx
        push cx
        push dx 

    batdau:
        mov ah, 2
        xor bx, bx
        xor cx, cx
        mov ah, 1
        int 21h
        cmp al,'-'
        je dauTru
        cmp al, '+'
        je dauCong
        jmp tiepTuc
        
    dauTru:
        mov cx, 1  
        
    dauCong:
        int 21h
        
    tiepTuc:
        cmp al, '0'
        jnge notNumber  ; jump if not great than or equal
        cmp al, '9'
        jnle notNumber
        
        and ax, 000fh   ; Doi ky tu thanh so
        push ax         ; Day vao ngan xep
        mov ax, 10
        
        mul bx          ; ax=tong*10
        mov bx, ax
        pop ax
        add bx, ax      ; tong = tong*10+so
        mov ah, 1
        int 21h
        cmp al, 13      ; 13 = enter
        jne tiepTuc     ; jump if not equal
        
        mov ax, bx
        or cx, cx
        je layra           
        neg ax          ; neu la so am thi doi ax ra so am
        
        
    layra:
        pop dx
        pop cx
        pop bx
        ret
        
    notNumber:
        mov ah, 2
        mov dl,0dh
        int 21h
        mov dl, 0ah
        int 21h
        jmp batdau
                        
    
    ; Ket thuc ham nhap so
    nhap endp

    
    ; Ham xuat so  
    xuat proc
    
    ; Ket thuc ham xuat so
    xuat endp
    
    
end main      
; Nhap so he 10: VD Nhap 2016
; step 1: Nhap 2
; AX=10*0+2=2
; step 2: Nhap 0
; AX=10*AX+0=20
; step 3: Nhap 1
; AX=10*AX+1=201
; step 4: Nhap 6
; AX=10*AX+6=2016

; Xuat so he 10: VD Xuat 2016
; 2016/10=201 du 6
; 201/10=20 du 1
; 20/10=2 du 0
; 2/10=0 du 2
