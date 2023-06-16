.model small

.data
        I dw 2521H
              dw 3206H
        R dw 0A26H
              dw 6400H
        V   dw 0,0,0,0

.code
        mov ax,@data
        mov ds,ax

;       LEA SI,V

        mov ax,I
        mul R
        mov V,ax
        mov V+2,dx

        mov ax,I+2
        mul R
        add V+2,ax
        adc V+4,dx
        adc V+6,0

        mov ax,I
        mul R+2
        add V+2,ax
        adc V+4,dx
        adc V+6,0

        mov ax,I+2
        mul R+2
        add V+4,ax
        adc V+6,dx

        mov ax,4C00h
        int 21h
end