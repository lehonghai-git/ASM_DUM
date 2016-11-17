    nhap_so proc
        mov bx, 0           ; BX dem so ki cua so, gom dau ('+', '-') va chu so
        jmp dau
        
        no_num:
        mov ah, 2
        mov dx, 8
        int 21h
        mov dx, 0
        int 21h
        mov dx, 8
        int 21h
        
        dau:
        mov ah, 1           ; Dau tien, nhap dau cho so
        mov tmp, 0
        mov cx, 1           ; CX = 1 nghia la mac dinh so nhap vao la so duong
        int 21H
        cmp al, '-'         
        je dautru              
        cmp al, '+'        
        je daucong
        cmp al, 8           ; Neu nhap khoa trang
        je no_num
        cmp al, '0'         
        jl no_num           ; Nhay neu ky tu do dung truoc '0'
        cmp al, '9'
        jg no_num           ; Nhay neu ky tu do dung sau '9'
                            ; thi xoa ki tu do khoi man hinh
        and ax, 000FH       ; Neu ki tu dau la so thi doi tu ma ASCII sang so
        mov tmp, AX         ; va so do la so duong
        mov ah, 1 
        mov bx, 1
        jmp nhaptiep        ; roi tiep tuc nhap cac chu so khac
        
        dautru:
        mov bx, 1
        mov cx, 0           ; CX = 0, so nhap vao la so am
        jmp nhaptiep
        
        daucong:
        mov bx, 1
        
        nhaptiep:           ; Nhap tiep ky tu ke tu ky tu thu 2
        int 21H
        cmp al, 13
        je stop  
        cmp al, 8
        je back
        cmp al, '0'         ; Xu li truong hop ki tu nhap vao, tuong tu nhu nhap ky tu
        jl not_num          ; khong phai so
        cmp AL, '9'
        jg not_num
        inc bx              
        and ax, 000FH       ; ANCII->Num
        push ax
        mov ax, 10
        mul tmp             ; ax=ax*tmp
        mov tmp, ax
        pop ax
        add tmp, ax
        mov ah, 1
        jmp nhaptiep
        
        back:
        dec bx
        mov ah, 2
        mov dx, 0
        int 21h
        mov dx, 8
        int 21h
        push bx
        mov bx, 10          ; Xoa chu so cuoi cung cua tmp
        mov ax, tmp
        xor dx, dx
        div bx
        mov tmp, ax
        pop bx
        mov ah, 1
        cmp bx, 0           ; Neu so ki tu cua so = 0 thi nhap dau cho so
        je dau          
        jmp nhaptiep
        
        not_num:
        mov ah, 2 
        mov dx, 8
        int 21h
        mov dx, 0
        int 21h
        mov dx, 8
        int 21h
        mov ah, 1 
        jmp nhaptiep
        
        stop:
        cmp cx, 0           ; Neu CX = 0, nghia la so nhap vao la so am
        jne thoat           ; thi doi dau SO
        
        daodau:
        neg tmp
        
        thoat:
        ret
    nhap_so endp