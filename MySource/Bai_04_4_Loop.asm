
; Assembly 4.4: Loop
; Bai toan moi lan lap tang gia tri thanh ghi len 1, lap tat ca 5 lan

.model small
.stack 100h
.data

.code
main proc
    ; Khoi tao thanh ghi cx lam bien dem
    mov cx,5   ; Ta se lap 5 lan
    
    ; Gia tri ban dau thanh bx = 0
    mov bx,0
lap:
    adc bx,1    ; Cong co nho thanh bx len 1
    loop lap    ; So lan lap luu trong thanh ghi cx, sau moi lan lap cx giam di 1
     
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main        
      
