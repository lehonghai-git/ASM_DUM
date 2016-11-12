
; Assembly 4.3: Cong, nhan so nhi phan

.model small
.stack 100h
.data

.code
main proc
    
    ; Nhan nhi phan
    ;mov ax, 15      
    ;and ax, 0011b
       
    ; 15d = 0x1111b                
    ; ax=ax*0011b                
    ; AL: 00000000 00001111                
    ;         0x       0011                
    ;     -----------------
    ;         0x       0011
    
    ; Cong nhi phan
    mov ax, 15      ; 15 o day la so thap phan
    or ax, 0101b
     
    ; 15 = 0000 1111
    ;  5 = 0000 0101
    ;  or  ---------
    ;      0000 1111
    ;
     
     
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    main endp
end main        
      
; Cong nhi phan - OR
; 0+0=0
; 0+1=1
; 1+0=1
; 1+1=1


; Nhan nhi phan - AND
; 0*0=0
; 0*1=0
; 1*0=0
; 1*1=1
      
; Dao (Bu 1) - NOT
; 0 thanh 1
; 1 thanh 0
; VD:   0000 0101
;          Dao
;       --------
;       1111 1010

; Bu 2: Lau bu 1 sau do dem ket qua + 1
; VD:   5 = 0000 0101
;    Bu 1 = 1111 1010
;         + 0000 0001
;    Bu 2 = 1111 1011 = (-5)



; XOR
; 0 XOR 0 = 0
; 0 XOR 1 = 1 
; 1 XOR 0 = 1  
; 1 XOR 1 = 0