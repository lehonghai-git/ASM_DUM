
; Assembly 02: Chuoi nghich dao

.model small
.stack 100h
.data
    str1 db 'Nhap chuoi: $'
    str2 db 13,10,'Chuoi nghich dao: $'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, str1
    int 21h
    
    mov cx,0
input:
    mov ah, 1
    int 21h
    cmp al,13       ; 13 = enter
    je stop       
    push ax         ; Day vao ngan xep
    inc cx          ; cx = cx+1
    jmp input       ; nhay khong dieu kien
        
stop:
    cmp cx,0
    je input
    mov ah,9
    lea dx, str2
    int 21h
    mov ah,2
    
display:
    pop dx          ; Lay ra tu ngan xep
    int 21h
    loop display    ; So lan lap bang gia tri trong thanh ghi cx
    
    ; end  
    mov ah, 4ch
    int 21h
    
    main endp
end main
