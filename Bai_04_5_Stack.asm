
; Assembly 4.5: Push va Pop
;

.model small
.stack 100h
.data

.code
main proc
    ; Khoi tao so lan lap
    mov cx,5
    
    mov bx,0    ; Khoi tao bx = 0
lap:
    adc bx,1    ; bx=bx+1
    push bx     ; Sau khi +1 (Cong co nho) vao bx thi cat gi tri bx vao Stack
    loop lap    ; Lap den khi cx = 0
    
    ; Lay ra tu ngan xep
    pop ax  ; Lay gia tri tu dinh ngan xep, sau do luu vao ax
    pop bx  ; Lay gia tri tiep theo (dinh ngan xep -1), sau do luu vao bx
    pop cx  ; Lay gia tri tiep theo (dinh ngan xep -2), sau do luu vao cx
    pop dx  ; Lay gia tri tiep theo (dinh ngan xep -3), sau do luu vao dx
    
     
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main        
      
; Note: So luong thanh ghi trong 8086 la khong nhieu
; Vi vay sinh ra ngan xep, ta coi no nhu la cac thanh ghi ao de luu du lieu
; Doan ngan xep hoat dong theo co che: Vao truoc ra sau
; push bx : Day bx vao stack (Dung cho thanh ghi 16bit)
; pop  ax : Lay ra sau do luu vao ax

; Mo phong ngan xep            

; Luu chuoi "ABCD" vao ngan xep
;
; |Dinh Stack| <= SP (Stack Pointer)
; |__________|
; |    D     |
; |----------|
; |    C     |
; |----------|
; |    B     |
; |----------|
; |    A     |
; |----------|
; |Day Stack |
