.model small
.stack 100h
.data 
    
    msg1 db 'A = ','$'
    msg2 db 13, 10, 'B = ','$'
    msg3 db 13, 10, 'A + B = ','$' 
    tmp dw 0 
    number dw 0

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ;Print the message 1
        mov ah, 09h
        lea dx, msg1
        int 21H
        call nhap_so
        
        ;A = tmp
        ;tmp = number
        mov ax, tmp         
        mov number, ax     
        
        ;Print the message 2
        mov ah, 09h
        lea dx, msg2
        int 21h
        call nhap_so
        
        ;A = number
        ;B = tmp
        
        tong:
        ;Print the message 3
        mov ah, 09h
        lea dx, msg3
        int 21h
         
        mov ax, number      ;ax=number (ax=A)
        add ax, tmp         ;ax=ax+tmp, result storage to ax (A=A+B)
        
        xor cx, cx          ; reset counter
        mov bx, 10          ; decimal, bx = 10
        
        cmp ax, 0           ; So sanh tong A+B voi 0 de kiem tra xem la am hay duong
        jge duong           ; Nhay den nhan "duong" neu tong la duong
        
        ;Tiep tuc neu tong < 0 | (ax < 0)
        mov number, ax      ; 
        mov ah, 2           ; thi in ra man hinh dau '-'
        mov dx, '-'
        int 21h
        mov ax, number
        neg ax              ; Doi dau AX (Lay bu 2)
        
        duong:              ; Dua cac chu so cua tong vao Stack
        xor dx, dx          ; reset dx
        div bx              ; ax=ax/bx (Thuong = al, So du = ah)
        push dx             ; Push dx vao ngan xep
        inc cx              ; counter + 1
        cmp ax, 0           
        jne duong           ; Nhay neu khong bang
        
        display:
        mov ah, 2           
        pop dx              ; Lay ra tu ngan xep
        or dl, 30h          ; Convert
        int 21H
        loop display
        
        mov dx, 13          ; enter de ket thuc
        int 21H
        mov dx, 10
        int 21H
        
        ; Quay lai DOS
        mov ah, 1
        int 21h
        mov ax, 4C00h
        int 21h
    main endp 
    
    ;Thu tuc nhap so
    include Bai_08_Nhap_So.asm
    
    ;Ket thuc chuong trinh    
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

; Thao tac tren cac bit
; 0 xor 0 = 0
; 0 xor 1 = 1
; 1 xor 0 = 1
; 1 xor 1 = 0 

; A	B A OR B
; 0	0	 0
; 0	1	 1
; 1	0	 1
; 1	1	 1

; A	B	A&B
; 0	0	 0
; 0	1	 0
; 1	0	 0
; 1	1	 1