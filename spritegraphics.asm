my_txt_set_window_ptr2            equ &0103
my_txt_clear_window_ptr2          equ my_txt_set_window_ptr2+3
txt_set_paper_ptr2                equ my_txt_clear_window_ptr2+3
txt_set_pen_ptr2                  equ txt_set_paper_ptr2+3
scr_next_line_hl_ptr2             equ txt_set_pen_ptr2+3
locatetextf_ptr2                  equ scr_next_line_hl_ptr2+3
writelineplainf_ptr2              equ locatetextf_ptr2+3
drawbox_ptr2                      equ writelineplainf_ptr2+3
scr_set_ink_ptr2                  equ drawbox_ptr2+3

org &4000 ; WHEN ASIC IS DISABLED

; JUMP TABLE FOR FUNCTIONS - STARTING AT &4000
jp drawqbertlogo
jp drawlevellogo
jp drawlevelnumberempty
jp printlargenumber
jp drawlevelroundtext
jp printlargeletter
jp printlargeword
jp drawlivestext
jp printlargestring
jp printplayertext
jp print1text
jp print2text
jp printplayer2text

; _ptr2 HAS TO BE ADDED TO LABELS TO KEEP THEM DIFFERENT FROM JUMP TABLE POINTERS IN MAIN PROGRAM
; OTHERWISE THERE IS A CLASH WHEN COMPILING FOR DISK AND TAPE

defw image_qbert_swearword1_ptr2
defw image_qbert_swearword2_ptr2
defw image_qbert_swearword3_ptr2
defw image_qbert_swearword4_ptr2
defw image_qbert_swearword5_ptr2
defw image_qbert_swearword6_ptr2
defw image_rub_ptr2
defw image_end_ptr2
defw image_copyright_ptr2
defw congratulationsposition_ptr2

txt_2:  defb "YOU ARE SECOND ONLY TO ONE",255
txt_3:  defb " YOU MUST KNOW SOMETHING!",255
txt_4:  defb "YOU MAKE IT LOOK SO EASY!",255
txt_5:  defb "QUITE IMPRESSIVE ACTUALLY",255
txt_6:  defb "AN OUTSTANDING ACHIEVEMENT",255
txt_7:  defb "AN EXPERT WITH A JOYSTICK",255
txt_8:  defb "    NOT SHABBY AT ALL",255
txt_9:  defb "  A POTENTIAL CHAMPION",255
txt_10: defb "YOU MADE THE TOP TEN CLUB!",255
txt_11: defb " JUST MISSED THE TOP TEN!",255
txt_12: defb "YOU COULD HAVE DONE WORSE!",255
txt_13: defb " ALMOST OUT OF THE TEENS!",255
txt_14: defb " LOOKING GOOD OUT THERE!",255
txt_15: defb "A TRULY HONORABLE POSITION",255
txt_16: defb " NOW TRY AND GET SERIOUS!",255
txt_17: defb "IT'S A LONG WAY TO THE TOP",255
txt_18: defb " PRACTICE MAKES PERFECT!",255
txt_19: defb " NOTHING TO BRAG ABOUT!",255
txt_20: defb "ALMOST GOT INTO THE TEENS!",255
txt_21: defb " ONLY 20 SCORES TO BEAT!",255
txt_22: defb " NOT BAD FOR A BEGINNER!",255
txt_23: defb "THE BOTTOM OF THE BARREL!",255

congratulationsposition_ptr2:
  defw 0,0
  defw txt_2
  defw txt_3
  defw txt_4
  defw txt_5
  defw txt_6
  defw txt_7
  defw txt_8
  defw txt_9
  defw txt_10
  defw txt_11
  defw txt_12
  defw txt_13
  defw txt_14
  defw txt_15
  defw txt_16
  defw txt_17
  defw txt_18
  defw txt_19
  defw txt_20
  defw txt_21
  defw txt_22
  defw txt_23


; SWEAR WORD STORED HERE UNDER ASIC TO MAKE ROOM IN MAIN GAME CODE FOR MORE CRITICAL SPRITES
; THIS ONE DOES NOT NEED TO BE DISPLAYED FAST OR OFTEN

image_qbert_swearword1_ptr2:
  defb 0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1
  defb 0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1
  defb 0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1
  defb 0,0,0,1,1,1,1,1,1,1,1,1,1,7,7,1
  defb 0,0,1,1,1,1,1,1,1,1,1,1,1,7,7,1
  defb 0,1,1,1,1,7,7,7,7,7,1,1,1,7,7,1
  defb 1,1,1,1,7,7,1,1,1,1,1,1,1,7,7,1
  defb 1,1,1,7,7,1,1,7,7,7,7,1,1,7,7,1
  defb 1,1,1,7,1,1,7,1,1,1,7,7,1,7,1,1
  defb 1,1,1,7,1,7,1,1,7,1,1,7,1,7,1,1
  defb 1,1,1,7,1,7,7,1,7,7,1,7,1,7,1,7
  defb 1,1,1,7,1,1,7,7,7,1,1,7,1,7,1,1
  defb 1,1,1,7,7,1,1,1,1,1,7,7,1,7,1,1
  defb 1,1,1,1,7,7,7,7,7,7,1,1,1,1,1,1
  defb 0,1,1,1,1,1,1,1,1,1,1,1,7,7,1,1
  defb 0,0,1,1,1,1,1,1,1,1,1,1,7,7,1,1
image_qbert_swearword2_ptr2:
  defb 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1
  defb 0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_qbert_swearword3_ptr2:
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 1,1,1,1,1,1,1,1,1,1,1,7,7,7,7,1
  defb 1,1,7,7,1,1,1,1,1,1,7,7,7,1,7,7
  defb 1,1,7,7,1,1,7,1,1,7,7,1,1,1,7,7
  defb 7,1,7,7,1,7,7,1,1,1,7,1,1,1,7,7
  defb 7,7,7,7,7,7,7,7,1,1,1,1,1,7,7,1
  defb 1,7,7,7,7,7,7,7,7,1,1,7,7,7,7,1
  defb 1,7,7,1,1,7,1,1,1,1,7,7,7,1,1,1
  defb 7,7,7,7,7,7,7,7,1,1,7,7,1,1,1,1
  defb 1,7,7,7,7,7,7,7,7,1,7,7,1,1,1,1
  defb 7,7,1,1,7,1,1,7,1,1,7,7,1,1,1,1
  defb 7,1,1,1,7,1,1,1,1,1,1,1,1,1,1,1
  defb 7,1,1,7,7,1,1,1,1,1,7,7,1,1,1,1
  defb 1,1,1,7,7,1,1,1,1,1,7,7,1,1,1,1
image_qbert_swearword4_ptr2:
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
; END SWEARWORD 3
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_qbert_swearword5_ptr2:
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
; END SWEARWORD 4
  defb 1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0
  defb 1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0
  defb 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
  defb 1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0
  defb 1,1,1,7,7,7,1,1,1,1,7,7,1,1,1,0
  defb 1,7,7,7,7,7,7,1,1,1,7,7,1,1,1,1
  defb 7,7,1,1,1,1,7,7,1,1,7,7,1,1,1,1
  defb 7,1,1,7,7,1,1,7,1,7,7,7,1,1,1,1
  defb 7,1,7,1,1,7,1,7,1,7,7,1,1,1,1,1
  defb 7,1,7,7,1,7,1,7,1,7,7,1,1,1,1,1
  defb 7,1,1,1,1,7,1,7,1,7,1,1,1,1,1,1
  defb 1,7,7,7,7,1,1,7,1,7,1,1,1,1,1,1
  defb 1,1,1,1,1,1,7,1,1,1,1,1,1,1,1,0
  defb 7,7,7,7,7,7,7,1,7,7,1,1,1,1,0,0
  defb 1,1,7,7,7,1,1,1,7,7,1,1,1,0,0,0
image_qbert_swearword6_ptr2:
  defb 1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
  defb 1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
  defb 1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0
  defb 1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

image_rub_ptr2:
  defb 0,0,0,0,10,10,10,10,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,10,0,0,0,10,0,0,0,0,0,0,0 
  defb 0,0,0,0,10,10,10,10,10,0,0,0,0,0,0,0 
  defb 0,0,0,0,10,0,0,10,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,10,0,0,0,10,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,10,0,0,0,10,0,0,0,0,0,0 
  defb 0,0,0,0,0,10,0,0,0,10,0,0,0,0,0,0 
  defb 0,0,0,0,0,10,0,0,0,10,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,10,10,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,10,10,10,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,0,0,0,10,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,10,10,10,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,0,0,0,10,0,0,0,0,0 
  defb 0,0,0,0,0,0,10,10,10,10,0,0,0,0,0,0   
image_end_ptr2:
  defb 0,0,0,0,11,11,11,11,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,11,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,11,11,11,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,11,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,11,11,11,11,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,11,0,0,11,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,11,11,0,11,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,11,0,11,11,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,11,0,0,11,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
  defb 0,0,0,0,0,0,11,11,11,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,11,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,11,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,11,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,0,0,0,0,0,0

image_copyright_ptr2:
  defb 0,0,3,3,3,3,0,0,0,0,0,0,0,0,0,0
  defb 0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0
  defb 3,0,0,3,3,0,0,3,0,0,0,0,0,0,0,0
  defb 3,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0
  defb 3,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0
  defb 3,0,0,3,3,0,0,3,0,0,0,0,0,0,0,0
  defb 0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0
  defb 0,0,3,3,3,3,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0


print2text:
  ld hl,_2text
  ld de,&8000+61
  ld bc,3
  ldir
  ld de,&8000+&0800+61
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+61
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+61
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+61
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+61
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+&0800+61
  ld bc,3
  ldir
ret
print1text:
  ld hl,_1text
  ld de,&8000+17
  ld bc,3
  ldir
  ld de,&8000+&0800+17
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+17
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+17
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+17
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+17
  ld bc,3
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+&0800+17
  ld bc,3
  ldir
ret


_1text:
;        DB      #FC, #FC, #A8
        DB      #FC, #D4, #A8
        DB      #E8, #D4, #A8
        DB      #FC, #D4, #A8
        DB      #FC, #D4, #A8
        DB      #FC, #D4, #A8
        DB      #E8, #C0, #A8
        DB      #FC, #FC, #A8
; END _1text
_2text:
        DB      #E8, #C0, #A8
        DB      #E8, #E8, #A8
        DB      #FC, #E8, #A8
        DB      #E8, #C0, #A8
        DB      #E8, #FC, #A8
        DB      #E8, #C0, #A8
        DB      #FC, #FC, #A8

livestext:
        DB      #88, #77, #44, #55, #EE, #FF, #00,0
        DB      #88, #22, #44, #55, #00, #88, #22,0
        DB      #88, #22, #44, #55, #CC, #FF, #00,0
        DB      #88, #22, #22, #99, #00, #11, #22,0
        DB      #FF, #77, #11, #11, #EE, #FF, #00,0

levelroundtext:
        DB      #88, #77, #AA, #22, #FF, #44, #00, #00
        DB      #88, #44, #22, #22, #88, #44, #11, #00
        DB      #88, #77, #22, #22, #EE, #44, #00, #00
        DB      #88, #44, #11, #44, #88, #44, #11, #00
        DB      #FF, #77, #88, #88, #FF, #77, #88, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #0F, #01, #0C, #09, #04, #05, #0C, #00
        DB      #08, #0A, #02, #09, #06, #05, #02, #04
        DB      #0F, #02, #02, #09, #05, #05, #02, #00
        DB      #09, #02, #02, #09, #04, #0D, #02, #04
        DB      #08, #09, #0C, #06, #04, #05, #0C, #00
 
qbertlogo:
        DB      #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #03, #0E, #08, %00001000;#0F
        DB      #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #08, #00, #08, #0D, %00001000
        DB      #00, #07, #0E, #00, #00, #00, #00, #00, #06, #00, #00, #00, #00, #00, #00, #00, #00, #00, #03, #08, #00, #08, #0A, %00001000
        DB      #03, #0F, #0F, #0C, #00, #00, #00, #01, #0F, #00, #00, #00, #00, #00, #00, #00, #00, #00, #0F, #0E, #00, #08, #08, %00001000
        DB      #07, #0C, #03, #0E, #00, #01, #08, #01, #0F, #00, #00, #00, #00, #00, #00, #00, #00, #01, #0F, #0E, #00, #00, #00, #00
        DB      #0F, #08, #01, #0F, #01, #0B, #0C, #00, #0F, #00, #00, #00, #0F, #0C, #00, #03, #00, #00, #07, #08, #00, #00, #00, #00
        DB      #0F, #00, #00, #0F, #03, #09, #09, #08, #0F, #07, #08, #03, #0C, #0F, #00, #0F, #07, #00, #07, #08, #00, #00, #00, #00
        DB      #0F, #00, #00, #0F, #01, #0D, #03, #08, #0F, #0F, #0C, #07, #08, #07, #09, #0F, #0F, #08, #07, #08, #00, #00, #00, #00
        DB      #0F, #00, #00, #0F, #00, #07, #0E, #00, #0F, #03, #0E, #07, #0F, #0F, #08, #0F, #0F, #08, #07, #08, #00, #00, #00, #00
        DB      #0F, #09, #09, #0F, #00, #01, #0C, #00, #0F, #01, #0E, #07, #08, #00, #00, #0F, #07, #00, #07, #08, #00, #00, #00, #00
        DB      #07, #0C, #0F, #0E, #01, #0F, #0F, #00, #0F, #01, #0E, #07, #0C, #03, #08, #0F, #00, #00, #07, #0E, #00, #00, #00, #00
        DB      #03, #0F, #0F, #0C, #01, #09, #0B, #09, #0F, #03, #0C, #03, #0F, #0F, #00, #0F, #00, #00, #03, #0C, #00, #00, #00, #00
        DB      #00, #07, #0F, #00, #00, #03, #09, #09, #0B, #0F, #08, #00, #0F, #0C, #01, #0F, #08, #00, #01, #08, #00, #00, #00, #00
        DB      #00, #00, #07, #08, #00, #03, #08, #00, #01, #0E, #00, #00, #00, #00, #01, #0F, #0C, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #03, #0F, #00, #01, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #01, #0E, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00

;192x48
levellogo:
        DB      #00, #00, #00, #10, #F0, #F0, #00, #00
        DB      #00, #00, #00, #10, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #00, #00, #10, #00, #00
        DB      #00, #00, #80, #00, #00, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #80, #00, #00, #00
        DB      #80, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #70, #F0, #F0, #00, #00
        DB      #00, #00, #00, #70, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #00, #00, #70, #00, #00
        DB      #00, #00, #E0, #00, #00, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #E0, #00, #00, #00
        DB      #E0, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #10, #F0, #F0, #F0, #00, #00
        DB      #00, #00, #10, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #00, #10, #F0, #00, #00
        DB      #00, #00, #F0, #80, #00, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #80, #00, #00
        DB      #F0, #80, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #70, #F0, #F0, #F0, #00, #00
        DB      #00, #00, #70, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #00, #70, #F0, #00, #00
        DB      #00, #00, #F0, #E0, #00, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #E0, #00, #00
        DB      #F0, #E0, #00, #00, #00, #00, #00, #00
        DB      #00, #10, #F0, #F0, #F0, #F0, #00, #00
        DB      #00, #10, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #10, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #80, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #F0, #80, #00
        DB      #F0, #F0, #80, #00, #00, #00, #00, #00
        DB      #00, #70, #F0, #F0, #F0, #F0, #00, #00
        DB      #00, #70, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #70, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #E0, #00, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #F0, #E0, #00
        DB      #F0, #F0, #E0, #00, #00, #00, #00, #00
        DB      #10, #F0, #F0, #F0, #F0, #F0, #00, #00
        DB      #10, #F0, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #10, #F0, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #F0, #80, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #F0, #F0, #80
        DB      #F0, #F0, #F0, #80, #00, #00, #00, #00
        DB      #70, #F0, #F0, #F0, #F0, #F0, #00, #00
        DB      #70, #F0, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #70, #F0, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #F0, #E0, #F0, #F0
        DB      #F0, #F0, #F0, #F0, #F0, #F0, #F0, #E0
        DB      #F0, #F0, #F0, #E0, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #80, #00, #00, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #E0, #00, #00, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #80, #00, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #E0, #00, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #80, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #E0, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #80, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #E0, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #00, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F0, #F0, #00, #00
        DB      #00, #00, #F0, #F0, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #00, #00
        DB      #F0, #F0, #0F, #0F, #00, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #F8, #F0, #00, #00
        DB      #00, #00, #F0, #E1, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #80, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #80, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #FE, #F0, #00, #00
        DB      #00, #00, #F0, #87, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #E0, #00, #00, #00
        DB      #F0, #F0, #0F, #0F, #E0, #00, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #FF, #F8, #00, #00
        DB      #00, #00, #E1, #0F, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #80, #00, #00
        DB      #F0, #F0, #0F, #0F, #F0, #80, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #FF, #FF, #FF, #FE, #00, #00
        DB      #00, #00, #87, #0F, #0F, #0F, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #E0, #00, #00
        DB      #F0, #F0, #0F, #0F, #F0, #E0, #00, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #77, #FF, #FF, #FF, #88, #00
        DB      #00, #01, #0F, #0F, #0F, #0E, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #F0, #80, #00
        DB      #F0, #F0, #0F, #0F, #F0, #F0, #80, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #11, #FF, #FF, #FF, #EE, #00
        DB      #00, #07, #0F, #0F, #0F, #08, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #F0, #E0, #00
        DB      #F0, #F0, #0F, #0F, #F0, #F0, #E0, #00
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #77, #FF, #FF, #FF, #88
        DB      #01, #0F, #0F, #0F, #0E, #00, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #F0, #F0, #80
        DB      #F0, #F0, #0F, #0F, #F0, #F0, #F0, #80
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #FF, #FF, #F0, #F0, #F0, #F0, #F0, #F0
        DB      #F0, #F0, #00, #11, #FF, #FF, #FF, #EE
        DB      #07, #0F, #0F, #0F, #08, #00, #F0, #F0
        DB      #0F, #0F, #F0, #F0, #F0, #F0, #F0, #E0
        DB      #F0, #F0, #0F, #0F, #F0, #F0, #F0, #E0
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #F0
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #F0, #00, #00, #77, #FF, #FF, #FF
        DB      #0F, #0F, #0F, #0E, #00, #00, #70, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #70, #F0, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #E0
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #E0, #00, #00, #11, #FF, #FF, #FF
        DB      #0F, #0F, #0F, #08, #00, #00, #70, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #70, #F0, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #C0
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #C0, #00, #00, #00, #77, #FF, #FF
        DB      #0F, #0F, #0E, #00, #00, #00, #30, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #30, #F0, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #80
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #80, #00, #00, #00, #11, #FF, #FF
        DB      #0F, #0F, #08, #00, #00, #00, #10, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #10, #F0, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #F0, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #F0, #00, #00, #00, #00, #00, #77, #FF
        DB      #0F, #0E, #00, #00, #00, #00, #00, #F0
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #00, #F0, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #E0, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #E0, #00, #00, #00, #00, #00, #11, #FF
        DB      #0F, #08, #00, #00, #00, #00, #00, #70
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #00, #70, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #C0, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #C0, #00, #00, #00, #00, #00, #00, #77
        DB      #0E, #00, #00, #00, #00, #00, #00, #30
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #00, #30, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #80, #00
        DB      #FF, #FF, #FF, #FF, #FF, #FF, #FF, #FF
        DB      #80, #00, #00, #00, #00, #00, #00, #11
        DB      #08, #00, #00, #00, #00, #00, #00, #10
        DB      #0F, #0F, #0F, #0F, #0F, #0F, #0F, #0F
        DB      #00, #10, #0F, #0F, #0F, #0F, #0F, #0F
		
; TOP HALF CIRCLE, FLIPPED FOR BOTTOM HALF
levelnumberempty:
        DB      #00, #00, #00, #70, #E0, #00, #00, #00
        DB      #00, #00, #30, #F0, #F0, #C0, #00, #00
        DB      #00, #00, #F0, #F0, #F0, #F0, #00, #00
        DB      #00, #10, #F0, #80, #10, #F0, #80, #00
        DB      #00, #30, #C0, #00, #00, #30, #C0, #00
        DB      #00, #70, #80, #00, #00, #10, #E0, #00
        DB      #00, #E0, #00, #00, #00, #00, #70, #00
        DB      #10, #C0, #00, #00, #00, #00, #30, #80
        DB      #30, #C0, #00, #00, #00, #00, #30, #C0
        DB      #30, #80, #00, #00, #00, #00, #10, #C0
        DB      #70, #00, #00, #00, #00, #00, #00, #E0
        DB      #70, #00, #00, #00, #00, #00, #00, #E0
        DB      #70, #00, #00, #00, #00, #00, #00, #E0
        DB      #E0, #00, #00, #00, #00, #00, #00, #70
        DB      #E0, #00, #00, #00, #00, #00, #00, #70
        DB      #E0, #00, #00, #00, #00, #00, #00, #70
		
; 31x8 pixels mode 1
; 16x8 bytes
playertext:
        DB      #03, #02, #01, #00, #00, #00, #02, #00,#02, #00, #02, #03, #03, #01, #03, #00
        DB      #82, #41, #41, #00, #00, #41, #C3, #00,#C3, #41, #82, #82, #00, #41, #00, #82
        DB      #0A, #05, #05, #00, #00, #0F, #05, #0A,#05, #0F, #00, #0A, #00, #05, #00, #0A
        DB      #CF, #8A, #45, #00, #00, #8A, #00, #8A,#00, #8A, #00, #CF, #8A, #45, #CF, #00
        DB      #22, #00, #11, #00, #00, #F3, #F3, #22,#00, #22, #00, #22, #00, #11, #11, #00
        DB      #A2, #00, #51, #00, #00, #AA, #00, #A2,#00, #A2, #00, #A2, #00, #51, #00, #A2
        DB      #AA, #00, #55, #FF, #AA, #AA, #00, #AA,#00, #AA, #00, #FF, #FF, #55, #00, #AA
		;DB      #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00
  
;txt_player: defb "PLAYER",255
printplayertext:
  ld de,&8000
  ld hl,playertext
  ld bc,16
  ldir
  ld de,&8000+&0800
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+&0800
  ld bc,16
  ldir
ret

printplayer2text:
  ld de,&8000+64-20
  ld hl,playertext
  ld bc,16
  ldir
  ld de,&8000+&0800+64-20
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+64-20
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+64-20
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+64-20
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+64-20
  ld bc,16
  ldir
  ld de,&8000+&0800+&0800+&0800+&0800+&0800+&0800+64-20
  ld bc,16
  ldir
ret
		
; INPUT
; DE = SCREEN POS
drawqbertlogo:
  ld hl,qbertlogo
  ld b,16 ; 16 PIXELS HIGH
  drawpixelrowloop:
    push bc
	
	push de
	ld bc,24
	ldir
	pop de
	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz drawpixelrowloop
ret

; INPUT
; DE = SCREEN POS
drawlevellogo:
  ld hl,levellogo
  ld b,48 ; 48 PIXELS HIGH
  drawpixelrowloop2aaaaa:
    push bc
	
	push de
	ld bc,48 ;0 ; 192 PIXELS MODE 1
	ldir
	pop de
	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz drawpixelrowloop2aaaaa
ret

; INPUT
; DE = SCREEN POS
drawlevelnumberempty:
  ld hl,levelnumberempty
  ld b,16;24 ; 32 PIXELS HIGH
  drawpixelrowloop2aaaaaa:
    push bc
	
	push de
	ld bc,8;0 ; 32 PIXELS MODE 1
	ldir
	pop de
	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz drawpixelrowloop2aaaaaa
  
  ; MOVE BACK TO START OF LINE AND WORK UP IMAGE TO FLIP IT VERTICALLY
  ; WE ONLY HAVE TO STORE HALF OF CIRCLE IMAGE
  ld bc,8
  sbc hl,bc
  
  ld b,16;24 ; 32 PIXELS HIGH
  drawpixelrowloopflipped:
    push bc
	
	push de
	ld bc,8;0 ; 32 PIXELS MODE 1
	ldir
	; MOVE BACK A LINE
	ld bc,16
	sbc hl,bc
	pop de
	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz drawpixelrowloopflipped
  
ret

; INPUT
; DE = SCREEN POS
drawlevelroundtext:
  ld hl,levelroundtext
  ld b,13 ; 16 PIXELS HIGH
  jr drawpixelrowloop2aaaa
drawlivestext:
  ld hl,livestext
  ld b,5 ; 5 PIXELS HIGH
  drawpixelrowloop2aaaa:
    push bc
	
	push de
	ld bc,8
	ldir
	pop de
	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz drawpixelrowloop2aaaa
ret

; INPUT
; HL = THREE LETTER STRING
; DE = SCREEN POS
printlargeword:
  ld a,(hl)
  push hl
  push de
  call printlargeletter
  pop de
  pop hl
  
  ex de,hl
  ld bc,4
  add hl,bc
  ex de,hl
  
  inc hl
  ld a,(hl)
  
  push hl
  push de
  call printlargeletter
  pop de
  pop hl
  
  ex de,hl
  ld bc,4
  add hl,bc
  ex de,hl
  
  inc hl
  ld a,(hl)
  jp printlargeletter
  
; INPUT
; HL = STRING ENDING IN 255
; DE = SCREEN POS
printlargestring:
  printlargestringloop:
    ld a,(hl)
	cp 255
	ret z
    cp " "
	jr z,skipspace
	
    ; PRINT LETTER ON SCREEN
    push hl
    push de
    call printlargeletter
    pop de
    pop hl
	
    skipspace:
    ; MOVE PIXELS TO RIGHT
    ex de,hl
    ld bc,4
    add hl,bc
    ex de,hl
  
    ; MOVE TO NEXT LETTER
    inc hl
  jr printlargestringloop

; INPUT
; A = LETTER ID
; DE = SCREEN POS
printlargeletter:
  sub 65 ; CONVERT FROM ASCII TO ID
  add 13
  ;sub 3
  jr printlargeletter2
  ;add 12-3
printlargenumber:
  sub 49 ; CONVERT FROM ASCII TO ID
printlargeletter2:
  ;ld a,30-2
  ; DETECT FROM WHICH ROW OF LETTERS WE WANT TO PRINT
  cp 26
  jr c,skipdolargeletters3
  ld hl,largeletters+832+832
  sub 26
  jr doprintlargeletter
  skipdolargeletters3:
  cp 13
  jr c,skipdolargeletters2
  ld hl,largeletters+832
  sub 13
  jr doprintlargeletter
  skipdolargeletters2:
  ld hl,largeletters

  doprintlargeletter:
  ld b,0
  ld c,a
  add hl,bc
  add hl,bc
  add hl,bc
  add hl,bc
  
  ld b,16
  printlargeletterloop:
    push bc
    ldi
    ldi
    ldi
    ldi
    ld bc,48
    add hl,bc
	dec de
	dec de
	dec de
	dec de	
	ex de,hl
	call scr_next_line_hl_ptr2
	ex de,hl
	pop bc
  djnz printlargeletterloop
ret

largeletters:
;
;Généré par ConvImgCpc Version 0.16
;
; 'C:\users\chris\Desktop\qbertletterslargecompacted2aligned.asm'
; Mode 1
; 80x200
; Linear
;
        DB      #00, #03, #4C, #00, #01, #0F, #2E, #00
        DB      #00, #0F, #1F, #00, #03, #4D, #2E, #00
        DB      #07, #0F, #1F, #00, #01, #0F, #0F, #88
        DB      #07, #0F, #0F, #4C, #00, #0F, #2E, #00
        DB      #01, #0F, #4C, #00, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #07, #4C, #00, #03, #0F, #1F, #00
        DB      #03, #0F, #0F, #88, #03, #4D, #2E, #00
        DB      #07, #0F, #1F, #00, #03, #0F, #0F, #4C
        DB      #07, #0F, #0F, #4C, #01, #0F, #1F, #00
        DB      #07, #0F, #1F, #00, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #0F, #4C, #00, #07, #7F, #0F, #88
        DB      #07, #7F, #8F, #4C, #03, #4D, #2E, #00
        DB      #07, #FF, #FF, #00, #07, #7F, #CF, #4C
        DB      #33, #FF, #8F, #88, #03, #7F, #8F, #88
        DB      #07, #FF, #1F, #00, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #47, #4C, #00, #1F, #88, #0F, #88
        DB      #07, #88, #03, #4C, #03, #4D, #2E, #00
        DB      #1F, #00, #00, #00, #07, #88, #11, #CC
        DB      #00, #00, #1F, #00, #03, #4C, #07, #88
        DB      #1F, #00, #07, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #1F, #01, #1F, #00
        DB      #33, #88, #07, #4C, #07, #89, #2E, #00
        DB      #1F, #00, #00, #00, #07, #88, #00, #00
        DB      #00, #00, #1F, #00, #03, #2E, #0F, #88
        DB      #1F, #00, #07, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #77, #03, #2E, #00
        DB      #00, #07, #1F, #88, #07, #89, #2E, #00
        DB      #0F, #0F, #2E, #00, #07, #8F, #1F, #00
        DB      #00, #01, #2E, #00, #01, #0F, #1F, #00
        DB      #1F, #00, #07, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #00, #07, #4C, #00
        DB      #00, #07, #2E, #00, #07, #0F, #0F, #4C
        DB      #0F, #0F, #1F, #00, #07, #0F, #0F, #88
        DB      #00, #03, #4C, #00, #00, #0F, #2E, #00
        DB      #0F, #88, #0F, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #00, #0F, #88, #00
        DB      #00, #33, #0F, #88, #07, #0F, #0F, #4C
        DB      #77, #FF, #0F, #88, #07, #7F, #8F, #4C
        DB      #00, #03, #4C, #00, #03, #0F, #0F, #88
        DB      #07, #0F, #0F, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #03, #0F, #0E, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #01, #1F, #00, #00
        DB      #00, #00, #07, #4C, #33, #EF, #3F, #CC
        DB      #00, #00, #07, #88, #07, #88, #03, #4C
        DB      #00, #07, #88, #00, #07, #7F, #8F, #4C
        DB      #03, #0F, #8F, #88, #00, #00, #00, #00
        DB      #00, #1F, #00, #00, #03, #0F, #1F, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #03, #2E, #00, #00
        DB      #07, #88, #03, #4C, #00, #01, #2E, #00
        DB      #1F, #00, #07, #88, #07, #88, #03, #4C
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #11, #FF, #8F, #88, #00, #00, #00, #00
        DB      #00, #77, #00, #00, #11, #FF, #FF, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #07, #4C, #00, #00
        DB      #07, #88, #03, #4C, #00, #01, #2E, #00
        DB      #0F, #88, #0F, #88, #07, #88, #03, #4C
        DB      #00, #1F, #00, #00, #07, #88, #03, #4C
        DB      #00, #00, #07, #88, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #0F, #88, #00, #00
        DB      #03, #4C, #0F, #4C, #00, #01, #2E, #00
        DB      #07, #4D, #0F, #88, #03, #4C, #07, #88
        DB      #00, #1F, #00, #00, #07, #4C, #07, #4C
        DB      #1F, #00, #0F, #88, #00, #1F, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #0F, #0F, #0F, #88
        DB      #03, #0F, #0F, #88, #00, #01, #2E, #00
        DB      #03, #0F, #1F, #00, #03, #0F, #0F, #88
        DB      #00, #1F, #00, #00, #03, #0F, #0F, #88
        DB      #0F, #0F, #1F, #00, #00, #1F, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #03, #4C, #00, #0F, #0F, #0F, #88
        DB      #11, #0F, #3F, #00, #00, #01, #2E, #00
        DB      #01, #0F, #6E, #00, #00, #0F, #3F, #00
        DB      #00, #1F, #00, #00, #11, #0F, #3F, #00
        DB      #07, #0F, #2E, #00, #00, #1F, #00, #00
        DB      #00, #1F, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #11, #CC, #00, #77, #FF, #FF, #88
        DB      #00, #77, #EE, #00, #00, #00, #EE, #00
        DB      #00, #FF, #CC, #00, #00, #77, #EE, #00
        DB      #00, #77, #00, #00, #00, #77, #EE, #00
        DB      #33, #FF, #CC, #00, #00, #77, #00, #00
        DB      #00, #77, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #00, #0F, #2E, #00, #07, #0F, #4C, #00
        DB      #00, #07, #2E, #00, #0F, #0F, #4C, #00
        DB      #07, #0F, #0F, #88, #07, #0F, #0F, #88
        DB      #00, #07, #2E, #00, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #88, #07, #4C, #1F, #00, #00, #00
        DB      #1F, #00, #00, #1F
        DB      #00, #0F, #2E, #00, #07, #0F, #2E, #00
        DB      #01, #0F, #0F, #88, #0F, #0F, #1F, #00
        DB      #07, #0F, #0F, #88, #07, #0F, #0F, #88
        DB      #01, #0F, #0F, #88, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #88, #0F, #88, #1F, #00, #00, #00
        DB      #1F, #00, #00, #1F
        DB      #01, #3F, #1F, #00, #07, #EF, #1F, #00
        DB      #07, #7F, #CF, #2E, #1F, #EF, #0F, #88
        DB      #07, #FF, #FF, #88, #07, #FF, #FF, #88
        DB      #07, #7F, #CF, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #89, #1F, #00, #1F, #00, #00, #00
        DB      #0F, #88, #01, #1F
        DB      #01, #2E, #1F, #00, #07, #88, #1F, #00
        DB      #07, #88, #01, #2E, #1F, #00, #8F, #4C
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #07, #88, #01, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #8B, #2E, #00, #1F, #00, #00, #00
        DB      #0F, #4C, #03, #1F
        DB      #01, #2E, #1F, #00, #07, #89, #1F, #00
        DB      #1F, #00, #00, #EE, #1F, #00, #03, #4C
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #1F, #00, #00, #EE, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #8F, #4C, #00, #1F, #00, #00, #00
        DB      #0F, #2E, #07, #1F
        DB      #03, #4C, #07, #88, #07, #0F, #2E, #00
        DB      #1F, #00, #00, #00, #1F, #00, #03, #2E
        DB      #07, #0F, #88, #00, #07, #0F, #88, #00
        DB      #1F, #00, #00, #00, #07, #0F, #0F, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #0F, #88, #00, #1F, #00, #00, #00
        DB      #0F, #1F, #0F, #1F
        DB      #03, #4C, #07, #88, #07, #0F, #1F, #00
        DB      #1F, #00, #00, #00, #1F, #00, #03, #2E
        DB      #07, #0F, #88, #00, #07, #0F, #88, #00
        DB      #1F, #00, #00, #00, #07, #0F, #0F, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #0F, #4C, #00, #1F, #00, #00, #00
        DB      #1F, #0F, #1F, #1F
        DB      #03, #4C, #07, #88, #07, #FF, #0F, #88
        DB      #1F, #00, #00, #00, #1F, #00, #03, #2E
        DB      #07, #FF, #88, #00, #07, #FF, #88, #00
        DB      #1F, #00, #0F, #2E, #07, #FF, #8F, #88
        DB      #00, #1F, #00, #00, #00, #00, #03, #4C
        DB      #07, #0F, #2E, #00, #1F, #00, #00, #00
        DB      #1F, #07, #2E, #1F
        DB      #03, #4C, #07, #88, #07, #88, #07, #4C
        DB      #1F, #00, #00, #00, #1F, #00, #03, #2E
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #1F, #00, #0F, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #07, #88, #03, #4C
        DB      #07, #EF, #2E, #00, #1F, #00, #00, #00
        DB      #1F, #03, #4C, #1F
        DB      #07, #0F, #0F, #4C, #07, #88, #03, #4C
        DB      #07, #88, #00, #00, #1F, #00, #03, #4C
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #07, #88, #67, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #07, #88, #07, #4C
        DB      #07, #89, #1F, #00, #1F, #00, #00, #00
        DB      #1F, #01, #88, #1F
        DB      #07, #0F, #0F, #4C, #07, #88, #07, #4C
        DB      #07, #88, #01, #2E, #1F, #00, #07, #4C
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #07, #88, #01, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #07, #4C, #0F, #4C
        DB      #07, #88, #1F, #00, #1F, #00, #00, #00
        DB      #1F, #00, #00, #1F
        DB      #07, #FF, #CF, #4C, #07, #88, #0F, #88
        DB      #07, #4C, #03, #2E, #1F, #01, #0F, #88
        DB      #07, #88, #00, #00, #07, #88, #00, #00
        DB      #07, #4C, #01, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #03, #0F, #0F, #88
        DB      #07, #88, #07, #88, #1F, #00, #00, #00
        DB      #1F, #00, #00, #1F
        DB      #07, #88, #03, #4C, #07, #0F, #1F, #00
        DB      #23, #0F, #0F, #EE, #0F, #0F, #1F, #00
        DB      #07, #0F, #0F, #88, #07, #88, #00, #00
        DB      #23, #0F, #0F, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #01, #0F, #1F, #00
        DB      #07, #88, #07, #4C, #0F, #0F, #0F, #88
        DB      #1F, #00, #00, #1F
        DB      #07, #88, #03, #4C, #07, #0F, #2E, #00
        DB      #00, #8F, #3F, #00, #0F, #0F, #6E, #00
        DB      #07, #0F, #0F, #88, #07, #88, #00, #00
        DB      #00, #8F, #0F, #2E, #07, #88, #07, #88
        DB      #00, #1F, #00, #00, #00, #0F, #2E, #00
        DB      #07, #88, #03, #4C, #0F, #0F, #0F, #88
        DB      #1F, #00, #00, #1F
        DB      #33, #88, #11, #CC, #33, #FF, #CC, #00
        DB      #00, #33, #CC, #00, #77, #FF, #88, #00
        DB      #33, #FF, #FF, #88, #33, #88, #00, #00
        DB      #00, #33, #FF, #EE, #33, #88, #33, #88
        DB      #00, #77, #00, #00, #00, #77, #CC, #00
        DB      #33, #88, #11, #CC, #77, #FF, #FF, #88
        DB      #77, #00, #00, #77
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00
        DB      #07, #88, #03, #4C, #00, #07, #2E, #00
        DB      #07, #0F, #2E, #00, #00, #07, #2E, #00
        DB      #07, #0F, #2E, #00, #01, #0F, #1F, #00
        DB      #0F, #0F, #0F, #4C, #07, #88, #03, #4C
        DB      #1F, #00, #03, #4C, #1F, #00, #00, #1F
        DB      #0F, #88, #03, #2E, #1F, #00, #03, #4C
        DB      #07, #0F, #0F, #4C
        DB      #07, #4C, #03, #4C, #01, #0F, #0F, #88
        DB      #07, #0F, #1F, #00, #01, #0F, #0F, #88
        DB      #07, #0F, #1F, #00, #03, #0F, #0F, #88
        DB      #0F, #0F, #0F, #4C, #07, #88, #03, #4C
        DB      #1F, #00, #03, #4C, #1F, #00, #00, #1F
        DB      #0F, #88, #03, #2E, #1F, #00, #03, #4C
        DB      #07, #0F, #0F, #4C
        DB      #07, #2E, #03, #4C, #07, #7F, #CF, #2E
        DB      #07, #FF, #0F, #88, #07, #7F, #CF, #2E
        DB      #07, #FF, #0F, #88, #07, #7F, #8F, #4C
        DB      #0F, #0F, #0F, #4C, #07, #88, #03, #4C
        DB      #1F, #00, #03, #4C, #07, #88, #01, #2E
        DB      #0F, #4C, #07, #2E, #0F, #88, #07, #4C
        DB      #33, #FF, #CF, #4C
        DB      #07, #2E, #03, #4C, #07, #88, #01, #2E
        DB      #07, #88, #07, #88, #07, #88, #01, #2E
        DB      #07, #88, #07, #88, #07, #88, #03, #4C
        DB      #77, #8F, #FF, #CC, #07, #88, #03, #4C
        DB      #07, #88, #07, #88, #07, #89, #89, #2E
        DB      #07, #2E, #0F, #4C, #07, #4C, #0F, #88
        DB      #00, #00, #07, #88
        DB      #07, #1F, #03, #4C, #07, #88, #01, #2E
        DB      #07, #88, #07, #88, #07, #88, #01, #2E
        DB      #07, #88, #07, #88, #07, #88, #11, #CC
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #07, #88, #07, #88, #07, #8B, #4D, #2E
        DB      #03, #0F, #0F, #88, #03, #4C, #1F, #00
        DB      #00, #00, #1F, #00
        DB      #07, #0F, #8B, #4C, #1F, #00, #00, #1F
        DB      #07, #88, #0F, #88, #1F, #00, #00, #1F
        DB      #07, #88, #0F, #88, #07, #1F, #00, #00
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #07, #88, #07, #88, #03, #4F, #4F, #4C
        DB      #01, #0F, #1F, #00, #01, #0F, #2E, #00
        DB      #00, #01, #2E, #00
        DB      #07, #8F, #4F, #4C, #1F, #00, #00, #1F
        DB      #07, #0F, #1F, #00, #1F, #00, #00, #1F
        DB      #07, #0F, #1F, #00, #03, #0F, #1F, #00
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #03, #4C, #1F, #00, #03, #0F, #0F, #4C
        DB      #00, #0F, #2E, #00, #01, #0F, #2E, #00
        DB      #00, #03, #4C, #00
        DB      #07, #8F, #0F, #4C, #1F, #00, #00, #1F
        DB      #07, #0F, #2E, #00, #1F, #00, #00, #1F
        DB      #07, #0F, #2E, #00, #01, #0F, #0F, #88
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #03, #4C, #1F, #00, #03, #1F, #0F, #4C
        DB      #00, #0F, #2E, #00, #00, #0F, #4C, #00
        DB      #00, #07, #88, #00
        DB      #07, #8B, #0F, #4C, #1F, #00, #00, #1F
        DB      #07, #FF, #CC, #00, #1F, #00, #00, #1F
        DB      #07, #0F, #CC, #00, #00, #EF, #0F, #4C
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #03, #4C, #1F, #00, #03, #1F, #0F, #4C
        DB      #01, #0F, #1F, #00, #00, #07, #88, #00
        DB      #00, #1F, #00, #00
        DB      #07, #89, #0F, #4C, #07, #88, #01, #2E
        DB      #07, #88, #00, #00, #07, #89, #4D, #2E
        DB      #07, #8F, #4C, #00, #00, #00, #CF, #4C
        DB      #00, #07, #88, #00, #07, #88, #03, #4C
        DB      #01, #2F, #2E, #00, #01, #2E, #07, #88
        DB      #03, #0F, #0F, #88, #00, #07, #88, #00
        DB      #01, #2E, #00, #00
        DB      #07, #88, #0F, #4C, #07, #88, #01, #2E
        DB      #07, #88, #00, #00, #07, #89, #4D, #2E
        DB      #07, #8B, #2E, #00, #07, #88, #03, #4C
        DB      #00, #07, #88, #00, #07, #4C, #07, #4C
        DB      #01, #2F, #2E, #00, #01, #2E, #07, #88
        DB      #07, #3F, #0F, #4C, #00, #07, #88, #00
        DB      #03, #4C, #00, #00
        DB      #07, #88, #0F, #4C, #07, #4C, #03, #2E
        DB      #07, #88, #00, #00, #07, #4C, #0F, #2E
        DB      #07, #89, #1F, #00, #07, #4C, #07, #4C
        DB      #00, #07, #88, #00, #03, #0F, #0F, #88
        DB      #01, #0F, #2E, #00, #01, #2E, #07, #88
        DB      #0F, #4C, #07, #2E, #00, #07, #88, #00
        DB      #07, #88, #00, #00
        DB      #07, #88, #07, #4C, #23, #0F, #0F, #CC
        DB      #07, #88, #00, #00, #23, #0F, #0F, #CC
        DB      #07, #88, #0F, #88, #03, #0F, #0F, #88
        DB      #00, #07, #88, #00, #01, #0F, #1F, #00
        DB      #00, #0F, #4C, #00, #01, #2E, #07, #88
        DB      #0F, #88, #03, #2E, #00, #07, #88, #00
        DB      #07, #0F, #0F, #4C
        DB      #07, #88, #03, #4C, #00, #8F, #3F, #00
        DB      #07, #88, #00, #00, #00, #8F, #0F, #2E
        DB      #07, #88, #07, #4C, #01, #0F, #1F, #00
        DB      #00, #07, #88, #00, #00, #0F, #2E, #00
        DB      #00, #0F, #4C, #00, #01, #2E, #07, #88
        DB      #0F, #88, #03, #2E, #00, #07, #88, #00
        DB      #07, #0F, #0F, #4C
        DB      #33, #88, #11, #CC, #00, #33, #CC, #00
        DB      #33, #88, #00, #00, #00, #33, #EF, #2E
        DB      #33, #88, #33, #CC, #00, #FF, #EE, #00
        DB      #00, #33, #88, #00, #00, #77, #CC, #00
        DB      #00, #77, #88, #00, #00, #EE, #33, #88
        DB      #77, #88, #11, #EE, #00, #33, #88, #00
        DB      #33, #FF, #FF, #CC
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #EE
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00, #00, #00, #00, #00
        DB      #00, #00, #00, #00





;enddata:
