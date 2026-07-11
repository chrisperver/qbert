ifndef ISCART
ifndef ISCASSETTE
  read "spritegraphics.asm"    ; CODE 4000-7FFF
  ; TEST OUR OWN ROUTINES IN THE MAIN PROGRAM
  read "AMSTRADFONT9.asm"  ; CODE C100-FF00
endif
endif

org #0100
nolist

jumptable equ &C200

; JUMP TABLE
playsound_all_channelsf equ jumptable  ;39
initmusicf equ playsound_all_channelsf + 3
playmusicf equ initmusicf + 3
playsound_a equ playmusicf + 3
playsound_b equ playsound_a + 3
playsound_c equ playsound_b + 3
initsoundf equ playsound_c + 3
doballcollisionnoise equ initsoundf + 3
dojumpnoisebigball equ doballcollisionnoise + 3
dodiednoise equ dojumpnoisebigball + 3
setupplussprites equ dodiednoise + 3
hideallplussprites equ setupplussprites + 3
moveplussprite2 equ hideallplussprites + 3
dojumpnoise equ moveplussprite2 + 3
clearasicsprite equ dojumpnoise + 3
dojumpnoisecoily equ clearasicsprite + 3
dojumpnoiseredball equ dojumpnoisecoily + 3
hideplussprite equ dojumpnoiseredball + 3
playlevelcompletemusic equ hideplussprite + 3
playdiskmusic equ playlevelcompletemusic + 3
drawqube equ playdiskmusic + 3
drawpyramid equ drawqube + 3
setuppluspalette equ drawpyramid + 3
scr_set_border_plus equ setuppluspalette + 3
setblockcolour equ scr_set_border_plus + 3
cyclediskpalette equ setblockcolour + 3
cyclechangetotext equ cyclediskpalette + 3

cyclecubecolourpalette equ cyclechangetotext + 3
setuppluspalettemode1 equ cyclecubecolourpalette + 3
playemptymusic equ setuppluspalettemode1 + 3
drawminiqube equ playemptymusic + 3

setpaletteroundcolours equ drawminiqube + 3
updatepaletteroundcolours equ setpaletteroundcolours + 3

moveplussprite2orig equ updatepaletteroundcolours + 3

drawlevelscreenpyramid equ moveplussprite2orig + 3
setuppluspalettescoreboardbigletters equ drawlevelscreenpyramid + 3
setlevellogopalette equ setuppluspalettescoreboardbigletters + 3
setuppluspalettescoreboardnormal equ setlevellogopalette + 3
setlevellogopalette2 equ setuppluspalettescoreboardnormal + 3
setblockcolour_levelscreen equ setlevellogopalette2 +3

startflashlevelscreenpalette equ setblockcolour_levelscreen + 3
flashlevelscreenpalette equ startflashlevelscreenpalette + 3
dopaletteshiftbgdisk equ flashlevelscreenpalette + 3
cycleplayerpalette equ dopaletteshiftbgdisk + 3
setplayertextcolours equ cycleplayerpalette + 3
setbgblack equ setplayertextcolours + 3
setcoloursgreenball equ setbgblack + 3
qbert_right_clip8 equ setcoloursgreenball + 3
qbert_right_clip9 equ qbert_right_clip8 + 3
qbert_right_clip10 equ qbert_right_clip9 + 3
qbert_right_clip11 equ qbert_right_clip10 + 3
qbert_right_clip12 equ qbert_right_clip11 + 3
qbert_right_clip13 equ qbert_right_clip12 + 3
dofinishnoisescoreboard equ qbert_right_clip13 + 3
dodropstartnoise equ dofinishnoisescoreboard + 3
dodrawnormalimage2_compressed equ dodropstartnoise + 3
dodrawflipimage2_compressed equ dodrawnormalimage2_compressed + 3
drawnormalimage_fixedid_compressed equ dodrawflipimage2_compressed + 3
drawflipimage_fixedid_compressed equ drawnormalimage_fixedid_compressed + 3
coily_right_clip8 equ drawflipimage_fixedid_compressed + 3
coily_right_clip9 equ coily_right_clip8 + 3
coily_right_clip10 equ coily_right_clip9 + 3
coily_right_clip11 equ coily_right_clip10 + 3
coily_right_clip12 equ coily_right_clip11 + 3
coily_right_clip13 equ coily_right_clip12 + 3
coily_right_clip14 equ coily_right_clip13 + 3
dodeathleapnoise equ coily_right_clip14 + 3
doexplosionsound equ dodeathleapnoise + 3
dolazerboltnoise equ doexplosionsound + 3
playgreenballmusic equ dolazerboltnoise + 3
playnewlevelmusic equ playgreenballmusic + 3

; IMAGES
spritetable equ playnewlevelmusic + 3
image_disk equ spritetable
image_qbert_backright equ spritetable + 2
image_qbert_backright_landed equ spritetable + 4
image_qbert_frontright equ spritetable + 6
image_qbert_frontright_landed equ spritetable + 8
image_redball equ spritetable + 10
image_redball_squash equ spritetable + 12
image_coilyegg equ spritetable + 14
image_coilyegg_squash equ spritetable + 16
image_coilysnake_backright_landed equ spritetable + 18
image_coilysnake_frontright_landed equ spritetable + 20
image_coilysnake_frontright_top equ spritetable + 22
image_coilysnake_frontright_bottom equ spritetable + 24
image_coilysnake_backright_top equ spritetable + 26
image_coilysnake_backright_bottom equ spritetable + 28
image_greenball equ spritetable + 30
image_greenball_squash equ spritetable + 32
image_slick_crouch equ spritetable + 34
image_slick_1 equ spritetable + 36
image_slick_2 equ spritetable + 38
image_slick_3 equ spritetable + 40
image_sam_crouch equ image_slick_3 + 2
image_sam_1 equ image_sam_crouch + 2
image_sam_2 equ image_sam_1 + 2
image_sam_3 equ image_sam_2 + 2
image_ugg_backright equ image_sam_3 + 2
image_ugg_backright2 equ image_ugg_backright + 2
image_red_underline equ image_ugg_backright2 + 2
image_ugg_backright3 equ image_red_underline + 2
image_ugg_backright4 equ image_ugg_backright3 + 2
image_ww_backright equ image_ugg_backright4 + 2
image_ww_backright2 equ image_ww_backright + 2
image_ww_backright3 equ image_ww_backright2 + 2
image_ww_backright4 equ image_ww_backright3 + 2
image_coilysnake_backright_bottom_clip8 equ image_ww_backright4 + 2
image_coilysnake_backright_bottom_clip9 equ image_coilysnake_backright_bottom_clip8 + 2
image_coilysnake_backright_bottom_clip10 equ image_coilysnake_backright_bottom_clip9 + 2
image_coilysnake_backright_top_clip10 equ image_coilysnake_backright_bottom_clip10 + 2
image_coilysnake_backright_top_clip11 equ image_coilysnake_backright_top_clip10 + 2
image_coilysnake_backright_top_clip12 equ image_coilysnake_backright_top_clip11 + 2
image_coilysnake_backright_top_clip13 equ image_coilysnake_backright_top_clip12 + 2

; DATA VARIABLES USED BY SUBMODULES
musicstatus equ image_coilysnake_backright_top_clip13 + 2

;qbertlogo equ drawlevelnumberempty + 3
;image_torch equ qbertlogo + 3
;image_key equ image_torch + 2
;image_sarcophagus equ image_key + 2
;image_scroll equ image_sarcophagus + 2
;image_treasure equ image_scroll + 2
;image_ankh equ image_treasure + 2

;screenptrtable    equ &F700
;my_data_objectmap equ &F900

; JUMP TABLE FOR AMSTRADFONT4
jp start
jp my_txt_set_window
jp my_txt_clear_window
jp txt_set_paper
jp txt_set_pen
jp scr_next_line_hl
jp locatetextf
jp writelineplainf
jp scr_set_ink
   
startclip   equ 5 ; FRAME TO START CLIPPING QBERT AT WHEN HE JUMPS OFF PYRAMID
;debugcoords equ 1

extralifebonusamt1 equ 8000
extralifebonusamt2 equ 14000

defb "Q*bert - CPSoft 11.07.2026"

; ===============================================================================
;  SPEECH 
; 
;  NEED TO SWITCH TO BANK 4 OF ROM AND DISABLE INTERRUPTS
; -------------------------------------------------------------------------------

ifdef ISCART

; JUMP BLOCK OF SPEAKER ROM
speakerrom equ &C000
saycommand equ speakerrom+15

speechimturnedonptr: defw speechimturnedonstr
speechimturnedonstr: defb 22 ; LENGTH OF STRING
                     defw speechimturnedon
			
speechimturnedon:    defb " HELLO. I'M TURNED ON ",0
introspeechdone:     defb 0
					
speechswearptr:      defw speechswearstr
speechswearstr:      defb 9 ; LENGTH OF STRING
                     defw speechswear
					 
speechbyebyeptr:     defw speechbyebyestr
speechbyebyestr:     defb 9 ; LENGTH OF STRING
                     defw speechbyebye

speechswear:        defb " OH SHI! ",0
speechbyebye:       defb " BYE BIE ",0


; COPY BANKS OF CODE TO RAM
qbertspeak:
  ; ONLY SPEAK ONCE WHEN WE TURN THE MACHINE ON
  ld a,(introspeechdone)
  or a
  ret nz
  ld a,1
  ld (introspeechdone),a
  
  ld hl,speechimturnedonptr
  jr qbertspeak2
qbertbyebye:
  ld hl,speechbyebyeptr
  jr qbertspeak2
qbertswear:
  ld hl,speechswearptr
qbertspeak2:
  ld (speechphraseptr-2),hl
  push ix
  di 
  ; SELECT SPEAKER ROM IN C000
  ld bc,&df85
  out (c),c
  
  ; WE NEED TO REMEMBER WHAT SCREEN MODE WE ARE CURRENTLY IN
  ; MODE 1 IF IN MENU, MODE 0 IF IN GAME
  ; WHEN WE ENABLE OR DISABLE UPPER ROM, WE NEED TO SET THE MODE
  ; SO WE NEED TO REMEMBER WHAT ONE TO SET IT TO
  ld a,(modesplit3a-1)
  cp &8d ; MODE 1 CURRENTLY IN USE?
  jr z,keepmodeone2
  
  ;; enable upper rom + mode 0
  ld bc,&7f00+%10000100
  out (c),c
  jr skipkeepmodeone2
  
  keepmodeone2:
  ;; enable upper rom + mode 1
  ld bc,&7f00+%10000101
  out (c),c
  skipkeepmodeone2:

  ; SAY PHRASE
  ld a,1 ; SET ARGUMENT NUMBER
  ld iy,speechdatabuffer
  ld ix,0:speechphraseptr
  
  call saycommand

  ld a,(modesplit3a-1)
  cp &8d ; MODE 1 CURRENTLY IN USE?
  jr z,keepmodeone

  ;; disable upper and lower rom + mode 0
  ld bc,&7f00+%10001100
  out (c),c
  jr skipkeepmodeone
  
  keepmodeone:
  ;; disable upper and lower rom + mode 1
  ld bc,&7f00+%10001101
  out (c),c
  
  skipkeepmodeone:
  
  ; SET MEMORY STANDARD
  ld bc,&df80
  out (c),c

  call initsoundf ; MAKE SURE VOLUME LEVELS ARE RESET AFTER SPEECH

  ; RESET INTERRUPT CYCLE FOR SCREEN MODE SPLIT BEFORE WE REENABLE INTERRUPTS
  ld hl,interrupttable
  ld (interrupttableptr),hl
  call mc_wait_flyback
  pop ix
  ei
ret
endif

km_wait_key_id:
  call mc_wait_flyback
  call km_read_key_id
  jr nc,km_wait_key_id
ret

km_read_key_id:
;  call read_matrix                 ; MATRIX READ VIA INTERRUPT EVERY 50TH SECOND
  ld hl,matrix_buffer+10
  ld b,10
  doloopy2:
    dec hl
    ld a,(hl)
	cp 255                          ; FIND FIRST KEY IN BUFFER THAT HAS BEEN PRESSED (NOT 255)
	jr z,donextline2
	
    ; WE FOUND A KEY	
    ld c,0	
	bit 0,a
	jr z,foundbit
	inc c
	bit 1,a
	jr z,foundbit
	inc c
	bit 2,a
	jr z,foundbit
	inc c
	bit 3,a
	jr z,foundbit
	inc c
	bit 4,a
	jr z,foundbit
	inc c
	bit 5,a
	jr z,foundbit
	inc c
	bit 6,a
	jr z,foundbit
	inc c
	bit 7,a
	jr z,foundbit
	
	donextline2:
  djnz doloopy2
  xor a ; CLEAR CARRY
ret

foundbit:
  scf
ret

km_read_key:
;  call read_matrix                 ; MATRIX READ VIA INTERRUPT EVERY 50TH SECOND
  ld hl,matrix_buffer+9
  ld b,10
  doloopy:
    ld a,(hl)
	cp 255                          ; FIND FIRST KEY IN BUFFER THAT HAS BEEN PRESSED (NOT 255)
	jr z,donextline
	
    ; WE FOUND A KEY	
    ld c,0	
	bit 0,a
	jr z,returncharfromkeymap
	inc c
	bit 1,a
	jr z,returncharfromkeymap
	inc c
	bit 2,a
	jr z,returncharfromkeymap
	inc c
	bit 3,a
	jr z,returncharfromkeymap
	inc c
	bit 4,a
	jr z,returncharfromkeymap
	inc c
	bit 5,a
	jr z,returncharfromkeymap
	inc c
	bit 6,a
	jr z,returncharfromkeymap
	inc c
	bit 7,a
	jr z,returncharfromkeymap
	
	donextline:
	dec hl
  djnz doloopy
  xor a ; CLEAR CARRY
ret

returncharfromkeymap:
  ld hl,keyboard_translation_tables
  ld a,b
  ld b,0
  add hl,bc ; MOVE HORIZONTAL BIT COLUMN IN DATA TABLE
  push hl
  ld hl,convertsinglestotens
  ld b,0
  ld c,a
  dec c     ; START FROM LINE 0 NOT 1
  add hl,bc ; MOVE VERTICAL LINE IN TABLE
  ld c,(hl)
  pop hl
  add hl,bc
  ;xor a
  ;ld (keyrelease),a                 ; CLEAR KEYRELEASE BUFFER
  ld a,1                             ; RECORD THAT KEY HAS BEEN PRESSED
  ld (keyrelease),a
  ld a,(hl) ; GET KEYPRESS
  ld (charbuffer),a                 ; LOAD CHARACTER INTO BUFFER SO WE CAN CHECK IT EVEN AFTER PLAYER RELEASES KEY
  scf       ; SET CARRY
ret

convertsinglestotens: defb 0,8,16,24,32,40,48,56,64,72,80

; =============================
; KEYBOARD
; -----------------------------

;;+------------------------------------------------------
;; keyboard translation tables
;Translates keyboard row/columns to key values

;Normal key table

;;----------------------------------------------------------
keyboard_translation_tables:      ;{{Addr=$1eef Data Calls/jump count 0 Data use count 1}}
     ; BIT  0,  1,  2,  3,  4,  5,  6,  7 
		db "u","r","d","9","6","3",10, "."  ; 0 CURSOR UP, CURSOR RIGHT, CURSOR DOWN, f9, f6, f3, Enter, f.
		db "l","c","7","8","5","1","2","0"  ; 1 CURSOR LEFT, COPY, f7, f8, f5, f1, f2, f0
		db "c","[",13 ,"]","4","s",&5C,"c"  ; 2 CLEAR, [, RETURN, ], f4, SHIFT, \ (&5C), CTRL
		db "^","-","@","P",";",":","/",","  ; 3 £,=,BAR,P,;,colon,/,COMMA
		db "0","9","O","I","L","K","M","."  ; 4 0,9,O,I,L,K,M,DOT
		db "8","7","U","Y","H","J","N"," "  ; 5 8,7,U,Y,H,J,N,SPACE
		db "6","5","R","T","G","F","B","V"  ; 6 6,5,R,T,G,F,B,V
		db "4","3","E","W","S","D","C","X"  ; 7 4,3,E,W,S,D,C,X
		db "1","2","e","Q","t","A","c","Z"  ; 8 1,2,ESC,Q,TAB,A,CAPS,Z
		db "u","d","l","r","f","g","h",&7f  ; 9 UP, DOWN, LEFT, RIGHT, FIRE 1, FIRE 2, UNUSED, DELETE
end_keyboard_translation_tables:

read_matrix:
  ;call waitvsync
  ; WAIT FLYBACK
  ld b,&f5
  v1b2:
  in a,(c)
  rra
  jr nc,v1b2

keyscan:
        ;di              ;1 ##%%## C P C   VERSION ##%%##
        ld hl,matrix_buffer    ;3
        ld bc,#f782     ;3
        out (c),c       ;4
        ld bc,#f40e     ;3
        ld e,b          ;1
        out (c),c       ;4
        ld bc,#f6c0     ;3
        ld d,b          ;1
        out (c),c       ;4
        ld c,0          ;2
        out (c),c       ;4
        ld bc,#f792     ;3
        out (c),c       ;4
        ld a,#40        ;2
        ld c,#4a        ;2 44
loopa:  ld b,d          ;1
        out (c),a       ;4 select line
        ld b,e          ;1
        ini             ;5 read bits and write into KEYMAP
        inc a           ;1
        cp c            ;1
        jr c,loopa      ;2/3 9*16+1*15=159
        ld bc,#f782     ;3
        out (c),c       ;4
        ;ei              ;1 8 =211 microseconds
        ret

waitanykey:
  call read_matrix
  ld hl,matrix_buffer
  ld b,10
  dokeyloop:
    ld a,(hl)
	cp 255
	ret nz
	inc hl
  djnz dokeyloop
jr waitanykey

unlockasic:
  ; SET INTERRUPT FUNCTION - STOPS BASIC RE-LOCKING ASIC
 ; di
  ld a,&C9 ; C9 = RET, C3 = JP
  ld hl,&0038
  ld (hl),a

  ;; unlock ASIC so we can access ASIC registers

  ld b,&bc
  ld hl,sequence
  ld e,17
  seq:
    ld a,(hl)
    out (c),a
    inc hl
    dec e
  jr nz,seq
 ; call mc_wait_flyback
 ; ei 
ret

;; sequence to unlock asic
sequence: defb &ff,&00,&ff,&77,&b3,&51,&a8,&d4,&62,&39,&9c,&46,&2b,&15,&8a,&cd,&ee

amsfonttable    equ &C100
mask_table      equ &FF00
sparespritebuff equ &FE00

init_mask_table:
  ld hl,mask_table  ;; base address of the mask table
  ld bc,0            ;; counter
  ;ld c,0            ;; initial pixel value

  mmt1:
  ld d,0	          ;; initialise initial mask

  ld a,c
  and &aa	          ;; isolate bits used to define the pen for the left pixel.
  jr z,mmt2

  ;; the pixel is transparent

  ;; update mask so that it will keep the left pixel from the 
  ;; screen's byte
  ld a,d
  or &aa
  ld d,a

  mmt2:
  ld a,c
  and &55           ;; isolate bits used to define the pen for the left pixel.
  jr z,mmt3

  ;; the pixel is transparent

  ;; update mask so that it will keep the right pixel from the 
  ;; screen's byte
  ld a,d
  or &55
  ld d,a

  mmt3:
  ld a,d
  cpl 
  ld (hl),a     ;; store final mask in table
  inc hl        ;; increment position in table
  inc c         ;; increment pixel value
  djnz mmt1     ;; loop
ret

; ADJUST CRTC TO MATCH ARCADE RESOLUTION OF 256x240  
setcrtc2:
  ;; set width of screen in characters
  ld bc,&bc01
  out (c),c
  ld bc,&bd00+32
  out (c),c

  ;; set height of screen in CRTC characters
  ld bc,&bc06
  out (c),c
  ld bc,&bd00+30
  out (c),c

  ;; set horizontal position of screen so that it is centralised 
  ld bc,&bc02
  out (c),c
  ld bc,&bd00+42
  out (c),c

  ;; set vertical position of screen so that it is centralised
  ld bc,&bc07
  out (c),c
  ld bc,&bd00+35-2
  out (c),c

  ;; set 8 raster lines per CRTC character line
  ld bc,&bc09
  out (c),c
  ld bc,&bd00+7  
  out (c),c
ret

insertcoinpressed: defb 0
menutimerdelay:    defw 2
isautoplay:        defb 1
startofpushtextaddress equ &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64

ifndef ISCART
setscreen8000nocart:
  ; MOVE SCREEN MEMORY TO 8000-BFFF
  ld hl,0        ;; get scroll offset
  ld a,h
  or &20                   ;; This defines the "base" of the screen in 16k units.
  ld h,a
  ld bc,&bc0c              ;; select CRTC register 12
  out (c),c
  inc b                    ;; B = &BD
  out (c),h                ;; write to CRTC register 12
  dec b
  inc c                    ;; BC = &BC0D
  out (c),c                ;; select CRTC register 13
  inc b
  out (c),l                ;; write to CRTC register 13 ;
ret
endif

start:
;ifndef ISCART
  ; NEED TO SET STACK HERE FIT IN 100 
  ld hl,&0000
  ld (hl),0
  ld de,&0001
  ld bc,&00FF
  ldir
  ld sp,&0100  
  ifndef ISCART
  call setscreen8000nocart

endif
ifdef ISCART
  call waitanykey
endif  


  di 
  ; SET SCREEN DIMENSIONS
  call setcrtc2
  ; GENERATE LOOKUP TABLES
  call init_mask_table

  call unlockasic
 
  ; page-in asic registers to &4000-&7fff
  ld bc,&7fb8
  out (c),c
  
  call installinterrupt
  
  call initsoundf;enablemusic           ; ENABLE INTERRUPT TO PLAY MUSIC
  call setjoystickbits       ; SET JOYSTICK CONTROL BY DEFAULT
  call mc_wait_flyback
  ei 

  resetgame:
  call disablesecondinterrupt ; JUST IN CASE WE WERE FLASHING SCORE ON SCOREBOARD
  
  ; MOVE COPYRIGHT SYMBOL TO BUFFER
  ld hl,image_copyright	
  ld a,2
  call copyspritefromunderasictoasic
 
  ; ----------------------------------------------
  ; RESET VARIABLES
  ; RESET PLAYER MODE

  ld a,1
  ld (currentplayer),a
  ld (isautoplay),a
  ld (changecubecolour-1),a 
  xor a
  ld (istwoplayer),a
  ld (musicstatus),a
  ld (donejumpnoisebigballmenu),a
 
  ; ----------------------------------------------
  ; SET DEFAULT PLAYER DATA
  
  ; RESET ROUND AND LEVEL
  ld (round),a
  ld (level),a
  ld (rankp1),a
  ld (rankp2),a

  ; RESET SCORE AND LIVES 
  ld hl,0
  ld (scorebcd),hl
  ld (scorebcd+2),hl
  ld a,3
  ld (lives),a
  
  ; RESET GRID PROPERTIES DATA AREAS FOR PLAYER 1 AND 2
  ld hl,playerdata_copy_player1   ; CLEAR &80 TO &FF
  ld de,playerdata_copy_player1+1
  ld (hl),0
  ld bc,191;27
  ldir
  
  ; RESET CUBE COLOUR CHANGE MODE
  xor a
  ld (cubecolourchangemode),a

  ; RESET LEVEL BONUS
  ld hl,&0750
  ld (currentbonusbcd),hl
  ld hl,750
  ld (currentbonusnormal),hl
  ld hl,extralifebonusamt1
  ld (extralifebonusmilestone),hl
  
  ; - - - - - - - - - - - - - - - - - - - - - - - - 
  
  ; COPY DEFAULT PLAYER DATA TO PLAYER ONE AND TWO SPARE DATA AREAS
  ld hl,startplayerdata
  ld de,playerdata_copy_player1
  ld bc,28
  ldir
  ld hl,startplayerdata
  ld de,playerdata_copy_player2
  ld bc,28
  ldir
  
  ; ------------------------------------------------
  
  ; UPDATE INSTRUCTIONS WITH CORRECT BONUS TEXT
  ld hl,extralifebonusamt1
  call convwordtostr
  ld hl,wordtostr
  ld de,txt_bonuslives1
  ld bc,5
  ldir
  ld hl,extralifebonusamt2
  call convwordtostr
  ld hl,wordtostr
  ld de,txt_bonuslives2
  ld bc,5
  ldir
  
  xor a
  ld (inputcall-1),a
  ld hl,0
  ld (inputfunction-2),hl
  ; RESET QBERT POSITIONS IN MENU AND INSTRUCTIONS
  ld (menumovecounter),a
  ld (isscoreboardmenu),a
  ld (qbertmenumove_horiz-2),hl
  
  ; INTERRUPTS
  ;call enablepushp1p2startmessage
  call enablecyclediskpalette
  
  ; SET UP SCREEN
  call hideallplussprites            ; HIDE SPRITES FROM GAME IF WE WERE IN GAME ATTRACT MODE
  call splitscreen_allmode1
  call disableplayertextfadecolours
  
  ; SPRITES
  ; KILL ALL ACTIVE ENEMIES
  call killallenemies
  ld ix,spriteid
  call resetplayermomentum
  
  call setupplussprites
  call disablesplitpalettelevelscreen
  call setuppluspalettemode1

  ld hl,txt_setupscreen
  call printstring
  
  call printcredits
  ld hl,txt_title
  call printstring
  ld hl,txt_credits
  call printstring
  
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ld de,&8000+64+64+64+64+64+64+64+64+64+64+64+12+8+2
  call drawqbertlogo

  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  
  ; DRAW COPYRIGHT SYMBOL
  ld a,2
  ld hl,110-64+16
  ld b,80+32
  call moveplussprite2

  ; SET START SPRITE QBERT SCROLL POSITIONS
  ld hl,2;0;-16
  ld (qbertmenumove_horiz-2),hl
  ld b,140+16+16
  xor a
  call moveplussprite2

  ; DISK
  ld hl,0;-18
  ld b,145+16+16
  ld a,1
  call moveplussprite2
  
ifdef ISCART
  call qbertspeak
endif
  
  ; WAIT FOR USER TO PRESS A KEY TO CONTINUE
  startscreenloop:
	; PRESSED FIRE
	call testkeyfire
    jr z,checkfinishedmenuloopb
	call testkeyfire2
    jr z,checkfinishedmenuloopb_2player
  
	call doqbertmenumove1
	call flashpushp1p2message
	
    ; INSERT COIN
    call testkeyup
    jr nz,skipinsertcoin
	; ONLY INSERT COIN ONCE, NO KEY REPEAT
	ld a,(insertcoinpressed)
	or a
	jr nz,skipinsertcoin
	ld a,1
	ld (insertcoinpressed),a
    call insertcoin
	
	skipinsertcoin:
	
	call km_check_keyrelease
	jr nc,p1_notpressedup2
	; INSERT COIN KEY HAS BEEN RELEASED
    xor a
    ld (insertcoinpressed),a
    p1_notpressedup2:
  jr startscreenloop

  checkfinishedmenuloopb_2player:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr c,startscreenloop
  ; NO MONEY INSERTED
  sub 2
  jr c,startscreenloop
  
  ld a,1
  ld (istwoplayer),a
  ; USE CREDIT
  ld a,(credits)
  dec a
  ld (credits),a
  jr continuecheckfinishedmenuloopb

  checkfinishedmenuloopb:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr z,startscreenloop
  
  continuecheckfinishedmenuloopb:
  ; USE CREDIT
  ld a,(credits)
  dec a
  ld (credits),a
  jp drawlevelscreen

  ; INSTRUCTIONS
 
doqbertmenumove1:
  ; SLOW DOWN QBERT MOVEMENT IN MENU
  ld a,(mummymovementok)        ; WAIT UNTIL INTERRUPT TELLS US TO MOVE MUMMIES
  or a
  ret nz                        ; WE HAVE MOVED QBERT ALREADY
  ld a,1                        ; MARK THAT WE HAVE COMPLETED DELAY
  ld (mummymovementok),a	

  ld hl,0:qbertmenumove_horiz
  inc hl
  inc hl
  ld (qbertmenumove_horiz-2),hl
  ld b,140+16+16
  xor a
  call moveplussprite2
  
  ld b,145+16+16
  ld a,1
  call moveplussprite2
  ; HAVE WE REACHED SCREEN EDGE?
  ld bc,480
  or a
  sbc hl,bc
  jp nc,showinstructions
ret  
 
redballdescend_menu2:
  ld a,(menumovecounter)
  inc a
  ld (menumovecounter),a
  
  ; SET GRAPHIC TO OKAY QBERT
  ld hl,(image_qbert_frontright)
  xor a
  call drawnormalimage_fixedid_compressed
  ; DISPLAY CURSING
displayswear:
  call setqbertswearwordsprites
  
  ; MOVE SPRITE
  ld hl,(currplayerposxyhires)
  ld bc,16
  sbc hl,bc
  
  push hl
  
  ld a,(currplayerposy)
  sub 24
  
  ; TOP OF SPEECH BUBBLE
  push af
  ld b,a
  ld a,1+5
  call moveplussprite2
  pop af
  
  ld bc,32
  add hl,bc
  
  push af
  ld b,a
  ld a,3+5
  call moveplussprite2
  pop af
  
  ld bc,32
  add hl,bc
  
  push af
  ld b,a
  ld a,5+5
  call moveplussprite2
  pop af
  
  pop hl
  
  ; MOVE DOWN ROW
  add 16
  
  push af
  ld b,a
  ld a,2+5
  call moveplussprite2
  pop af
  
  ld bc,32
  add hl,bc
  
  push af
  ld b,a
  ld a,4+5
  call moveplussprite2
  pop af
  
  ld bc,32
  add hl,bc
  
  ld b,a
  ld a,6+5
  jp moveplussprite2
  ;jp qbertswear

; HIDE SWEARING - ARCADE MOVES TO GAME ATTRACT MODE
hideswear:
  ld b,1+5
  call hideplussprite
  inc b
  call hideplussprite
  inc b
  call hideplussprite
  inc b
  call hideplussprite
  inc b
  call hideplussprite
  inc b
  jp hideplussprite
  
doqbertmenumove:
  ; SHORTEN MENU JUMP HORIZONTALLY 
  ;ld a,1
  ;ld (ix+ix_movexpixels),a
  ; RESET MENU TIMER
  ld a,60
  ld (menutimer),a
  ; DECIDE WHICH MOVE WE MAKE QBERT DO BASED ON COUNTER
  ld a,(menumovecounter)
  or a
  jp z,jumpdownright_reveal
  dec a;cp 1
  jp z,jumpdownright_reveal
  dec a;cp 2
  jp z,jumpdownright_reveal
  dec a;cp 3
  jp z,jumpdownright_reveal
  dec a;cp 4
  jp z,jumpdownright_reveal
  dec a;cp 5
  jp z,redballdescend_menu  ; BALL DESCENDING
  dec a;cp 6
  jp z,redballdescend_menu2 ; BALL HIT QBERT - SWEAR
  dec a;cp 7
  jr z,movegameattract ; CLEAR SWEAR
ret

movegameattract:
  call hideswear
  ; HIDE QBERT
  ld b,0
  call hideplussprite
  jp drawnewlevelclearscreen_gameattract


setlevelscreenfinished:
  scf ; SET CARRY FLAG
ret
  
movementgameattractmode: 
  ; LEFT SIDE OF PYRAMID DEMO
  defb 4,3,4,3,4,1,3,2,2,4,2,4,4,4,1,1,2, 3,4,4,2,2,0      ; GAME ATTRACT DIRECTIONS
movementgameattractmode2:
  ; RIGHT SIDE OF PYRAMID DEMO
  defb 3,4,3,4,4,3,1,1,3,4,1,3,1,3,2,2,2,3,1, 4,4,3,0      ; GAME ATTRACT DIRECTIONS
  
menumovelevelscreen: 
  defb 3,2,4,1,0,0,0,0      ; MENU MOVE DIRECTIONS LEVEL 1
  defb 3,4,2,3,1,4,0,0      ; MENU MOVE DIRECTIONS LEVEL 2
  defb 3,4,2,1,4,3,1,0      ; MENU MOVE DIRECTIONS LEVEL 3
  defb 4,3,2,1,4,3,2,1,4,0  ; MENU MOVE DIRECTIONS LEVEL 4 AND ABOVE

checkfinishedmenuloopc_2player:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr z,doqbertmenumove_gameattract
  ; NOT ENOUGH MONEY INSERTED FOR 2 PLAYER
  sub 2
  jr c,doqbertmenumove_gameattract
  
  ld a,1
  ld (istwoplayer),a
  ; USE CREDIT
  ld a,(credits)
  dec a
  ld (credits),a
  jp continuecheckfinishedmenuloopb

checkfinishedmenuloopc:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr z,doqbertmenumove_gameattract
  ; USE CREDIT
  jp continuecheckfinishedmenuloopb
  
doqbertmenumove_gameattract:
  ; CHECK IF PLAYER PRESSED FIRE TO START GAME
  call testkeyfire
  jp z,checkfinishedmenuloopc
  call testkeyfire2
  jr z,checkfinishedmenuloopc_2player

  ld a,(moveqbertondiskvariable)
  or a
  jp nz,moveqbertondisk
  
  ; RANDOMLY PICK A DEMO, LEFT OR RIGHT SIDED
  ld hl,0:gamedemotype
  xor a
  jr dogameattractmovement
  
doqbertmenumove_levelscreen:
  ; RESET MENU TIMER
  ld a,30
  ld (menutimer),a
  ; DECIDE WHICH MOVE WE MAKE QBERT DO BASED ON COUNTER
  ld hl,menumovelevelscreen
  ld a,(level)
  ; SET MAX LEVEL MOVEMENT LOOKUP TO 3
  sub 4
  jr c,skipsetmaxlevelmovementlookup  
  ld a,3
  jr continuelevelmovementlookup
  skipsetmaxlevelmovementlookup:
  add 4
  continuelevelmovementlookup:
  rlca
  rlca
  rlca
  
  dogameattractmovement:
  ld c,a
  ld a,(menumovecounter)
  add c
  ld c,a
  ld b,0
  add hl,bc
  
  ; STOP INCREMENTING MENU MOVE COUNTER IF WE REACH A ZERO
  ld a,(hl)
  or a
  jp z,setlevelscreenfinished
  
  ; MAKE SURE WE UPDATE DIRECTION VARIABLE, AS SPRITE MOVEMENT FUNCTION NEEDS TO KNOW WHAT DIRECTION WE ARE GOING IN
  ld (ix+ix_playermovedirection),a
  
  ld a,(menumovecounter)
  inc a
  ld (menumovecounter),a
ret  

isqbertlevelscreenmovement: defb 0
isqbertmenumovement:        defb 0
menutimer:                  defb 60
menumovecounter:            defb 0
  
redballdescend_menu:
  ld d,1
  call spawnenemy
  jp jumpstraightdowntmenu  

jumpdownright_reveal:
  ld a,(menumovecounter)
  inc a
  ld (menumovecounter),a
  jp jumpdownrightmenu

drawheader_autoplay:
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  ld de,&8000+6;+64+64
  call drawqbertlogo
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  ld hl,txt_credits
  call printstring
  jp printcredits

drawheader_game: 
  ld a,(istwoplayer)
  or a
  jr z,skipclearheader
  ; CLEAR HEADER AREA INCASE WE HAVE SWITCHED PLAYERS
  ld hl,scr_addr
  xor a
  ld bc,63
  ld (bytestoclear-2),bc
  ld b,16
  call clearloopvert
  skipclearheader:

  call printscore
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ld a,(istwoplayer)
  or a
  jr z,skipprinttwoplayerheader
  ld a,(currentplayer)
  cp 2
  jr z,doprintplayer2text
  ; PRINT PLAYER ONE HEADER
  call printplayertext
  call print1text
  
  ld h,30-5
  ld l,2
  call my_txt_set_cursor
  ld a,3
  call txt_set_pen
  ld hl,txt_player
  call printstring_oldnontransp
  ld a,"2"
  call my_txt_output
  
  
  jr finishprintplayertext
  doprintplayer2text:
  ; PRINT PLAYER TWO HEADER
  call printplayer2text
  call print2text
  
  ld h,1
  ld l,2
  call my_txt_set_cursor
  ld a,3
  call txt_set_pen
  ld hl,txt_player
  call printstring_oldnontransp
  ld a,"1"
  call my_txt_output
  
  jr finishprintplayertext
  skipprinttwoplayerheader:
  ; PRINT SINGLE PLAYER HEADER
  call printplayertext
  call print1text
  finishprintplayertext:
  
  ld de,&8000+64+64+64+64+64+64-11+&0800+&0800+&0800+&0800+&0800
  call drawlevelroundtext
  ld de,&8000+64+64+64+64+64+&0800+&0800+&0800+&0800+&0800
  call drawlivestext
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  call drawlivescounter
  jp drawlevelroundtextvalues
  
showinstructions:
  ; HALF HORIZONTAL LEAP MOVEMENT IN MENU
  ld hl,movemenuleapdownright
  ld (leaptype2-2),hl

  call hideallplussprites
  ; ALLOW MOVEMENTS IN MENU WITHOUT COLOURING CUBES
  ld a,1
  ld (isqbertmenumovement),a
  ; MAKE SURE WE CAN MOVE OK
  ld (playeralive),a           
  xor a
  ld (menumovecounter),a
  ; MAKE SURE WE ARE NOT GREEN BALL FROM SCOREBOARD
  ld (npctype),a               
  ld d,a
  call copyspriteptrsbynpcid
 
  ld hl,txt_setupscreen
  call printstring

  call drawheader_autoplay
 
  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld b,16+14    ; TOP BLOCK
  ld hl,32+16   ; CENTRE ON SCREEN 
  ld (currplayerposxyhires),hl
  ld a,b
  ld (currplayerposy),a
  xor a         ; SPRITE ID TO MOVE
  call moveplussprite2
  
  ld ix,spriteid ; LOAD SPRITE DATABLOCK INTO IX
  showinstructionsloop:
	; PRESSED FIRE
	call testkeyfire
    jr z,checkfinishedmenuloop2
	call testkeyfire2
    jr z,checkfinishedmenuloop2_2player
    ; INSERT COIN
    call testkeyup
    jr nz,skipinsertcoin2

	; ONLY INSERT COIN ONCE, NO KEY REPEAT
	ld a,(insertcoinpressed)
	or a
	jr nz,skipinsertcoin2
	ld a,1
	ld (insertcoinpressed),a
    call insertcoin
	
	skipinsertcoin2:
	
	call km_check_keyrelease
	jr nc,p1_notpressedup2a
	; INSERT COIN KEY HAS BEEN RELEASED
    xor a
    ld (insertcoinpressed),a
    p1_notpressedup2a:

    ld a,(mummymovementok)
    or a
    jr nz,skipdomovements
    ld a,1
    ld (mummymovementok),a	
  
    ; CHECK TIME DELAY FOR QBERT ANIMATION
    ld a,(menutimer)
	dec a
	ld (menutimer),a
	or a
	call z,doqbertmenumove

	call domovements
	skipdomovements:
	
	call flashpushp1p2message
  jr showinstructionsloop

  checkfinishedmenuloop2:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr z,showinstructionsloop
  jp continuecheckfinishedmenuloopb
  
  checkfinishedmenuloop2_2player:
  ; NO MONEY INSERTED
  ld a,(credits)
  or a
  jr z,showinstructionsloop
  ; NOT ENOUGH MONEY FOR 2 PLAYER
  sub 2
  jr c,showinstructionsloop
  
  ld a,1
  ld (istwoplayer),a
  ; USE CREDIT
  ld a,(credits)
  dec a
  ld (credits),a
  jp continuecheckfinishedmenuloopb

credits:                 defb 0
istwoplayer:             defb 0
currentplayer:           defb 1
; RECORD IF WE NEED TO GENERATE OR LOAD DISK POSITIONS
disksgeneratedforroundplayer1: defb 0
disksgeneratedforroundplayer2: defb 0

; TEMPORARY AREA FOR SCORE TO BE ADDED TO MAIN SCORE
scorebcdsource:  defb &00,&00,&00,&00

currentrank:             defb 0
rankp1:                  defb 0
rankp2:                  defb 0

; ===================================================
;  PLAYER ONE / PLAYER TWO DATA
; ---------------------------------------------------
; WE NEED TO KEEP A COPY OF ALL RELEVANT PLAYER DATA SO WE CAN SWITCH BETWEEN PLAYERS


startplayerdata:

lives:                   defb 0

; LEVEL
level:                   defb 0
round:                   defb 0

; SCORE
score:                   defw 0
scorebcd:                defb &00,&00,&00,&00

; BONUSES
extrabonusbcd:           defb &05,&20,&00,&00
currentbonusbcd:         defb &50,&07,&00,&00
; WE NEED TO KEEP RECORD OF CURRENT BONUS AMOUNT AWARDED AT END OF LEVEL IN DECIMAL AS WELL AS BCD FORMAT
; THIS IS FOR CHECKING TO SEE IF WE NEED TO AWARD EXTRA LIVES
currentbonusnormal:      defw 750

extralifebonusmilestone: defw 0
; 0 = SINGLE COLOUR CHANGE  
; 1 = DOUBLE COLOUR
; 2 = TOGGLE SINGLE COLOUR
; 3 = TOGGLE DOUBLE COLOUR REVERT INTERMEDIATE
; 4 = TOGGLE DOUBLE COLOUR REVERT START

cubecolourchangemode:    defb 0 ; THE MODE OF CHANGE WE ARE USING FOR THE LEVEL

lastplayercoordinatesx:  defw 0
lastplayercoordinatesy:  defb 0
lastplayercubex:         defb 0
lastplayercubey:         defb 0


; KEEP RECORD OF WHICH CUBES HAVE BEEN COLOURED IN
; DUE TO GRID ID STARTING AT 1, FIRST BLOCK STARTS AT SECOND BYTE IN LIST
gridproperties           equ &0000 ; ALIGN TO 256 FOR QUICK CHECKING

; COPIES OF PLAYER DATA SO WE CAN SWITCH THEM
; STORE AT UNUSED START OF MEMORY TO SAVE SPACE
playerdata_copy_player1      equ &3F00;&0040
diskpositions_player1        equ playerdata_copy_player1 + 32;&0060 ; KEEP COPY OF DISK POSITIONS SO WE CAN RESTORE IN TWO PLAYER MODE     
playerdata_copy_player2      equ diskpositions_player1   + 16 ;&0070
diskpositions_player2        equ playerdata_copy_player2 + 32;&0090
gridproperties_copy_player1  equ diskpositions_player2   + 16 ;&00A0
gridproperties_copy_player2  equ gridproperties_copy_player1 + 32;&00D0

flashplayerturntext:      defb 1

; FUNCTION TO SWITCH DATA BLOCKS
switchplayer:
  ; ONLY DISPLAY PLAYER TEXT WHEN WE ACTUALLY SWITCH
  ld a,1
  ld (flashplayerturntext),a

  ld hl,startplayerdata
  ld a,(currentplayer)
  cp 1
  jr z,switchplayer2
  
  ; SWITCH TO PLAYER 1
  dec a
  ld (currentplayer),a
  ld de,playerdata_copy_player2
  ld bc,28
  ldir
  ld hl,playerdata_copy_player1
  ld de,startplayerdata
  ld bc,28
  ldir
  ; STORE GRID PROPERTIES PLAYER 2
  ld hl,gridproperties
  ld de,gridproperties_copy_player2
  ld bc,30
  ldir
  ; RESTORE GRID PROPERTIES PLAYER 1
  ld hl,gridproperties_copy_player1
  ld de,gridproperties
  ld bc,30
  ldir
  ; CLEAR EXISTING DISK POSITIONS
  ; STORE DISK POSITIONS PLAYER 2 / RESTORE PLAYER 1 POSITIONS
  jp savediskpositionsplayer2
  
  ; SWITCH TO PLAYER 2
  switchplayer2:
  inc a;ld a,2
  ld (currentplayer),a
  ld de,playerdata_copy_player1
  ld bc,28
  ldir
  ld hl,playerdata_copy_player2
  ld de,startplayerdata
  ld bc,28
  ldir
  ; STORE GRID PROPERTIES PLAYER 1
  ld hl,gridproperties
  ld de,gridproperties_copy_player1
  ld bc,30
  ldir
  ; RESTORE GRID PROPERTIES PLAYER 2
  ld hl,gridproperties_copy_player2
  ld de,gridproperties
  ld bc,30
  ldir
  ; STORE DISK POSITIONS PLAYER 1 / RESTORE PLAYER 2 POSITIONS
  jp savediskpositionsplayer1

; ---------------------------------------------------

cubecolourchangemodetable:
  defb 0,1  ; 1  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 1,2  ; 2  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 2,1  ; 3  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 3,2  ; 4  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 4,2  ; 5  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 0,1  ; 6  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 1,2  ; 7  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 2,1  ; 8  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 3,2  ; 9  - MODE, COLOUR REQUIRED TO COMPLETE LEVEL
  defb 4,2  ; 10 - MODE, COLOUR REQUIRED TO COMPLETE LEVEL  
  
; INCREASE CREDITS AND ENABLE FLASH MENU MESSAGE
insertcoin:
  ld a,(credits)
  inc a
  ld (credits),a
printcredits:
  ld a,(credits)
  ld h,0
  ld l,a
  call convwordtostr
  xor a
  call txt_set_paper
  ld a,1
  call txt_set_pen
  ld h,30-3;-6
  ld l,4
  call my_txt_set_cursor
  ld hl,wordtostr2
  jp printstring_oldnontransp
  
printscoreboardscore:
  ld b,4
  inc hl
  inc hl
  inc hl
  jr doprintscoreboardentry
  
printscore:
ifdef debugcoords
ret
endif
  ld a,(isautoplay) ; ONLY PRINT SCORE IF NOT AUTOPLAY
  or a
  ret nz
  
  xor a
  call txt_set_paper
  ld a,1
  call txt_set_pen
  
  printmyscore:
  ld a,(currentplayer)
  cp 1
  jr z,doprintscoreboardentry_p1
  
  doprintscoreboardentry_p2:
  ld hl,#1801
  call locatetextf
  ld d,h
  ld e,l
  
  ld hl,scorebcd+3
  ld b,4
  xor a
  ld (foundnonzero),a
  printmyscoreloop2:
    ; LOOP THROUGH BCD SCORE AND PRINT FIGURES - SKIP LEADING ZEROES
    ld a,(hl)
	and %11110000
	rrca
	rrca
	rrca
	rrca
	add "0"
	call my_txt_output_skipleadingzero_p2
	ld a,(hl)
	and %00001111
	add "0"
	call my_txt_output_skipleadingzero_p2
	dec hl
  djnz printmyscoreloop2
  ; PRINT ZERO IF NO SCORE FOUND
  ld a,(foundnonzero)
  or a
  ret nz
  dec e
  dec e
  ld a,"0"
  jp writecharplainf

  doprintscoreboardentry_p1:
  ld hl,#0001
  call locatetextf
  ld d,h
  ld e,l
  
  ld hl,scorebcd+3
  ld b,4
  doprintscoreboardentry:
  xor a
  ld (foundnonzero),a
  printmyscoreloop:
    ; LOOP THROUGH BCD SCORE AND PRINT FIGURES
	; SKIP LEADING ZEROES - IGNORE FOR LEFT ALIGN, PRINT SPACE FOR RIGHT ALIGN
    ld a,(hl)
	and %11110000
	rrca
	rrca
	rrca
	rrca
	add "0"
	call my_txt_output_skipleadingzero
	ld a,(hl)
	and %00001111
	add "0"
	call my_txt_output_skipleadingzero
	dec hl
  djnz printmyscoreloop
  
  checkprintscorezero:
  ; PRINT ZERO IF NO SCORE FOUND
  ld a,(foundnonzero)
  or a
  ret nz
  ld a,"0"
  jp writecharplainf
  
doprintbcdinhl:
  ld a,l
  call printbcdinhl
  ld a,h
printbcdinhl:
  ; LOOP THROUGH BCD SCORE AND PRINT FIGURES
  push af
  and %11110000
  rrca
  rrca
  rrca
  rrca
  add "0"
  call my_txt_output
  pop af
  and %00001111
  add "0"
  jp my_txt_output

getbonusesforsparedisks:
  ld a,(disksonscreen-1)
  or a
  ret z
  ld b,a
  getbonusesforsparedisksloop:
    push bc

    ; GET SPRITE ID OF DISK TO HIDE	
	ld a,16
	sub b
	ld b,a
    call hideplussprite
	
	ld bc,50
	call deductextralifepointscounter
	
	ld bc,&0050
	call doaddscorebcd
	pop bc
  djnz getbonusesforsparedisksloop
  xor a
  ld (disksonscreen-1),a
  jp printscore

advanceround:
  call cleargridproperties

  ; PLAY MUSIC
  call enablemusic_levelcomplete

  ; CYCLE CUBE COLOURS
  call enablecubecyclecolour
  
  call addscoreroundcomplete

  ; CHECK FOR END OF SCORE
  checkendofscoreloop:
  ld a,(musicstatus)
  or a
  jr nz,checkendofscoreloop
  
  call disablefirstinterrupt2 ; STOP MUSIC
  call disablethirdinterrupt  ; STOP CYCLING CUBE COLOURS

  ; SET VARIABLE TO REGENERATE DISKS ON NEXT ROUND
  ld a,(istwoplayer)
  or a
  jr z,skipregeneratedisks
  ld a,(currentplayer)
  cp 2
  jr z,setregeneratedisksplayer2
  xor a
  ld (disksgeneratedforroundplayer1),a
  jr skipregeneratedisks
  setregeneratedisksplayer2:
  xor a
  ld (disksgeneratedforroundplayer2),a
  skipregeneratedisks:
  

  call getbonusesforsparedisks
  call clearbonustext
  
  ; KILL ALL ENEMIES
  call killallenemies
 
  xor a
  ld (showlevelscreen-1),a

  ld a,(round)
  inc a
  cp 4
  jr nz,skipadvancelevel
  ld a,1
  ld (showlevelscreen-1),a
  xor a
  ld (round),a
  
  ld a,(level)
  cp 8
  jr z,skipadvancelevel2
  inc a
  ld (level),a
  skipadvancelevel2:
  
  ; CHANGE MODE OF CUBE ACTIVATION FOR NEXT LEVEL
  rlca
  ld hl,cubecolourchangemodetable
  ld b,0
  ld c,a
  add hl,bc
  ld a,(hl)
  ld (cubecolourchangemode),a
  inc hl
  ld a,(hl)
  ld (changecubecolour-1),a 
drawlevelroundtextvalues:
  ld a,(round)
  skipadvancelevel:
  ld (round),a
  ; DRAW LEVEL AND ROUND TEXT
  add 48+1 ; CONVERT TO ASCII AND START FROM 1
  ld (txt_round),a
  ld a,(level)
  add 48+1 ; CONVERT TO ASCII AND START FROM 1
  ld (txt_level),a
  
  ld a,1
  call txt_set_pen
  ld hl,txt_round
  ld de,&8000+64+64+64+64+64+64+64-2+&0800+&0800+&0800
  ld (currenttxtpos),de
  call printstring_oldnontransp
  
  ld hl,txt_level
  ld de,&8000+64+64+64+64+64+64-2+&0800+&0800+&0800
  ld (currenttxtpos),de
  call printstring_oldnontransp
  ld a,0:showlevelscreen
  or a
  ret z
  scf  ; MARKER TO SHOW WE NEED TO SHOW LEVEL SCREEN
ret

drawlivescounter:
  ld a,(lives)
  ; DRAW LEVEL AND ROUND TEXT
  add 48 ; CONVERT TO ASCII
  ld (txt_lives),a
  
  ld a,1
  call txt_set_pen
  ld hl,txt_lives
  ld de,&8000+64+64+64+64+64+8+&0800+&0800+&0800
  ld (currenttxtpos),de
  jp printstring_oldnontransp

; JUMP TABLE FOR MEMORY BELOW ASIC
drawqbertlogo        equ &4000
drawlevellogo        equ drawqbertlogo + 3
drawlevelnumberempty equ drawlevellogo + 3
printlargenumber     equ drawlevelnumberempty + 3
drawlevelroundtext   equ printlargenumber + 3
printlargeletter     equ drawlevelroundtext + 3
printlargeword       equ printlargeletter + 3
drawlivestext        equ printlargeword + 3
printlargestring     equ drawlivestext + 3
printplayertext      equ printlargestring + 3
print1text           equ printplayertext + 3
print2text           equ print1text + 3
printplayer2text     equ print2text + 3

; SPRITE AND LOOKUP TABLES UNDER ASIC
image_qbert_swearword1 equ printplayer2text + 3
image_qbert_swearword2 equ image_qbert_swearword1 + 2
image_qbert_swearword3 equ image_qbert_swearword2 + 2
image_qbert_swearword4 equ image_qbert_swearword3 + 2
image_qbert_swearword5 equ image_qbert_swearword4 + 2
image_qbert_swearword6 equ image_qbert_swearword5 + 2
image_rub equ image_qbert_swearword6 + 2
image_end equ image_rub + 2
image_copyright equ image_end + 2
congratulationsposition equ image_copyright + 2

; DELAY TIMER
; INPUT
; BC = TIME TO DELAY
dodelay:
  ; SET MENU TIMER - DELAY FOR MENU MUSIC TO COMPLETE
  ld hl,(timepleasehl)
  add hl,bc
  ld (menutimerdelay),hl
  
  menumusicloop:
    ; CHECK TIME DELAY FOR DISPLAYING SWEAR
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	ret z
  jr menumusicloop  
  
setnormalhorizontalleap:
  ; NORMAL HORIZONTAL LEAP MOVEMENT
  ld hl,movestdleapdownleft
  ld (leaptype-2),hl
  ld hl,movestdleapdownright
  ld (leaptype2-2),hl
  ld hl,movestdleapupleft
  ld (leaptype3-2),hl
  ld hl,movestdleapupright
  ld (leaptype4-2),hl
ret
  
; SHOW LEVEL SCREEN
drawlevelscreen:
  call disablesecondinterrupt
  call setnormalhorizontalleap
  
  ; RESTRICT INPUT FROM PLAYER
  xor a
  ld (inputcall-1),a
  ld hl,0
  ld (inputfunction-2),hl
 
  call hideallplussprites  
  call killallenemies           ; KILL COILY, ETC, IN CASE PLAYER PRESSED FIRE IN GAME ATTRACT GAME
  call setbgblack               ; SET BG TO BLACK JUST IN CASE QBERT ON DISK WHEN USER PRESSED FIRE

  call doblockcolourlevelscreen
  call disableplayertextfadecolours
  call disablesecondinterrupt

  ; INSTALL PALETTE FLASH FOR LEVEL NUMBER  
  call enableflashlevelscreenpalette
  call enablemusic_newlevel
  call splitscreen_mode1middle
  call enablesplitpalettelevelscreen
  
  ld a,1
  ld (isqbertlevelscreenmovement),a
  ld (playeralive),a            ; MAKE SURE WE CAN MOVE OK
  ; CLEAR MENU MOVEMENT VARIABLE
  xor a
  ld (isqbertmenumovement),a     ; IN CASE QBERT IS IN INSTRUCTIONS WHEN PLAYER PRESSES FIRE
  
  ; RESET MENU ANIMATION COUNTER
  ld (menumovecounter),a
  ld (moveqbertondiskvariable),a ; IN CASE QBERT IS ON A DISK IN GAME ATTRACT WHEN PLAYER PRESSES FIRE
  
  dosetuplevelscreen:
  
  ld hl,txt_setupscreen2
  call printstring
  
  ; IF TWO PLAYER GAME, PRINT CURRENT PLAYER TEXT
  ld a,(istwoplayer)
  or a
  jr z,skipprintplayertext
  ld a,(currentplayer)
  cp 2
  jr z,skipprintoneplayertext
  ld hl,txt_playerone
  jr doprintplayertext
  skipprintoneplayertext:
  ld hl,txt_playertwo
  doprintplayertext:
  call printstring
  skipprintplayertext:
  
  ld a,(round)
  ld b,a
  ld a,(level)
  rlca ; DOUBLE LEVEL TWICE TO GET CORRECT ENTRY IN TABLE
  rlca
  add b
  ; SET PALETTE COLOURS FOR LEVEL / ROUND
  call updatepaletteroundcolours

  ; SET MAIN PALETTE COLOURS FOR SCREEN
  call setpaletteroundcolours
  call setlevellogopalette
  
  ; CLEAR PREVIOUS CUBE PROPERTIES
  call cleargridproperties
  call resetplayerpositiontoppyramid_levelscreen
  call drawlevelscreenpyramid

  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c

  ld de,&8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+8
  call drawlevellogo
  ld de,&8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+28
  call drawlevelnumberempty
  ld de,&8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+28+64+2
  ld a,(level)
  add 49 ; CONVERT ID TO ASCII
  call printlargenumber
  
  ; page-in asic registers to &4000-&7fff
  ld bc,&7fb8
  out (c),c
  
  ; PLAY MUSIC
  ;call enablemusic
  
  ; SET MENU TIMER - DELAY FOR MENU MUSIC TO COMPLETE
  ; CHECK FOR END OF SCORE
  checkendofscoreloop2:
  ld a,(musicstatus)
  or a
  jr nz,checkendofscoreloop2
  
  moveqbertmenu:
  ;call disablemusic
  
  ld ix,spriteid        ; LOAD DATA BLOCK INTO IX
  waitkeypresslooplevelscreen:
    ld a,(mummymovementok)
    or a
    jr nz,skipdomovementsa
    ld a,1
    ld (mummymovementok),a	
  
    ; CHECK TIME DELAY FOR QBERT ANIMATION
    ld a,(menutimer)
	dec a
	ld (menutimer),a
	or a
	call z,doqbertmenumove_levelscreen
	jp c,drawnewlevelclearscreen  ; ANIMATION FINISHED, MOVE TO GAME

    ; LOOP THROUGH ALL SPRITE DATA BLOCKS AND UPDATE MOVEMENTS
    call domovements ; PERFORM MOVEMENTS
	skipdomovementsa:
  jr waitkeypresslooplevelscreen
  
cleargridproperties:
  ld hl,gridproperties
  ld de,gridproperties+1
  ld bc,29
  ld (hl),0
  ldir
ret

disknumbersperroundtable:
  defb 2
  defb 2
  defb 2
  defb 2
  defb 3
  defb 3
  defb 2
  defb 2
  defb 4
  defb 4
  defb 3
  defb 3
  defb 6
  defb 6
  defb 5
  defb 4
  defb 7
  defb 6
  defb 6
  defb 5
  defb 5 ; DEFAULT FOR REST OF GAME

spawndisksforround:
  ld a,(istwoplayer)
  or a
  jr z,dospawndisksforround
  
  ; CHECK TO SEE IF WE NEED TO REGENERATE OR RELOAD DISKS FROM PREVIOUS LIFE
  ld a,(currentplayer)
  cp 1
  jr z,checkspawnorloaddisksplayer1
  
  ld a,(disksgeneratedforroundplayer2)
  or a
  jp nz,restoredisksfromgridtable_player2
  ld a,1
  ld (disksgeneratedforroundplayer2),a
  jp dospawndisksforround
  
  checkspawnorloaddisksplayer1:
  ld a,(disksgeneratedforroundplayer2)
  or a
  jp nz,restoredisksfromgridtable_player1
  ld a,1
  ld (disksgeneratedforroundplayer1),a
  
  dospawndisksforround:
  call cleardisks
  xor a
  ld (disksonscreen-1),a
  ; GET ROUND NUMBER
  ld a,(round)
  ld b,a
  ld a,(level)
  rlca ; DOUBLE LEVEL TWICE TO GET CORRECT ENTRY IN TABLE
  rlca
  add b
  ; IF ROUND MORE THAN 20, DEFAULT 5
  sub 19
  jr nc,skipgetspawnnumberfromtable
  add 19
  
  ; GET NUMBER OF DISKS TO SPAWN FROM TABLE
  ld hl,disknumbersperroundtable
  ld b,0
  ld c,a
  add hl,bc
  ld a,(hl) 
  ld b,a
  jr diskspawnloop
  
  skipgetspawnnumberfromtable:
  ld b,5 ; FIVE DISKS DEFAULT
  diskspawnloop:
	push bc
    ld a,(leftorright)            ; GET RANDOM TILE BASED ON RANDOM R REGISTER
    xor 1
	ld (leftorright),a
	or a
	jr z,dospawndiskleftside
    call spawndiskrightside_randomposition
	continuediskspawnloop:
	pop bc
  djnz diskspawnloop
ret
	dospawndiskleftside:
	call spawndiskleftside_randomposition
	jr continuediskspawnloop

drawnewlevelclearscreen_gameattract:
  ; CLEAR PREVIOUS CUBE PROPERTIES
  call cleargridproperties

  ; NORMAL HORIZONTAL LEAP MOVEMENT
  call setnormalhorizontalleap

  ld a,1
  ld (isscoreboardmenu),a
  
  ; RANDOMLY PICK A DEMO, LEFT OR RIGHT SIDED
  ld a,0:gamedemoleftright
  xor 1
  ld (gamedemoleftright-1),a
  or a
  jr z,doleftsidedemo
  ld hl,movementgameattractmode
  jr continuedogameattractmovement
  doleftsidedemo:
  ld hl,movementgameattractmode2
  continuedogameattractmovement:
  ld (gamedemotype-2),hl
  
  ; MODE SPLIT, BUT NOT PLAYER TEXT AT TOP
  call splitscreen_mode1top_autoplay
  
  ; SET MENU TIMER
  ld hl,(timepleasehl)
  ld bc,6000
  add hl,bc
  ld (menutimerdelay),hl
  
  ; MAKE SURE WE GO TO START OF QBERT MOVEMENT BLOCK IN GAME ATTRACT MODE
  xor a
  ld (menumovecounter),a
  ; SET GAME ATTRACT MODE
  ld a,1
  ; SET INPUT TO AUTO
  ld bc,checkplayernpcinput_gameattract
  jr continuedrawnewlevelclearscreen
 
; START ACTUAL LEVEL
drawnewlevelclearscreen: 
  ; CLEAR PREVIOUS CUBE PROPERTIES              ; ONLY CLEAR GRID IF STARTING NEW ROUND - CONFLICTS WITH TWO PLAYER
  call cleargridproperties
  
  ; CLEAR DISKS
  ;call cleardisks
  
  
  ;ld a,(istwoplayer)
  ;or a
  ;jr z,drawnewlevelclearscreen_nocleargridproperties
  
  ; MAKE SURE PLAYERS HAVE COPIES OF NEWLY CREATED DISK POSITIONS
  ;ld a,(currentplayer)
  ;cp 1
  ;call z,savediskpositionsplayer1
  ;cp 2
  ;call z,savediskpositionsplayer2
  
drawnewlevelclearscreen_nocleargridproperties:  ; TWO PLAYER SWITCH STARTS HERE


  ; NORMAL HORIZONTAL LEAP MOVEMENT
  call setnormalhorizontalleap

  call disablemusic

  ; HIDE QBERT
  call hideallplussprites
  
  call splitscreen_mode1top_player
  ; CANCEL GAME ATTRACT MODE
  xor a
  ; SET INPUT TO PLAYER
  ld bc,checkplayernpcinput
  
  continuedrawnewlevelclearscreen:
  ld (isautoplay),a
  ld a,&cd ; CALL
  ld (inputcall-1),a
  ld (inputfunction-2),bc

  call disablesecondinterrupt
  call doblockcolournormal
  call disablesplitpalettelevelscreen

  call enableplayertextfadecolours  ; ENABLE FADING OF PLAYER TEXT
  
  ; WE MAY NEED TO CLEAR SCREEN IN TWO PLAYER IF PREVIOUS PLAYER ENTERED HIGH SCORE
  ld hl,txt_setupscreen2
  call printstring
  
  continuedrawnewlevelclearscreen2:
  
  ; DRAW CORRECT HEADER FOR DISPLAY
  ld a,(isautoplay)
  cp 1
  jr z,dodrawheaderautoplay
  call drawheader_game
  jr drawnewlevel
  dodrawheaderautoplay:
  call drawheader_autoplay
  drawnewlevel: 

  call enablecyclediskpalette
  
  ; RESET SPRITE VARIABLES
  xor a
  ld (interruptcounterspawnenemies),a ; RESET TIMER, JUST INCASE ENEMY SPAWNS BEFORE PLAYER HAS CHANCE TO START
  ld (coilyalive-1),a

  ld a,(round)
  ld b,a
  ld a,(level)
  rlca ; DOUBLE LEVEL TWICE TO GET CORRECT ENTRY IN TABLE
  rlca
  add b
  ; SET PALETTE COLOURS FOR LEVEL / ROUND
  call updatepaletteroundcolours
  ; SET MAIN PALETTE COLOURS FOR SCREEN
  call setpaletteroundcolours

  ; DRAW PYRAMID
  ld de,gridproperties
  call drawpyramid
  ; DRAW MINI CUBE WITH COLOUR BASED ON CUBE TOGGLE DYNAMICS
  ld a,(cubecolourchangemode)
  or a
  jr z,dosinglecolourminiqube
  cp 2
  jr z,dosinglecolourminiqube
  ld a,2
  jr dodrawminiqube
  dosinglecolourminiqube:
  ld a,1
  dodrawminiqube:
  call drawminiqube
 
  ; DRAW DISKS
  ; SPAWN NEW DISKS IF NOT ALREADY GENERATED FOR ROUND
  call spawndisksforround
  call drawdisksfromgrid
  
drawlevelnoclearscreentoppyramid:
  call resetplayerpositiontoppyramid_nodropstart

  ; SET CURRENT CUBE ID
  ld a,1
  ld (playerqubelocx),a
  ld (playerqubelocy),a
drawlevelnoclearscreen:
  ; CLEAR MENU MOVEMENT VARIABLE
  xor a
  ld (isqbertmenumovement),a  
  ld (isqbertlevelscreenmovement),a
  
  ld a,1
  ld (playeralive),a
  
  ; STORE CURRENT PLAYER COORDINATES, SO IF WE DIE IN A COLLISION, THESE CAN BE RESTORED
  ld hl,(currplayerposxyhires)
  ld (lastplayercoordinatesx),hl
  ld a,(currplayerposy)
  ld (lastplayercoordinatesy),a
  ld a,(playerqubelocx)
  ld (lastplayercubex),a
  ld a,(playerqubelocy)
  ld (lastplayercubey),a
    
  ld a,(istwoplayer)
  or a
  jr z,skipprintplayernumber
    
  ; PRINT PLAYER'S TURN
  ld a,(flashplayerturntext)  ; ONLY SHOW WHEN WE SWITCH PLAYERS
  or a
  jr z,skipprintplayernumber
  
  ld a,(currentplayer)
  cp 2
  jr z,showplayer2turn
  call displayplayer1turn
  jr skipprintplayernumber
  showplayer2turn:
  call displayplayer2turn
  skipprintplayernumber:
  
  call enablechangetocycleinterrupt
  
  ; WAIT FOR USER TO PRESS A KEY TO CONTINUE
  waitkeypressloop2:
    ; MENU TIMER FOR GAME ATTRACT MODE
	; CHECK TIME DELAY FOR DISPLAYING INSTRUCTIONS
	ld a,(isautoplay)
	or a
	jr z,skipautoplaytimer
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	jp z,doshowscoreboardgameattract
	
    ; INSERT COIN
    call testkeyup
    jr nz,skipinsertcoin3
	; ONLY INSERT COIN ONCE, NO KEY REPEAT
	ld a,(insertcoinpressed)
	or a
	jr nz,skipinsertcoin3
	ld a,1
	ld (insertcoinpressed),a
    call insertcoin
	skipinsertcoin3:
	call km_check_keyrelease
	jr nc,p1_notpressedup2b
	; INSERT COIN KEY HAS BEEN RELEASED
    xor a
    ld (insertcoinpressed),a
    p1_notpressedup2b:
	
	skipautoplaytimer:
	

	
	;call km_check_keyrelease
    ;jr nc,waitpauserelease
	;;jp nz,skipautoplaytimer;'activatepause
	;xor a
	;ld (ispaused-1),a
	
	skippausebuttoncheck:
	
    ld a,(mummymovementok)
    or a
    jr nz,skipdomovements2
    ld a,1
    ld (mummymovementok),a	
	
	; DON'T SPAWN OR MOVE ENEMIES IF WE HAVE GREEN BALL POWER
	ld a,(greenballtimer-1)  
	or a
	jr z,normalenemyspawnmovement
	; DECREMENT GREEN BALL TIMER
	dectimer_skipspawnmoveenemies:
	dec a
	or a
	jr nz,skipresetcolourbackground
	call disablezerotinterrupt
	call setbgblack             ; RESET COLOURS
	skipresetcolourbackground:
	ld (greenballtimer-1),a
	jr skipspawnmoveenemies
	
	; SPAWN ENEMIES BASED ON TIMER
	normalenemyspawnmovement:
	ld a,(interruptcounterspawnenemies)
	cp 140
	jr nz,skipspawnenemies
	xor a
	ld (interruptcounterspawnenemies),a
	
	call spawnenemytypebyround ; GET NUMBER IN A OF ENEMY TO SPAWN BASED ON ROUND
    ld d,a
	call spawnenemy

	skipspawnenemies:
	ld a,(interruptcounterspawnenemies)
	inc a
	ld (interruptcounterspawnenemies),a
	skipspawnenemies2:
	
    ; LOOP THROUGH ALL SPRITE DATA BLOCKS AND UPDATE MOVEMENTS
    ld ix,aspriteid   ; LOAD DATA BLOCK INTO IX
    call domovements  ; PERFORM MOVEMENTS
    ld ix,a2spriteid  ; LOAD DATA BLOCK INTO IX
    call domovements  ; PERFORM MOVEMENTS
    ld ix,a3spriteid  ; LOAD DATA BLOCK INTO IX
    call domovements  ; PERFORM MOVEMENTS
    ld ix,a4spriteid  ; LOAD DATA BLOCK INTO IX
    call domovements  ; PERFORM MOVEMENTS
	
	skipspawnmoveenemies:
    ld ix,spriteid    ; LOAD DATA BLOCK INTO IX
    call domovements  ; PERFORM MOVEMENTS
   	
    skipdomovements2:
  jp waitkeypressloop2

doshowscoreboardgameattract:
  call killallenemies
  jp showscoreboard
  
; -------------------------------------------------
; GAME MOVEMENT LOOPS
; -------------------------------------------------  

;makeleapsound:
;  dec a
;  ld (ix+ix_movedelay),a
;  call dojumpnoiseredball
;  ret

; INPUT
; IX = SPRITE DATA BLOCK
domovements:
  ; CHECK IF PLAYER OR NPC ACTIVE FIRST
  ld a,(ix+ix_playeralive)   
  or a
  ret z
  
  ; DECREMENT DELAY FOR NPCS, AND ONLY MOVE WHEN IT REACHES ZERO
  ld a,(ix+ix_movedelay) 
  ; MAKE LEAP SOUND BEFORE WE ACTUALLY START JUMP, SO IT SOUNDS WHEN WE ARE LEAPING
  ;cp 1
  ;jr z,makeleapsound  
  or a
  jr z,skipdecrementmovedelay
  dec a
  ld (ix+ix_movedelay),a
  ret  
  skipdecrementmovedelay:
  
  ; IF WE ARE ALREADY JUMPING DON'T DO ANYTHING - BUT WE MAY NEED TO UPDATE SPRITE (COILY HEAD)
  ld a,(ix+ix_isjumpingdir) 
  or a
  jr nz,skipgetinput
  
  defb 0:inputcall         
  defw 0:inputfunction        ; CHECK IF PLAYER OR NPC HAS PRESSED DIRECTION
  call domovements_individual ; CALCULATE MOVEMENTS FOR SPRITE
  
  skipgetinput:
  jp moveplayersprite         ; MOVE SPRITE
  
; INPUT
; IX = SPRITE DATA BLOCK
domovements_scoreboard:
  ; DECREMENT DELAY FOR NPCS, AND ONLY MOVE WHEN IT REACHES ZERO
  ld a,(ix+ix_movedelay) 
  or a
  jr z,skipdecrementmovedelay2
  dec a
  ld (ix+ix_movedelay),a
  ret  
  skipdecrementmovedelay2:
  
  ; IF WE ARE ALREADY JUMPING DON'T DO ANYTHING - BUT WE MAY NEED TO UPDATE SPRITE (COILY HEAD)
  ld a,(ix+ix_isjumpingdir) 
  or a
  jr nz,skipgetinput2
  
  call domovements_individual_scoreboard ; CALCULATE MOVEMENTS FOR SPRITE
  
  skipgetinput2:
  jp moveplayersprite         ; MOVE SPRITE

; -------------------------------------------------
; PLAYER SPAWN AND MOVEMENTS
; -------------------------------------------------  

resetplayerpositiontoppyramid_nodropstart:
  ld ix,spriteid ; MAKE SURE PLAYER SPRITE HAS BEEN SELECTED
  ld (ix+ix_dropstart),0
  ld a,64-8
  jr continueresetplayerpositiontoppyramid
resetplayerpositiontoppyramid:
  ld ix,spriteid ; MAKE SURE PLAYER SPRITE HAS BEEN SELECTED
  ld (ix+ix_dropstart),1
  ld a,64-8-24-24-4
  continueresetplayerpositiontoppyramid:
  ld bc,256-16 ; CENTRE ON SCREEN 
  ld (lastplayercoordinatesx),bc ; RECORD POSITION IN CASE WE GET KILLED HERE
  ld (lastplayercoordinatesy),a

  ; RESET CURRENT CUBE ID TO TOP CUBE 
  ld (ix+ix_playerqubelocy),1
  ld (ix+ix_playerqubelocx),0
  ld (ix+ix_currplayercube),1
  ld (ix+ix_destplayercube),1  
  
; INPUTS
; BC = X POS
; A  = Y POS
doresetplayerposition:
  ld (currplayerposxyhires),bc
  ld (currplayerposy),a
  call resetplayermomentum
  ld hl,(playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawflipimage2_compressed ; ALWAYS FACE DOWN LEFT AT START

  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld hl,(currplayerposxyhires)
  ld a,(currplayerposy)

  
  ;call debugprinthl
  ;call debugprinta2num
  
  
  ld b,a
  xor a ; SPRITE ID TO MOVE
  ld (isjumpingdir),a ; MAKE SURE WE AREN'T STILL JUMPING
jp moveplussprite2

resetplayerpositiontoppyramid_levelscreen:
  call resetplayermomentum
  ld hl,(playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawflipimage2_compressed ; ALWAYS FACE DOWN LEFT AT START

  ; RESET CURRENT CUBE ID TO TOP CUBE 
  xor a
  ld (isjumpingdir),a ; MAKE SURE WE AREN'T STILL JUMPING FROM SHOWING INSTRUCTIONS SCREEN
  ld a,1
  ld (playerqubelocy),a
  ld (playerqubelocx),a
  ld (currplayercube),a
  
  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld b,64-8-16-16-8    ; TOP BLOCK
  ld hl,256-16         ; CENTRE ON SCREEN 
  ld (currplayerposxyhires),hl
  ld a,b
  ld (currplayerposy),a
  
  xor a ; SPRITE ID TO MOVE
jp moveplussprite2

resetplayerpositiontoppyramid_scoreboardentry:
  ld hl,movescoreboardleapdownleft
  ld (leaptype-2),hl
  ld hl,movescoreboardleapdownright
  ld (leaptype2-2),hl
  ld hl,movescoreboardleapupleft
  ld (leaptype3-2),hl
  ld hl,movescoreboardleapupright
  ld (leaptype4-2),hl
  
  call resetplayermomentum

  ; RESET CURRENT CUBE ID TO TOP LEFT LETTER 
  xor a
  ld (playerqubelocy),a
  ld (playerqubelocx),a
  ld (currplayercube),a
  ld (isjumpingdir),a   ; MAKE SURE WE AREN'T STILL JUMPING FROM GAME
  
  ; SET NPC TO POINTER SPRITE SO WE KNOW TO DISPLAY UNDERSCORE WHEN LANDING ON LETTER
  ld a,10
  ld (npctype),a
  
  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld b,124-16+4-1;-8-16-16-8    ; TOP BLOCK
  ld hl,64-8;256-16         ; CENTRE ON SCREEN 
  ld (currplayerposxyhires),hl
  ld a,b
  ld (currplayerposy),a
  
  xor a ; SPRITE ID TO MOVE
jp moveplussprite2
  
; -------------------------------------------------
; NPC SPAWN AND MOVEMENTS - UGG AND WRONG WAY
; -------------------------------------------------  
  
; UGG MOVEMENT
; NORMAL JUMP UP RIGHT - 16 ACROSS, 24 UP
; SIDEWAYS JUMP - 32 PIXELS ACROSS, 0 VERTICAL BUT BOUNCE DOWNWARDS
  
; INPUT
; IX = SPRITE BLOCK
resetnpcpositiontoppyramid_rightside_ugg:
  ld (ix+ix_dropstart),0
  call resetplayermomentum
  ; DRAW SPRITE IMAGE TO ASIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawnormalimage2_compressed

  ; RESET CURRENT CUBE ID TO BOTTOM RIGHT CUBE
  ld (ix+ix_playerqubelocy),1
  ld (ix+ix_playerqubelocx),7
  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),28

  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld hl,32*14+8+4+4;320;256-16-32;320-16
  finishspawnnpcpositiontoppyramid_ugg:
  ld (ix+ix_currplayerposxyhires),hl
  ld (ix+ix_currplayercube),0
  ld (ix+ix_playermovedirection),4 ; MAKE SURE WE HAVE DIRECTION FOR LANDING SPRITE TO DRAW
  ld (ix+ix_currplayerposy),28*8;16-;64-8-24-24-4+24    ; 2ND ROW LEFT SIDE
  ld a,(ix+ix_spriteid) ; SPRITE ID TO MOVE
jp moveplussprite2

; INPUT
; IX = SPRITE BLOCK
resetnpcpositiontoppyramid_leftside_wrongway:
  ld (ix+ix_dropstart),0
  call resetplayermomentum
  ; DRAW SPRITE IMAGE TO ASIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawnormalimage2_compressed

  ; RESET CURRENT CUBE ID TO BOTTOM LEFT CUBE
  ld (ix+ix_playerqubelocy),7
  ld (ix+ix_playerqubelocx),1
  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),22

  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld hl,16;320;256-16-32;320-16
  jr finishspawnnpcpositiontoppyramid_ugg
  
; -------------------------------------------------
; NPC SPAWN AND MOVEMENTS
; -------------------------------------------------  
  
; INPUT
; IX = SPRITE BLOCK
resetnpcpositiontoppyramid_leftside:
  ld (ix+ix_dropstart),1
  call resetplayermomentum
  ; DRAW SPRITE IMAGE TO ASIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawflipimage2_compressed ; ALWAYS FACE DOWN LEFT AT START

  ; RESET CURRENT CUBE ID TO TOP CUBE 
  ld (ix+ix_playerqubelocy),2
  ld (ix+ix_playerqubelocx),1
  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),2

  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld hl,256-16-32;320-16
  jr finishspawnnpcpositiontoppyramid

resetnpcpositiontoppyramid_rightside:
  ld (ix+ix_dropstart),1
  call resetplayermomentum
  ; DRAW SPRITE IMAGE TO ASIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawflipimage2_compressed ; ALWAYS FACE DOWN LEFT AT START

  ; RESET CURRENT CUBE ID TO TOP CUBE 
  ld (ix+ix_playerqubelocy),1
  ld (ix+ix_playerqubelocx),2
  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),3

  ; MOVE SPRITE TO NEW POSITION
  ; HL = Y X POSITION
  ld hl,256-16+32
  finishspawnnpcpositiontoppyramid:
  ld (ix+ix_currplayerposxyhires),hl
  ld (ix+ix_currplayercube),0
  ld (ix+ix_playermovedirection),4 ; MAKE SURE WE HAVE DIRECTION FOR LANDING SPRITE TO DRAW
  ld (ix+ix_currplayerposy),64-8-24-24-4+24    ; 2ND ROW LEFT SIDE
  ld a,(ix+ix_spriteid) ; SPRITE ID TO MOVE
jp moveplussprite2
  
; MOVEMENT TYPE
enemymovementtable:
  defw movement_redball
  defw movement_coilyegg
  defw movement_coilysnake
  defw movement_redball    ; GREEN BALL
  defw movement_redball    ; SLICK
  defw movement_redball    ; SAM
  defw movement_ugg
  defw movement_wrongway
  
; SAME AS BELOW, ONLY USE PREDEFINED DIRECTIONS FOR PLAYER - GAME ATTRACT MODE
checkplayernpcinput_gameattract:
  ld a,(ix+ix_npctype)
  or a  ; PLAYER
  jp z,doqbertmenumove_gameattract
  jr continuecheckplayernpcinput
; CALL MOVEMENT FUNCTION BASED ON SPRITE ID
checkplayernpcinput:
  ld a,(ix+ix_npctype)
  or a  ; PLAYER
  jr z,checkplayerinput
  continuecheckplayernpcinput:
  ld hl,enemymovementtable
  dec a
  jp vectortablelaunchcode

checkplayerinput:
  ld a,(moveqbertondiskvariable)
  or a
  jp nz,moveqbertondisk

  ld a,(playermovedirection)
  or a                       ; ONLY RECORD DIRECTION IF NOT ALREADY SET
  ret nz
 
  call testkeyup
  jr nz,p1_notpressedup
  ld a,1
  jr recordpresseddirection
  p1_notpressedup:
  
  call testkeydown
  jr nz,p1_notpresseddown
  ld a,4
  jr recordpresseddirection
  p1_notpresseddown:
  
  call testkeyleft
  jr nz,p1_notpressedleft
  ld a,2
  jr recordpresseddirection
  p1_notpressedleft:

  call testkeyright
  jr nz,p1_notpressedright
  ld a,3
  jr recordpresseddirection
  p1_notpressedright:
  
  call testkeypause
  jr nz,p1_notpressedpause
  ld a,11
  jr recordpresseddirection
  p1_notpressedpause:
  
  ; CHEAT MODE - R
  call testkeyleft2
  jr nz,p1_notpressedr
  ld a,10
  jr recordpresseddirection
  p1_notpressedr:
  
  call testkeyfire
  jr nz,p1_notpressedfire1
  ld a,5
  jr recordpresseddirection
  p1_notpressedfire1:
  
  call testkeyfire2
  ret nz
  ld a,5
  
recordpresseddirection:
  ld (playermovedirection),a    
ret

; CREATE RANDOM DIRECTION DOWNARDS FOR RED BALL UNTIL WE FALL OFF SCREEN
; SO EITHER DOWN (FOR LEFT) OR RIGHT TAKES US OFF EDGE
;movement_redball2:
;  call dojumpnoiseredball ; MAKE A NOISE FOR BALL JUMPING OFF CUBE
movement_redball:
  ld a,2
  call getrandomnumber
  or a
  jr z,npcmoveddown
  ld a,3
  jr setmpcmovedirection
  ; NPC MOVED RIGHT
  npcmoveddown:
  ld a,4
  setmpcmovedirection:
  ld (ix+ix_playermovedirection),a  
ret

; MOVE UP RIGHT OR RIGHT FOR WRONGWAY
movement_wrongway:
  ld a,2
  call getrandomnumber
  or a
  jr z,npcmoveddown3
  ld a,8
  jr setmpcmovedirection
  ; NPC MOVED RIGHT
  npcmoveddown3:
  ld a,9
  jr setmpcmovedirection

; MOVE UP LEFT OR LEFT FOR UGG
movement_ugg:
  ld a,2
  call getrandomnumber
  or a
  jr z,npcmoveddown2
  ld a,6
  jr setmpcmovedirection
  ; NPC MOVED RIGHT
  npcmoveddown2:
  ld a,7
  jr setmpcmovedirection
  
; CREATE RANDOM DIRECTION DOWNARDS FOR RED BALL UNTIL WE FALL OFF SCREEN
; SO EITHER DOWN (FOR LEFT) OR RIGHT TAKES US OFF EDGE
movement_coilyegg:
  ld a,2
  call getrandomnumber
  or a
  jr z,npcmoveddownb
  ld a,3
  jr setcoilymovedirection
  ; NPC MOVED RIGHT
  npcmoveddownb:
  ld a,4
  setcoilymovedirection:
  ld (ix+ix_playermovedirection),a

  ; COILY STOP AT BOTTOM!
  ld a,0:coilyeggmovecounter
  cp 6
  ret nz
  ; CHANGE NPC TYPE
  ld (ix+ix_npctype),3    ; CHANGE TO COILY SNAKE NPC SO WE CAN SEEK PLAYER POSTION
  jp resetplayermomentum  ; STOP ALL MOVEMENTS SO EGG STOPS AT END OF SCREEN
  
; MOVE TOWARDS PLAYER
movement_coilysnake:
  ; CHANGE COILY EGG TO COILY SNAKE AFTER TIMER EXPIRES
  ld a,0:coilyegghatchtimer
  cp 101 ; CHECK IF WE ARE IN SEEK PLAYER MODE
  jr z,movement_coilysnake_seekplayer
  inc a
  ld (coilyegghatchtimer-1),a
  cp 100 ; TIMER HAS EXPIRED TO HATCH COILY
  ret nz
  ; RESET MOVE COUNTER
  xor a
  ld (coilyeggmovecounter-1),a
  ; SET COILY TO SEEK PLAYER
  ld a,101
  ld (coilyegghatchtimer-1),a
  ; CHANGE TO SNAKE
  ; NEED TO UPDATE SPRITE POINTERS FOR SNAKE IMAGES
  ld d,(ix+ix_npctype)
  call copyspriteptrsbynpcid  

  ld hl,(ix+ix_playerspriteids+2)
  ld a,(ix+ix_spriteid)           ; NUMBER OF SPRITE TO UPDATE
  jp dodrawflipimage2_compressed  ; ALWAYS FACE DOWN LEFT AT START
 
; MOVE COILY TOWARDS CUBE PLAYER CURRENTLY OCCUPIES
movement_coilysnake_seekplayer:
  call dojumpnoisecoily

  ; GET DESTINATION CUBE
  ld bc,(playerqubelocy)
  ; GET CURRENT CUBE
  ld d,(ix+ix_playerqubelocx)
  ld e,(ix+ix_playerqubelocy)
 
  ; SEE IF WE ARE ON LAST ROW 
  ; ADD X AND Y CUBE LOCATION TOGETHER TO GET COMPLETE ROW NUMBER
  ; THIS HAS TO BE DONE AS GRID IS ROTATED 45 DEGREES SO EACH SUBSEQUENT ROW HAS ONE LESS CUBE HORIZONTALLY
  ld a,d
  add e
  ld (rownum-1),a
  
  ; DIRECTION
  ; 1 = UP RIGHT
  ; 2 = UP LEFT
  ; 3 = DOWN RIGHT
  ; 4 = DOWN LEFT
  
  call getdirectionfromcoords
  ld (ix+ix_playermovedirection),a 
  
  ; ARE WE ON LAST ROW
  ld a,0:rownum
  cp 8 
  ret nz
  ; WILL JUMP BE OFF SCREEN?
  ld a,(ix+ix_playermovedirection)
  cp 1 ; NO WE ARE JUMPING UP RIGHT
  ret z
  cp 2 ; JUMP UP LEFT
  ret z
  ; JUMP UP INSTEAD
  sub 2
  ld (ix+ix_playermovedirection),a
  ; CHECK IF THIS RESULTS IN A CUBE THAT WE CAN LAND ON
  ; DON'T LET COILY JUMP OFF BOTTOM OF SCREEN  
ret

; WORK OUT DIRECTION OF TRAVEL FROM TWO SETS OF COORDINATES

; INPUTS
; B = CURR X COORD
; C = CURR Y COORD
; D = DEST X COORD
; E = DEST Y COORD
; OUTPUTS
; A = DIRECTION, 1 = NORTH, 2 = NE
; REACHED DESTINATION
; A = 0

; DIRECTION TABLE
; X DIRECTIONS
; 8 1 2
; 7 0 3
; 6 5 4

updir:   defb 4,4,2
middir:  defb 3,0,2
downdir: defb 3,1,1

getdirectionfromcoords:
  ld a,e
  sbc c
  jr c,setup
  or a 
  jr z,setmid

  setdown:
    ld hl,downdir+1
    jr gethdir
  setup:
    ld hl,updir+1
    jr gethdir
  setmid:
    ld hl,middir+1

  gethdir:
    ld a,d
    sbc b
    jr c,setleft
    or a
    jr z,setdir

    setright:
    inc hl
    jr setdir
    setleft:
    dec hl
    setdir:
    ld a,(hl)
    ret

; BLOCK IDS
;        01
;       02,03
;      04,05,06
;     07,08,09,10
;   11,12,13,14,15
;  16,17,18,19,20,21
; 22,23,24,25,26,27,28

; SCOREBOARD LOOKUP GRID
; USES PIXEL POSITION OF GREEN BALL TO WORK OUT WHERE WE ARE IN THE GRID
; CALLED WHEN USER PRESSES FIRE TO INSERT CHARACTER

gridlookupscoreboard2:
  defb "ABCDEF"
  defb "GHIJKL"
  defb "MNOPQR"
  defb "STUVWX"
  defb "YZ .",1,2
 
gridrow: defb 0
getqubefromgridscoreboard:
  ld b,0
  ld a,(ix+ix_currplayerposy)
  cp 112-1
  jr z,keypadrow_odd
  inc b
  cp 128-1
  jr z,keypadrow
  inc b
  cp 144-1
  jr z,keypadrow_odd
  inc b
  cp 160-1
  jr z,keypadrow
  inc b
  cp 176-1
  jr z,keypadrow_odd
  ld a," "
ret
keypadrow_odd:
  ld a,b
  ld d,0
  ld (gridrow),a
  
  ld hl,(ix+ix_currplayerposxyhires)
  ld bc,56
  sbc hl,bc
  jr z,foundgrid
  inc d
  ld bc,64
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  ld a," "
ret
keypadrow:
  ld a,b
  ld (gridrow),a
  ld d,0
  
  ld hl,(ix+ix_currplayerposxyhires)
  ld bc,56+32
  sbc hl,bc
  jr z,foundgrid
  inc d
  ld bc,64
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  inc d
  sbc hl,bc
  jr z,foundgrid
  ld a," "
ret
foundgrid:
  ld hl,gridlookupscoreboard2

  ld a,(gridrow)
  or a
  jr z,skiprowfind
  
  ld b,a
  getgridloop:
    push bc
	ld bc,6
	add hl,bc
	pop bc
  djnz getgridloop
  
  skiprowfind:
  ld b,0
  ld c,d
  add hl,bc
  ld a,(hl)
ret

getqubefromgrid:
  ld hl,gridlookup       ; HORIZONTAL LOOKUP
  dogetqubefromgrid:
  ld c,(ix+ix_playerqubelocx)  
  ld b,0
  ld a,(ix+ix_playerqubelocy)  ; VERTICAL
  or a                   ; CHECK IF WE JUMPED OFF TOP OF SCREEN
  jr z,skipgetverticalloc
  ld b,a
  xor a
  getqubefromgridvertloop:
    add 9
  djnz getqubefromgridvertloop
  add c
  ld c,a
  skipgetverticalloc:
  add hl,bc
  ld a,(hl)
ret
; CLEAR CUBE ID FROM MAP - USED FOR DISKS
; OUTPUT
; A = DISK OBJECT ID
clearqubeidfromgrid:
  call getqubefromgrid
  ld (hl),0              ; ERASE IT
ret

diskcoordinatetableleftside:
  ;defb 160-8
  ;defb 20 ; TOP MIDDLE
  defb 64-4-4-4-4-4
  defb 48-16+32+16-8 ; LEFT 0
  
  defb 64-4-4-4-4-4-4-4
  defb 48+16-8+32+16-8 ; LEFT 1
  
  defb 64-4-4-4-4-4-4-4-4-4
  defb 48+16+16+32+16-8 ; LEFT 2
  
  defb 64-4-4-4-4-4-4-4-4-4-4-4
  defb 48+16+16+16+16-8+32+16-8 ; LEFT 3
  
  defb 64-4-4-4-4-4-4-4-4-4-4-4-4-4
  defb 48+16+16+16+16+16+32+16-8 ; LEFT 4
  
  defb 64-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4
  defb 48+16+16+16+16+16+16+8+32+16-8 ; LEFT 5
  
diskcoordinatetablerightside:
  ;defb 160-8
  ;defb 20 ; TOP MIDDLE
  defb 64+4+4+4
  defb 48-16+32+16-8 ; RIGHT 0
  
  defb 64+4+4+4+4+4
  defb 48+16-8+32+16-8 ; RIGHT 1
  
  defb 64+4+4+4+4+4+4+4
  defb 48+16+16+32+16-8 ; RIGHT 2
  
  defb 64+4+4+4+4+4+4+4+4+4
  defb 48+16+16+16+16-8+32+16-8 ; RIGHT 3
  
  defb 64+4+4+4+4+4+4+4+4+4+4+4
  defb 48+16+16+16+16+16+32+16-8 ; RIGHT 4
  
  defb 64+4+4+4+4+4+4+4+4+4+4+4+4+4
  defb 48+16+16+16+16+16+16+8+32+16-8 ; RIGHT 5

diskstableleftside:
  defw diskleft1
  defw diskleft2
  defw diskleft3
  defw diskleft4
  defw diskleft5
  defw diskleft6

leftorright: defb 0

; LOOP THROUGH GENERATED DISK IDs ON GRID TABLE TO DISPLAY DISKS

drawdisksfromgrid:
  ld hl,gridlookup+7
  ; RIGHT SIDE
  ld b,5
  drawdisksloopright:
    ld a,(hl)
	or a
	jr z,skipdrawdiskright
	
	push hl
	push bc
	call setspawneddiskstartposrightside
	pop bc
	pop hl
	
	skipdrawdiskright:
    dec hl
  djnz drawdisksloopright
  ; LEFT SIDE
  ld hl,diskleft6
  ld b,5
  drawdisksloopleft:
  	push bc
	
    ld a,(hl)
	or a
	jr z,skipdrawdiskleft
	
	push hl
	call setspawneddiskstartposleftside
	pop hl

	skipdrawdiskleft:
    ld bc,9
	sbc hl,bc
	pop bc
  djnz drawdisksloopleft
ret

; MOVE DISK SPRITE
; INPUT
; A = SPRITE ID + (40 RIGHT OR 30 LEFT)
; B = DISK POSITION
setspawneddiskstartposrightside:
  ld hl,diskcoordinatetablerightside
  sub 40
  jr setspawneddiskstartpos
setspawneddiskstartposleftside:
  ld hl,diskcoordinatetableleftside
  sub 30
  setspawneddiskstartpos:
  ld c,b
  ld b,0
  add hl,bc
  add hl,bc

  ; GET COORDINATE ON SCREEN
  push af
  ld a,(hl) ; X POS
  inc hl
  ld h,(hl) ; Y POS
  ld l,a
  pop af
  
  ; GET SPRITE ID FOR NEW DISK
  ld b,a
  ld a,16 ; SPAWN DISKS AS LAST SPRITES IN LIST SO ENEMIES APPEAR ON TOP OF THEM
  sub b  
  
  ; COPY SPRITE IMAGE TO ASIC
  push af
  push hl
  push bc
  ld hl,(image_disk)
  call drawnormalimage_fixedid_compressed
  pop bc
  pop hl
  pop af

  jp moveplussprite2orig  

; ====================================================
;  INSERT DISK IDS IN GRID TABLE BASED ON POSITION
; ----------------------------------------------------

; TRY DEFAULT POSITION 3
; AFTER THAT, RANDOM
spawndiskleftside_randomposition:
  ld c,3
  retryspawndiskleftsidesetposition:
  ; CHECK IF PLACE 4 IS OCCUPIED
  ld hl,diskstableleftside
  ld b,0
  add hl,bc ; DOUBLE FOR LOOKUP
  add hl,bc
  
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a

  ld a,(hl)  
  or a ; LOCATION NOT YET IN USE
  jr z,dospawndiskleftsidesetposition
  
  ; RETRY WITH A RANDOM NUMBER BETWEEN 0 AND 5
  ld a,6
  call getrandomnumber
  ld c,a
  jr retryspawndiskleftsidesetposition
  
  dospawndiskleftsidesetposition:
  ld a,c
  jp spawndiskleftside

; DEFAULT POSITION 3
; AFTER THAT, RANDOM
spawndiskrightside_randomposition:
  ld c,3
  retryspawndiskrightsidesetposition:
  ; CHECK IF PLACE 4 IS OCCUPIED
  ld hl,gridlookup+2
  ld b,0
  add hl,bc
  ld a,(hl)
  or a ; LOCATION NOT YET IN USE
  jr z,dospawndiskrightsidesetposition
  
  ; RETRY WITH A RANDOM NUMBER BETWEEN 0 AND 5
  ld a,6
  call getrandomnumber
  ld c,a
  jr retryspawndiskrightsidesetposition
  
  dospawndiskrightsidesetposition:
  ld a,c  
  jp spawndiskrightside

; INPUT
; A = DISK POSITION 0 TO 5
spawndiskleftside:
  ld hl,diskstableleftside
  rlca ; DOUBLE FOR LOOKUP
  ld b,0
  ld c,a
  add hl,bc

  ; INCREMENT DISKS ON SCREEN
  ld a,0:disksonscreen
  inc a
  ld (disksonscreen-1),a  
  
  add 30     ; CREATE UNIQUE IDENTIFIER SO WE KNOW WHICH ONE TO MOVE WHEN HE JUMPS ON
  ld d,a     ; BACKUP A IN D
  ld a,(hl)  ; GET ADDRESS OF POINTER
  inc hl
  ld h,(hl)
  ld l,a
  ld a,d
  ld (hl),a
ret
  
; INPUT
; A = DISK POSITION 0 TO 5
spawndiskrightside:
  ld hl,gridlookup+2
  ld b,0
  ld c,a
  add hl,bc

  ; INCREMENT DISKS ON SCREEN
  ld a,(disksonscreen-1)
  inc a
  ld (disksonscreen-1),a
  
  add 40     ; CREATE UNIQUE IDENTIFIER SO WE KNOW WHICH ONE TO MOVE WHEN HE JUMPS ON
  ld (hl),a
ret

; CLEAR DISKS

cleardisks:
  xor a
  ld (disksonscreen-1),a
  ; CLEAR RIGHT SIDE DISKS
  ld hl,gridlookup+2
  ld de,gridlookup+3
  xor a
  ld (hl),a
  ld bc,5
  ldir
cleardisksleftside:
  xor a
  ld (diskleft1),a
  ld (diskleft2),a
  ld (diskleft3),a
  ld (diskleft4),a
  ld (diskleft5),a
  ld (diskleft6),a
ret

; BACKUP DISK POSITIONS SO WE CAN RESTORE THEM IN TWO PLAYER MODE

savediskpositionsplayer2:
  ld de,diskpositions_player2
  jr saveplayerdiskpositions
savediskpositionsplayer1:
  ld de,diskpositions_player1
  saveplayerdiskpositions:
  ld hl,gridlookup+2
  ld bc,6
  ldir
  ld a,(diskleft1)
  ld (de),a
  inc e
  ld a,(diskleft2)
  ld (de),a
  inc e
  ld a,(diskleft3)
  ld (de),a
  inc e
  ld a,(diskleft4)
  ld (de),a
  inc e
  ld a,(diskleft5)
  ld (de),a
  inc e
  ld a,(diskleft6)
  ld (de),a
ret

; SPAWN DISKS BASED ON EXISTING LOOKUP GRID
; ENABLES US TO REBUILD DISKS IN ROUND IN TWO PLAYER MODE
restoredisksfromgridtable_player1:
  call cleardisks
  ld hl,diskpositions_player1
  
  jr dorestoredisksfromgridtable
restoredisksfromgridtable_player2:
  call cleardisks
  ld hl,diskpositions_player2
  
  dorestoredisksfromgridtable:  
  ld b,6
  dorestoredisksloopright:
    ld a,(hl)
	or a
	jr z,donextrestorediskright
	
    push hl
    push bc
	ld a,6
	sub b
    call spawndiskrightside
    pop bc
    pop hl
  
	donextrestorediskright:
	inc hl
  djnz dorestoredisksloopright

  ld b,6
  dorestoredisksloopleft:
    ld a,(hl)
	or a
	jr z,donextrestorediskleft
	
    push hl
    push bc
	ld a,6
	sub b
    call spawndiskleftside
    pop bc
    pop hl
  
	donextrestorediskleft:
	inc hl
  djnz dorestoredisksloopleft
ret

; GRID RETURNS ID OF CURRENTLY OCCUPIED CUBE
; ROTATED 45 DEGREES TO LEFT
gridlookup:
  defb 00,00,00,00,00,00,00,00,00 ; EMPTY SPACE FOR DISKS
  defb 00,01,03,06,10,15,21,28,00 ;
  diskleft1:
  defb 00,02,05,09,14,20,27,00,00 ;
  diskleft2:
  defb 00,04,08,13,19,26,00,00,00 ;
  diskleft3:
  defb 00,07,12,18,25,00,00,00,00 ;
  diskleft4:
  defb 00,11,17,24,00,00,00,00,00 ;
  diskleft5:
  defb 00,16,23,00,00,00,00,00,00 ;
  diskleft6:
  defb 00,22,00,00,00,00,00,00,00 ;
  defb 00,00,00,00,00,00,00,00,00 ; EMPTY SPACE FOR PARABOLIC DROP
  
datastart:

; FIRST SPRITE DATA BLOCK - QBERT
; -------------------------------

spriteid:                 defb 0   ; ID OF SPRITE SO WE KNOW WHAT TO DO WHEN WE LAND ON CUBE
playeralive:              defb 0
playermovedirection:      defb 0   ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
currplayerposy:           defb 40
currplayercube:           defb 0   ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
destplayercube:           defb 0   ; JUMPING TO DESTINATION CUBE
isjumpingdir:             defb 0   ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
playermomentumy:          defb 0
playermomentumx:          defb 0    
playermomentumxdirection: defb 0   ; MOMENTUM DIRECTION
playermomentumydirection: defb 0
playerqubelocy:           defb 1   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
playerqubelocx:           defb 1
currplayerposxyhires:     defw 0
npctype:                  defb 0   ; 0 = PLAYER, 1 = RED BALL
movecounter:              defb 0   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
movedelay:                defb 0   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
movexpixels:              defb 2   ; NUMBER OF HORIZONTAL PIXELS THAT CONSITUTES A MOVEMENT
dropstart:                defb 0   ; IF SPRITE IS MOVING FROM DROP POSITION
gravityforcey:            defb 1   ; GRAVITY STRAIGHT DOWN
gravityforcex:            defb 0   ; ADJUSTED Y POSITION OF SPRITE IN JUMP
; SPRITE IMAGE IDS
playerspriteids:          defw image_qbert_backright, image_qbert_backright_landed, image_qbert_frontright,image_qbert_frontright_landed,0,0

; SECOND SPRITE DATA BLOCK
; ------------------------

aspriteid:                  defb 15   ; ID OF SPRITE SO WE KNOW WHAT TO DO WHEN WE LAND ON CUB - WORK BACKWORDS FROM 15 AS DISKS TAKE UP START SPRITE IDS
aplayeralive:               defb 0
aplayermovedirection:       defb 0   ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
acurrplayerposy:            defb 40
acurrplayercube:            defb 0   ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
adestplayercube:            defb 0   ; JUMPING TO DESTINATION CUBE
aisjumpingdir:              defb 0   ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
aplayermomentumy:           defb 0
aplayermomentumx:           defb 0    
aplayermomentumxdirection:  defb 0   ; MOMENTUM DIRECTION
aplayermomentumydirection:  defb 0
aplayerqubelocy:            defb 1   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
aplayerqubelocx:            defb 1
acurrplayerposxyhires:      defw 0
anpctype:                   defb 1   ; 0 = PLAYER, 1 = RED BALL
amovecounter:               defb 0   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
amovedelay:                 defb 0   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
amovexpixels:               defb 2   ; NUMBER OF HORIZONTAL PIXELS THAT CONSITUTES A MOVEMENT
adropstart:                 defb 0   ; IF SPRITE IS MOVING FROM DROP POSITION
agravityforcey:             defb 0
agravityforcex:             defb 0   ; ADJUSTED Y POSITION OF SPRITE IN JUMP
; SPRITE IMAGE IDS
aplayerspriteids:           defw 0, 0, 0,0,0,0

; SECOND SPRITE DATA BLOCK
; ------------------------

a2spriteid:                  defb 14   ; ID OF SPRITE SO WE KNOW WHAT TO DO WHEN WE LAND ON CUB - WORK BACKWORDS FROM 15 AS DISKS TAKE UP START SPRITE IDS
a2playeralive:               defb 0
a2playermovedirection:       defb 0   ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
a2currplayerposy:            defb 40
a2currplayercube:            defb 0   ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
a2destplayercube:            defb 0   ; JUMPING TO DESTINATION CUBE
a2isjumpingdir:              defb 0   ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
a2playermomentumy:           defb 0
a2playermomentumx:           defb 0    
a2playermomentumxdirection:  defb 0   ; MOMENTUM DIRECTION
a2playermomentumydirection:  defb 0
a2playerqubelocy:            defb 1   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
a2playerqubelocx:            defb 1
a2currplayerposxyhires:      defw 0
a2npctype:                   defb 1   ; 0 = PLAYER, 1 = RED BALL
a2movecounter:               defb 0   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
a2movedelay:                 defb 0   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
a2movexpixels:               defb 2   ; NUMBER OF HORIZONTAL PIXELS THAT CONSITUTES A MOVEMENT
a2dropstart:                 defb 0   ; IF SPRITE IS MOVING FROM DROP POSITION
a2gravityforcey:             defb 0
a2gravityforcex:             defb 0   ; ADJUSTED Y POSITION OF SPRITE IN JUMP
; SPRITE IMAGE IDS
a2playerspriteids:           defw 0, 0, 0,0,0,0

; THIRD SPRITE DATA BLOCK
; ------------------------

a3spriteid:                  defb 14   ; ID OF SPRITE SO WE KNOW WHAT TO DO WHEN WE LAND ON CUB - WORK BACKWORDS FROM 15 AS DISKS TAKE UP START SPRITE IDS
a3playeralive:               defb 0
a3playermovedirection:       defb 0   ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
a3currplayerposy:            defb 40
a3currplayercube:            defb 0   ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
a3destplayercube:            defb 0   ; JUMPING TO DESTINATION CUBE
a3isjumpingdir:              defb 0   ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
a3playermomentumy:           defb 0
a3playermomentumx:           defb 0    
a3playermomentumxdirection:  defb 0   ; MOMENTUM DIRECTION
a3playermomentumydirection:  defb 0
a3playerqubelocy:            defb 1   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
a3playerqubelocx:            defb 1
a3currplayerposxyhires:      defw 0
a3npctype:                   defb 1   ; 0 = PLAYER, 1 = RED BALL
a3movecounter:               defb 0   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
a3movedelay:                 defb 0   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
a3movexpixels:               defb 2   ; NUMBER OF HORIZONTAL PIXELS THAT CONSITUTES A MOVEMENT
a3dropstart:                 defb 0   ; IF SPRITE IS MOVING FROM DROP POSITION
a3gravityforcey:             defb 0
a3gravityforcex:             defb 0   ; ADJUSTED Y POSITION OF SPRITE IN JUMP
; SPRITE IMAGE IDS
a3playerspriteids:           defw 0, 0, 0,0,0,0

; FOURTH SPRITE DATA BLOCK
; ------------------------

a4spriteid:                  defb 14   ; ID OF SPRITE SO WE KNOW WHAT TO DO WHEN WE LAND ON CUB - WORK BACKWORDS FROM 15 AS DISKS TAKE UP START SPRITE IDS
a4playeralive:               defb 0
a4playermovedirection:       defb 0   ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
a4currplayerposy:            defb 40
a4currplayercube:            defb 0   ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
a4destplayercube:            defb 0   ; JUMPING TO DESTINATION CUBE
a4isjumpingdir:              defb 0   ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
a4playermomentumy:           defb 0
a4playermomentumx:           defb 0    
a4playermomentumxdirection:  defb 0   ; MOMENTUM DIRECTION
a4playermomentumydirection:  defb 0
a4playerqubelocy:            defb 1   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
a4playerqubelocx:            defb 1
a4currplayerposxyhires:      defw 0
a4npctype:                   defb 1   ; 0 = PLAYER, 1 = RED BALL
a4movecounter:               defb 0   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
a4movedelay:                 defb 0   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
a4movexpixels:               defb 2   ; NUMBER OF HORIZONTAL PIXELS THAT CONSITUTES A MOVEMENT
a4dropstart:                 defb 0   ; IF SPRITE IS MOVING FROM DROP POSITION
a4gravityforcey:             defb 0
a4gravityforcex:             defb 0   ; ADJUSTED Y POSITION OF SPRITE IN JUMP
; SPRITE IMAGE IDS
a4playerspriteids:           defw 0, 0, 0,0,0,0

dataend:

; OFFSET LOOKUP VALUES FOR IX WHEN ADDRESSING SPRITE DATA BLOCK
; -------------------------------------------------------------

ix_spriteid                  equ 0
ix_playeralive               equ 1
ix_playermovedirection       equ 2    ; DIRECTION PLAYER HAS PRESSED ON JOYSTICK
ix_currplayerposy            equ 3
ix_currplayercube            equ 4    ; SET WHENEVER WE ARE ON DESCENT TOWARDS NEW CUBE
ix_destplayercube            equ 5    ; JUMPING TO DESTINATION CUBE
ix_isjumpingdir              equ 6    ; JUMPING UP 1 OR DOWN 2 - OR DOING NOTHING 0
; MOMENTUM VARIABLES
ix_playermomentumy           equ 7
ix_playermomentumx           equ 8    
ix_playermomentumxdirection  equ 9    ; MOMENTUM DIRECTION
ix_playermomentumydirection  equ 10
ix_playerqubelocy            equ 11   ; USED TO WORK OUT ID OF CUBE TO GET PROPERTIES IN GRID 
ix_playerqubelocx            equ 12
ix_currplayerposxyhires      equ 13
ix_npctype                   equ 15   ; 0 = PLAYER, 1 = RED BALL
ix_movecounter               equ 16   ; SET TO 16 WHEN WE JUMP FROM ONE CUBE TO ANOTHER
ix_movedelay                 equ 17   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
ix_movexpixels               equ 18   ; DELAY BEFORE WE MAKE NEXT MOVE - FOR NPC CHARACTERS
ix_dropstart                 equ 19
ix_gravityforcey             equ 20
ix_gravityforcex             equ 21
; SPRITE IMAGE IDS
ix_playerspriteids           equ 22
ix_image_backright           equ 22
ix_image_backright_landed    equ 25
ix_image_frontright          equ 27
ix_image_frontright_landed   equ 29
ix_image_backright_top       equ 31
ix_image_frontright_top      equ 33

; SPRITE IDS
; ----------
; PLAYER      = 0
; COILY HEAD  = 1
; "CHANGE TO" = 2,3,4
; ENEMIES     = 5,6,7,8
; DISKS       = 9,10,11,12,13,14,15

spriteidsinuse: defb 1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0

; MAXIMUM 4 ENEMIES ON SCREEN AT ONE TIME DUE TO HARDWARE SPRITE LIMITS

spritedatablocktable:
  defw spriteid   ; PLAYER
  defw 0          ; COILY HEAD
  defw 0          ; CHANGE TO 1
  defw 0          ; CHANGE TO 2
  defw 0          ; CHANGE TO 3
  defw aspriteid  ; ENEMY 1
  defw a2spriteid ; ENEMY 2
  defw a3spriteid ; ENEMY 3
  defw a4spriteid ; ENEMY 4
  defw 0          ; DISK
  defw 0          ; DISK
  defw 0          ; DISK
  defw 0          ; DISK
  defw 0          ; DISK
  defw 0          ; DISK
  defw 0          ; DISK

; INPUT
; D = SPRITE ID TO SPAWN
;     1 = RED BALL
;     2 = COILY EGG (BECOMES 3 = COILY SNAKE)
;     4 = GREEN BALL
;     5 = SLICK
;     6 = SAM
;     7 = UGG
;     8 = WRONGWAY

enemiesbyroundtable:
  ; WRONGWAY, UGG, SAM, SLICK, GREEN BALL, COILY, RED BALL
  defw easypeasy   ; LEVEL 1 ROUND 1 - RED BALL, COILY
  defw easypeasy   ; LEVEL 1 ROUND 2
  defw nogreenred  ; LEVEL 1 ROUND 3 - GREEN BALL, COILY, UGG, WRONGWAY
  defw firstfive   ; LEVEL 1 ROUND 4
  defw noredball   ; LEVEL 2 ROUND 1
  defw noredball   ; LEVEL 2 ROUND 2
  defw firstfive   ; LEVEL 2 ROUND 3
  defw allenemies  ; LEVEL 2 ROUND 4
  defw firstfive   ; LEVEL 3 ROUND 1
  defw noredball   ; LEVEL 3 ROUND 2
  defw allenemies  ; LEVEL 3 ROUND 3
  defw allenemies  ; LEVEL 3 ROUND 4
  defw firstfive   ; LEVEL 4 ROUND 1
  defw allenemies  ; LEVEL 4 ROUND 2
  defw firstfive   ; LEVEL 4 ROUND 3
  defw allenemies  ; LEVEL 4 ROUND 4
  defw firstfive   ; LEVEL 5 ROUND 1
  defw firstfive   ; LEVEL 5 ROUND 2
  defw allenemies  ; LEVEL 5 ROUND 3
  defw allenemies  ; LEVEL 5 ROUND 4

spawnenemytypebyround:
  ld a,(level)
  sub 5
  jr nc,allenemies
  
  ld a,(round)
  ld b,a
  ld a,(level)
  rlca ; DOUBLE LEVEL TWICE TO GET CORRECT ENTRY IN TABLE
  rlca
  add b
  rlca ; DOUBLE FOR LOOKUP
  ld hl,enemiesbyroundtable
  ld b,0
  ld c,a
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  jp (hl)
 
maxenemies equ 4

; ENEMIES TYPES FOR EACH ROUND - BASED ON enemiesbyroundtable

nogreenredtable: defb 2,4,7,8,2,4,7,8
firstfivetable:  defb 1,2,4,1,2,4,5,6
easypeasytable:  defb 1,2,1,2,1,2,1,2
noredballtable:  defb 2,4,2,4,5,6,7,8
allenemiestable: defb 1,1,2,4,5,6,7,8

firstfive:
  ld hl,firstfivetable
  jr findenemiestospawn
allenemies:
  ld hl,allenemiestable
  jr findenemiestospawn
noredball:
  ld hl,noredballtable
  jr findenemiestospawn
easypeasy:
  ld hl,easypeasytable
  jr findenemiestospawn
nogreenred:
  ld hl,nogreenredtable
  findenemiestospawn:
  push hl
  ld a,8
  call getrandomnumber
  pop hl
  ld b,0
  ld c,a
  add hl,bc
  ld a,(hl)
ret

spawnenemy:
  ; DON'T ALLOW SPAWN IF QBERT IS ON DISK
  ld a,(moveqbertondiskvariable)
  or a
  ret nz

  ; REMEMBER WE HAVE SPAWNED COILY - ONLY ONE SNAKE ALLOWED AT A TIME
  ld a,d
  cp 2 
  jr nz,skipcoilycheck
  ld a,0:coilyalive
  or a
  ret nz ; WE ALREADY HAVE A COILY
  skipcoilycheck:
  
  ; FIND EMPTY SLOT
  ld hl,spriteidsinuse+5
  ld a,(hl)
  or a
  jr nz,skipfoundslot1 
  ld c,5
  jr finishedcheckslots
  skipfoundslot1: 
 
  inc hl
  ld a,(hl)
  or a
  jr nz,skipfoundslot2
  ld c,6
  jr finishedcheckslots
  skipfoundslot2: 
  
  inc hl
  ld a,(hl)
  or a
  jr nz,skipfoundslot3
  ld c,7
  jr finishedcheckslots
  skipfoundslot3: 
  
  inc hl
  ld a,(hl)
  or a
  ret nz   ; NO SLOTS AVAILABLE FOR ENEMY SPAWN
  ld c,8
  
  finishedcheckslots: 
  ; IF WE HAVE BUFFER AND COILY HAS BEEN SPAWNED ALREADY, MARK HIM AS ALIVE SO WE DON'T SPAWN TWICE
  ld a,d
  cp 2
  jr nz,skipcoilyspawneggcheck
  ; SPAWN COILY
  ld a,1
  ld (coilyalive-1),a
  skipcoilyspawneggcheck:
  jr dospawnenemy                 ; WE FOUND EMPTY SPACE, GENERATE ENEMY

qbertimages:
  defw image_qbert_backright
  defw image_qbert_backright_landed
  defw image_qbert_frontright
  defw image_qbert_frontright_landed
wrongwayimages:
  defw 0
  defw 0
  ; END QBERT IMAGES
  defw image_ww_backright2
  defw image_ww_backright
  defw image_ww_backright3
  defw image_ww_backright4
redballimages:    
  defw 0
  defw 0
  defw image_redball
  defw image_redball_squash
uggimages:
  defw 0
  defw 0
  ; END REDBALL IMAGES
  defw image_ugg_backright2
  defw image_ugg_backright
  defw image_ugg_backright3
  defw image_ugg_backright4
coilyeggimages:   
  defw 0
  defw 0
  defw image_coilyegg
  defw image_coilyegg_squash
samimages:
  defw 0
  defw 0
  ; END COILY EGG IMAGES
  defw image_sam_1
  defw image_sam_crouch
  defw image_sam_2
  defw image_sam_3
slickimages:
  defw 0
  defw 0
  defw image_slick_1
  defw image_slick_crouch
  defw image_slick_2
  defw image_slick_3
greenballimages:    
  defw image_greenball
  defw image_greenball_squash
  defw image_greenball
  defw image_greenball_squash
  defw image_greenball
  defw image_greenball
coilysnakeimages: 
  defw image_coilysnake_backright_bottom
  defw image_coilysnake_backright_landed
  defw image_coilysnake_frontright_bottom
  defw image_coilysnake_frontright_landed
  defw image_coilysnake_backright_top
  defw image_coilysnake_frontright_top

; PTR TO SPRITE IMAGES BY NPC TYPE
imagestable:
  defw qbertimages      ; 0 = PLAYER
  defw redballimages    ; 1 = RED BALL
  defw coilyeggimages   ; 2 = COILY EGG
  defw coilysnakeimages ; 3 = COILY SNAKE
  defw greenballimages  ; 4 = GREEN BALL
  defw slickimages      ; 5 = SLICK
  defw samimages        ; 6 = SAM
  defw uggimages        ; 7 = UGG
  defw wrongwayimages   ; 8 = WRONGWAY

;wip: defb 0
;debugslot equ 1
; INPUT
; EMPTY SLOT NUMBER = C
dospawnenemy:
  ld (hl),1 ; MARK SPRITE SLOT AS OCCUPIED
  
  ; GET LOCATION OF SPRITE DATA BLOCK TO USE
  ld hl,spritedatablocktable
  ld b,0
  add hl,bc
  add hl,bc
 
  ; LOAD BLOCK INTO HL
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ; LOAD HL INTO IX
  push hl  
  pop ix
  
ifdef debugslot
     ld a,(wip)
   inc a
   ld (wip),a
   cp 3
   jr nz,skipit

   jrrt:
   jr jrrt
   skipit:
endif
  
  ld (ix+ix_spriteid),c    ; UPDATE BLOCK WITH CORRECT SPRITE ID CALCULATED ACCORDING TO EMPTY SLOT
  ld (ix+ix_playeralive),1 ; MARK AS ALIVE
  ld (ix+ix_npctype),d     ; UPDATE NPC TYPE
  ld (ix+ix_movexpixels),2 ; SET STANDARD JUMP HORIZONTALLY 
  
  ; SET GRAVITY DIRECTION
  ld a,d
  cp 7 ; UGG - LEFT
  jr z,setgravityleft
  cp 8 ; WRONGWAY - RIGHT
  jr z,setgravityright
  ; EVERYONE ELSE NORMAL GRAVITY
  ; GRAVITY FORCE DIRECTION - BIT 7 IS NEGATIVE NUMBER
  ld (ix+ix_gravityforcex),%00000000
  ld (ix+ix_gravityforcey),1
  jr finishsetgravity
  setgravityleft:
  ; GRAVITY FORCE DIRECTION - BIT 7 IS NEGATIVE NUMBER
  ld (ix+ix_gravityforcex),%10000100
  ld (ix+ix_gravityforcey),-1
  jr finishsetgravity
  setgravityright:
  ; GRAVITY FORCE DIRECTION - BIT 7 IS NEGATIVE NUMBER
  ld (ix+ix_gravityforcex),%00000100
  ld (ix+ix_gravityforcey),-1
  finishsetgravity:
 
  ; COPY SPRITE IMAGES PTRS TO BLOCK
  ; GET PTRS FROM TABLE FOR CORRESPONDING NPC ID
  call copyspriteptrsbynpcid
  
  ; DON'T ALLOW RED BALL IN MENU TO GET MOVED TO SPAWN LOCATION
  ld a,(isqbertmenumovement)
  or a
  ret nz
  
  ld a,(ix+ix_npctype)
  cp 7
  jp z,resetnpcpositiontoppyramid_rightside_ugg
  cp 8 ; UGG, SPAWN AT RIGHT SIDE OF SCREEN FOR UGG
  jp z,resetnpcpositiontoppyramid_leftside_wrongway
  
  ; SPAWN LEFT OR RIGHT ALTERNATELY
  ld a,0:randomizeentrypoint_redball
  xor 1
  ld (randomizeentrypoint_redball-1),a
  or a
  jp z,resetnpcpositiontoppyramid_leftside
  jp resetnpcpositiontoppyramid_rightside
  
; INPUT
; D = NPC ID
copyspriteptrsbynpcid:
  ; COPY SPRITE IMAGES PTRS TO BLOCK
  ; GET PTRS FROM TABLE FOR CORRESPONDING NPC ID
  ld hl,imagestable
  ld b,0
  ld c,d
  add hl,bc
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  
  ; GET LOCATION OF SPRITE BANK IN DE FROM IX
  push hl 
  push ix
  pop hl
  ld b,0
  ld c,ix_image_backright
  add hl,bc
  ld d,h
  ld e,l
  pop hl
  ; COPY THE POINTERS TO THE SPRITE BANK
  ld bc,12
  ldir  
ret

domovementsindivitualtable:
  jp donothing
  jp jumpupright
  jp jumpupleft
  jp jumpdownright
  jp jumpdownleft
  jp resetfirebutton
  jp jumpleft_ugg
  jp jumpupleft_ugg
  jp jumpright_wrongway
  jp jumpupright_wrongway
  jp doadvanceround
  jp dopausegame

domovements_individual:
  ld c,(ix+ix_playermovedirection)
  ld hl,domovementsindivitualtable
  ld b,0
  add hl,bc
  add hl,bc
  add hl,bc
  jp (hl)

doadvanceround:
  ld (ix+ix_playermovedirection),0
  jp advancenextroundorlevel
  
dopausegame:
  ld (ix+ix_playermovedirection),0
  jp togglepausegame
  
resetfirebutton:
  ld (ix+ix_playermovedirection),0
ret
  
domovements_individual_scoreboard:
  ld a,(ix+ix_playermovedirection)
  or a
  ret z
  cp 5
  jp z,fire_scoreboard ; PRESSED FIRE
  cp 10                ; PRESSED R
  jr z,resetfirebutton ; CLEAR - DON'T DO ANYTHING
  cp 11                ; PRESSED PAUSE
  jr z,resetfirebutton ; CLEAR - DON'T DO ANYTHING
  ; HIDE UNDERSCORE SPRITE
  ld b,5
  call hideplussprite
  ; SEE WHICH DIRECTION TO MOVE
  cp 1
  jp z,jumpupright_scoreboard
  cp 2
  jp z,jumpupleft_scoreboard
  cp 3
  jp z,jumpdownright_scoreboard
  jp jumpdownleft_scoreboard

dodrawflipimage_rotate90:
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a

  ; MOVE TO RIGHT SIDE OF ASIC SPRITE
  ; UPDATE ASIC IMAGE
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  ; GET MEMORY LOCATION BASED ON SPRITE ID
  drawflipimage_fixedid_rotate90:
  add &40
  ld d,a
  ld e,0

  ; COPY DOWN IN COLUMNS MOVING FROM TOP LEFT TO BOTTOM RIGHT
  ; THIS FLIPS THE IMAGE VERTICALLY AND ROTATES 90 DEGREES
  ;ld l,255-15
  ld b,16       ; 16 COLUMNS
  drawflipvertrot90looprow:
	push hl
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	call drawflipvertrot90loopcolumn
	; MOVE TO NEXT ROW
	pop hl
	inc l
  djnz drawflipvertrot90looprow
ret
    
drawflipvertrot90loopcolumn:
  ld a,(hl)  
  ld (de),a
  inc e
  ld a,l
  add 16    ; MOVE DOWN ONE ROW IN SPRITE
  ld l,a
ret

dodrawflipimage_rotate90_wrongway:
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  
  ; MOVE TO BOTTOM RIGHT CORNER AND COPY UPWARDS, MOVING TO LEFT
  ld bc,255
  add hl,bc

  ; MOVE TO RIGHT SIDE OF ASIC SPRITE
  ; UPDATE ASIC IMAGE
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  ; GET MEMORY LOCATION BASED ON SPRITE ID
  
  add &40
  ld d,a
  ld e,0

  ; COPY DOWN IN COLUMNS MOVING FROM TOP LEFT TO BOTTOM RIGHT
  ; THIS FLIPS THE IMAGE VERTICALLY AND ROTATES 90 DEGREES
  ;ld l,255-15
  ld b,16       ; 16 COLUMNS
  drawflipvertrot90looprowa:
	push hl
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	call drawnormalrot90loopcolumn
	; MOVE TO NEXT ROW
	pop hl
	dec l
  djnz drawflipvertrot90looprowa
ret

drawnormalrot90loopcolumn:
  ld a,(hl)  
  ld (de),a
  inc e
  ld a,l
  sub 16    ; MOVE UP ONE ROW IN SPRITE
  ld l,a
ret

debugprinta:
  ld (wordtostr2+2),a
  ld hl,#1205
  call my_txt_set_cursor
  ld hl,wordtostr2+2
  jp printstring_oldnontransp
  
debugprinta2num:
  push hl
  push af
  ld h,0
  ld l,a
  call convwordtostrnormal
  xor a
  call txt_set_paper
  ld a,1
  call txt_set_pen
  ld hl,#0103
  call my_txt_set_cursor
  ld hl,wordtostr
  call printstring_oldnontransp
  pop af
  pop hl
ret
  
debugprinthl:
  push hl
  push af
  call convwordtostrnormal
  xor a
  call txt_set_paper
  ld a,1
  call txt_set_pen
  ld hl,#0102
  call my_txt_set_cursor
  ld hl,wordtostr
  call printstring_oldnontransp
  pop af
  pop hl
ret
  
; ---------------------------------

; SHOW RED UNDERSCORE BENEATH GREEN BALL LETTER
; BUT NOT FOR RUB OR END
showunderscoresprite:
  ; ONLY MAKE SOUND WHEN PLAYER FIRST MOVES CURSOR
  ld a,0:playermovedcursor
  or a
  jr z,skipdojumpnoisecursor
  call dojumpnoise
  skipdojumpnoisecursor:
  ld a,1
  ld (playermovedcursor-1),a
  call getqubefromgridscoreboard
  cp 1
  ret z
  cp 2
  ret z
  ld a,(ix+ix_currplayerposy)
  add 16+11
  ld b,a
  ld hl,(ix+ix_currplayerposxyhires)
  ld a,5
  jp moveplussprite2  

; --------------------------------- 

jumpdownleft_movetotopright:
  ; MOVE TO TOP OF SCOREBOARD
  ld a,112-16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE LEFT SIDE OF SCREEN
  ld bc,27*16+8-32
  ld (ix+ix_currplayerposxyhires),bc
  jr finishjumpdownleftscoreboard
  
jumpdownleft_movetoright:
  ; MOVE LEFT SIDE OF SCREEN
  ld bc,27*16+8
  ld (ix+ix_currplayerposxyhires),bc
  jr finishjumpdownleftscoreboard
  
jumpdownleft_movetotop:
  ; MOVE TO TOP OF SCOREBOARD
  ld a,112-16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE SLIGHTLY LEFT A CHARACTER 
  ld bc,16+16
  ld hl,(ix+ix_currplayerposxyhires)
  sbc hl,bc
  ld (ix+ix_currplayerposxyhires),hl
  jr finishjumpdownleftscoreboard

jumpdownleft_scoreboard:
  call getqubefromgridscoreboard
  cp "A"
  jr z,jumpdownleft_movetoright
  cp "M"
  jr z,jumpdownleft_movetoright
  cp "Y"
  jr z,jumpdownleft_movetotopright
  cp "Z"
  jr z,jumpdownleft_movetotop
  cp " "
  jr z,jumpdownleft_movetotop
  cp "."
  jr z,jumpdownleft_movetotop
  cp 1
  jr z,jumpdownleft_movetotop
  cp 2
  jr z,jumpdownleft_movetotop
  
  finishjumpdownleftscoreboard:
  ; SET DESTINATION CUBE
  ; MAKE SURE WE DON'T FALL OFF EDGE
  ld a,1
  jr finishjumpdownleft
jumpdownleft:
  ; INCREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocy)
  inc a
  ld (ix+ix_playerqubelocy),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  finishjumpdownleft:
  ld (ix+ix_destplayercube),a
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),2
  ld (ix+ix_playermomentumx),-1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),0
  
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum1

  ld (ix+ix_playermomentumy),-3
  ; SET CLIPPING PTR TO START OF FRAME MOVEMENT
  ;ld hl,clipplayerfunctions
  ;ld (clipplayerfunctionsptr),hl
  
  skipsetparabolicmomentum1:
  
  ; CHECK IF MOVING COILY, IF SO, DRAW EXTRA HEAD GRAPHIC TO SPRITE NUMBER 1
  ld a,(ix+ix_npctype)
  cp 3
  jr nz,skipsetcoilydownleftimage
  ld hl,(ix+ix_playerspriteids+10)
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld a,1
  call drawflipimage_fixedid_compressed
  
  skipsetcoilydownleftimage:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawflipimage2_compressed
  
jumpupleft_ugg:
  ; DECREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocx)
  dec a
  ld (ix+ix_playerqubelocx),a
  ; SET DESTINATION CUBE
  call getqubefromgrid

  ld (ix+ix_destplayercube),a

  ; SET DIRECTION
  ld a,1           ; UP
  ld (ix+ix_isjumpingdir),a
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),-2
  ld (ix+ix_playermomentumx),-1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ;; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),0

  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum4a
  ld (ix+ix_playermomentumy),-6
  
  skipsetparabolicmomentum4a:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+6)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed

jumpupright_wrongway:
  ; INCREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocy)
  dec a
  ld (ix+ix_playerqubelocy),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  ld (ix+ix_destplayercube),a
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),2
  ld (ix+ix_playermomentumx),1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1
  
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum1abc
  
  ld (ix+ix_playermomentumy),0
  
  skipsetparabolicmomentum1abc:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+6)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed

jumpleft_ugg:
  ; INCREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocy)
  inc a
  ld (ix+ix_playerqubelocy),a
  ld a,(ix+ix_playerqubelocx)
  dec a
  ld (ix+ix_playerqubelocx),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  ld (ix+ix_destplayercube),a
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),2
  ld (ix+ix_playermomentumx),-1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),0
  
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum1abcd
  
  ld (ix+ix_playermomentumy),-3
  
  skipsetparabolicmomentum1abcd:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+6)
  jp dodrawflipimage_rotate90
  
jumpright_wrongway:
  ; INCREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocy)
  dec a
  ld (ix+ix_playerqubelocy),a
  ld a,(ix+ix_playerqubelocx)
  inc a
  ld (ix+ix_playerqubelocx),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  ld (ix+ix_destplayercube),a
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),2
  ld (ix+ix_playermomentumx),1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1
  
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum1ab
  
  ld (ix+ix_playermomentumy),-3
  
  skipsetparabolicmomentum1ab:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+6)
  jp dodrawflipimage_rotate90_wrongway

; 0 X MOMENTUM SO SPRITE JUST MOVES DOWNWARDS
jumpstraightdowntmenu:
  xor a
  ; RESET PLAYER INPUT
  ld (ix+ix_playermovedirection),a
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; GRAVITY FORCE DIRECTION
  ld (ix+ix_gravityforcex),%00000000
  ld (ix+ix_gravityforcey),1
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),0
  ld (ix+ix_playermomentumx),a
  ; DON'T MOVE HORIZONTALLY
  ld (ix+ix_movexpixels),a
  ld (ix+ix_movecounter),16
  
  ; SET POSITION
  ld (ix+ix_currplayerposy),16
  ld bc,(currplayerposxyhires)
  ld (ix+ix_currplayerposxyhires),bc
  
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1

  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),a
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed

jumpdownrightmenu:
  ; RESET PLAYER INPUT
  ld (ix+ix_playermovedirection),0
  
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOVE COUNTER
  ld a,16
  ld (ix+ix_movecounter),a

  ; SET DESTINATION CUBE EXISTS SO WE DON'T FALL OFF SCREEN
  ld (ix+ix_destplayercube),1
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed

; --------------------------------- 

jumpdownright_movetotopleft:
  ; MOVE TO TOP OF SCOREBOARD
  ld a,112-16-1
  ld (ix+ix_currplayerposy),a
jumpdownright_movetoleft:
  ; MOVE LEFT SIDE OF SCREEN
  ld bc,1*16+8
  ld (ix+ix_currplayerposxyhires),bc
  jr finishjumpdownrightscoreboard
  
jumpdownright_movetotop:
  ; MOVE TO TOP OF SCOREBOARD
  ld a,112-16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE SLIGHTLY RIGHT A CHARACTER 
  ld bc,16+16
  ld hl,(ix+ix_currplayerposxyhires)
  add hl,bc
  ld (ix+ix_currplayerposxyhires),hl
  jr finishjumpdownrightscoreboard

jumpdownright_scoreboard:
  call getqubefromgridscoreboard
  cp 2
  jr z,jumpdownright_movetotopleft
  cp "L"
  jr z,jumpdownright_movetoleft
  cp "X"
  jr z,jumpdownright_movetoleft
  cp "Y"
  jr z,jumpdownright_movetotop
  cp "Z"
  jr z,jumpdownright_movetotop
  cp " "
  jr z,jumpdownright_movetotop
  cp "."
  jr z,jumpdownright_movetotop
  cp 1
  jr z,jumpdownright_movetotop
  
  finishjumpdownrightscoreboard:
  ; SET DESTINATION CUBE
  ; MAKE SURE WE DON'T FALL OFF EDGE
  ld a,1
  jr finishjumpdownright
jumpdownright:
  ; INCREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocx)
  inc a
  ld (ix+ix_playerqubelocx),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  finishjumpdownright:
  ld (ix+ix_destplayercube),a

  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),2
  ld (ix+ix_playermomentumx),1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1
  
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum2
  ld (ix+ix_playermomentumy),-3
  ; SET CLIPPING PTR TO START OF FRAME MOVEMENT
  ;ld hl,clipplayerfunctions
  ;ld (clipplayerfunctionsptr),hl
  
  skipsetparabolicmomentum2:
  
  ; CHECK IF MOVING COILY, IF SO, DRAW EXTRA GRAPHIC TO SPRITE 1
  ld a,(ix+ix_npctype)
  cp 3
  jr nz,skipsetcoilydownrightimage
  ld hl,(ix+ix_playerspriteids+10)
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld a,1
  call drawnormalimage_fixedid_compressed
  skipsetcoilydownrightimage:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+4)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed

; --------------------------------- 

jumpupright_movetobottomleft:
  ; MOVE TO BOTTOM OF SCOREBOARD
  ld a,176+16-1
  ld (ix+ix_currplayerposy),a
jumpupright_movetoleft:
  ; MOVE LEFT SIDE OF SCREEN
  ld bc,1*16+8
  ld (ix+ix_currplayerposxyhires),bc
  jr finishjumpuprightscoreboard
  
jumpupright_movetobottom:
  ; MOVE TO BOTTOM OF SCOREBOARD
  ld a,176+16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE SLIGHTLY RIGHT A CHARACTER 
  ld bc,16+16
  ld hl,(ix+ix_currplayerposxyhires)
  add hl,bc
  ld (ix+ix_currplayerposxyhires),hl
  jr finishjumpuprightscoreboard
  
jumpupright_scoreboard:
  call getqubefromgridscoreboard
  cp "A"
  jr z,jumpupright_movetobottom
  cp "L"
  jr z,jumpupright_movetoleft
  cp "X"
  jr z,jumpupright_movetoleft
  cp "B"
  jr z,jumpupright_movetobottom
  cp "C"
  jr z,jumpupright_movetobottom
  cp "D"
  jr z,jumpupright_movetobottom
  cp "E"
  jr z,jumpupright_movetobottom
  cp "F"
  jr z,jumpupright_movetobottomleft
  
  finishjumpuprightscoreboard:
  ; SET DESTINATION CUBE
  ; MAKE SURE WE DON'T FALL OFF EDGE
  ld a,1
  jr finishjumpupright
jumpupright:
  ; DECREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocy)
  dec a
  ld (ix+ix_playerqubelocy),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  
  finishjumpupright:
  ld (ix+ix_destplayercube),a

  ; SET DIRECTION UP
  ld (ix+ix_isjumpingdir),1
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),-2
  ld (ix+ix_playermomentumx),1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1
 
  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum3
  ld (ix+ix_playermomentumy),-6
  ; SET CLIPPING PTR TO START OF FRAME MOVEMENT
  ;ld hl,clipplayerfunctions
  ;ld (clipplayerfunctionsptr),hl

  skipsetparabolicmomentum3:
  
  ; CHECK IF MOVING COILY, IF SO, DRAW EXTRA GRAPHIC TO SPRITE 1
  ld a,(ix+ix_npctype)
  cp 3
  jr nz,skipsetcoilyuprightimage
  ld hl,(ix+ix_playerspriteids+8)
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld a,1
  call drawnormalimage_fixedid_compressed
  skipsetcoilyuprightimage:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+0)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawnormalimage2_compressed
 
; --------------------------------- 
 
jumpupleft_movetobottomright:
  ; MOVE TO BOTTOM OF SCOREBOARD
  ld a,176+16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE RIGHT SIDE OF SCREEN
  ld bc,27*16+8-32
  ld (ix+ix_currplayerposxyhires),bc;hl
  jr finishjumpupleftscoreboard
jumpupleft_movetoright:
  ; MOVE RIGHT SIDE OF SCREEN
  ld bc,27*16+8
  ld (ix+ix_currplayerposxyhires),bc;hl
  jr finishjumpupleftscoreboard
  
jumpupleft_movetobottom:
  ; MOVE TO BOTTOM OF SCOREBOARD
  ld a,176+16-1
  ld (ix+ix_currplayerposy),a
  ; MOVE SLIGHTLY LEFT A CHARACTER 
  ld bc,16+16
  ld hl,(ix+ix_currplayerposxyhires)
  sbc hl,bc
  ld (ix+ix_currplayerposxyhires),hl
  jr finishjumpupleftscoreboard
  
jumpupleft_scoreboard:
  call getqubefromgridscoreboard
  cp "A"
  jr z,jumpupleft_movetobottomright
  cp "M"
  jr z,jumpupleft_movetoright
  cp "Y"
  jr z,jumpupleft_movetoright
  cp "B"
  jr z,jumpupleft_movetobottom
  cp "C"
  jr z,jumpupleft_movetobottom
  cp "D"
  jr z,jumpupleft_movetobottom
  cp "E"
  jr z,jumpupleft_movetobottom
  cp "F"
  jr z,jumpupleft_movetobottom
  
  finishjumpupleftscoreboard:
  ; SET DESTINATION CUBE
  ; MAKE SURE WE DON'T FALL OFF EDGE
  ld a,1
  jr finishjumpupleft

jumpupleft:
  ; DECREMENT GRID LOCATION
  ld a,(ix+ix_playerqubelocx)
  dec a
  ld (ix+ix_playerqubelocx),a
  ; SET DESTINATION CUBE
  call getqubefromgrid
  finishjumpupleft:
  ld (ix+ix_destplayercube),a

  ; SET DIRECTION
  ld a,1           ; UP
  ld (ix+ix_isjumpingdir),a
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),-2
  ld (ix+ix_playermomentumx),-1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ;; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),0

  ld a,(ix+ix_destplayercube)
  or a
  jr nz,skipsetparabolicmomentum4
  ld (ix+ix_playermomentumy),-6
  ; SET CLIPPING PTR TO START OF FRAME MOVEMENT
  ;ld hl,clipplayerfunctions
  ;ld (clipplayerfunctionsptr),hl
  
  skipsetparabolicmomentum4:
  
  ; CHECK IF MOVING COILY, IF SO, DRAW EXTRA GRAPHIC TO SPRITE 1
  ld a,(ix+ix_npctype)
  cp 3
  jr nz,skipsetcoilyupleftimage
  ld hl,(ix+ix_playerspriteids+8)
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld a,1
  call drawflipimage_fixedid_compressed
  skipsetcoilyupleftimage:
  
  ; SET GRAPHIC
  ld hl,(ix+ix_playerspriteids+0)
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  jp dodrawflipimage2_compressed
  
; --------------------------------------------------
;  UGG MOVEMENTS

fire_scoreboard:
  call km_check_keyrelease
  ret nc
  ld (ix+ix_playermovedirection),0
  ; PLAYER PRESSED FIRE ON SCOREBOARD - ADD LETTER, RUB OR END ENTRY
  call getqubefromgridscoreboard
  cp 2
  jp z,finishscoreboardentry
  cp 1
  jr z,deleteplayerinitial  
  addplayerinitial:
  ld c,a ; BACKUP LETTER IN C
  ld a,(playerinitialscount)
  cp 3
  jr z,checkfinishscoreboardentry ; DON'T ALLOW MORE THAN THREE CHARACTERS
  
  ; ADD INITIAL AND INCREMENT COUNTER
  ld hl,(playerinitialsptr)
  ld (hl),c
  inc hl
  ld (playerinitialsptr),hl
  
  call printplayerinitials
  
  ld a,(playerinitialscount)
  inc a
  ld (playerinitialscount),a
  
  cp 3
  jr z,checkfinishscoreboardentry
  
  jr drawplayerinitialunderline

printplayerinitials:
  ld a,2
  call txt_set_pen
  ; PRINT PLAYER INTIAL STRING  
  ld hl,#121c
  call my_txt_set_cursor
  
  ld hl,playerinitials
  jp printstring_oldnontransp
  
drawplayerinitialunderline: 
  ld a,3
  call txt_set_pen
  ld h,18
  ld l,29
  call my_txt_set_cursor

  ld hl,playerintiialsunderline+2
  ld a,(playerinitialscount)
  ld b,0
  ld c,a
  sbc hl,bc

  jp printstring_oldnontransp
  
deleteplayerinitial:
  ld a,(playerinitialscount)
  or a
  ret z
  dec a
  ld (playerinitialscount),a
  
  ; FIND INITIAL
  ld hl,(playerinitialsptr)
  dec hl 
  ld a," "
  ld (hl),a
  ld (playerinitialsptr),hl

  call printplayerinitials
  jr drawplayerinitialunderline

; MOVE GREEN BALL TO END FUNCTION AFTER THIRD LETTER ENTERED
checkfinishscoreboardentry:
  call dofinishnoisescoreboard

  ld b,176-1
  ld (ix+ix_currplayerposy),b
  ld hl,56+64+64+64+64+64
  ld (ix+ix_currplayerposxyhires),hl
  xor a
  call moveplussprite2
  ; HIDE UNDERLINE SPRITE
  ld b,5
  jp hideplussprite
  
finishscoreboardentry:
  call disablesecondinterrupt ; STOP TIMER
  
  ; WE REACHED HIGH SCORE - MAKE SPACE
  call makenewscoreentry
  
  ; RESET INITIALS POINTER AND COUNTER
  ld hl,playerinitials        
  ld (playerinitialsptr),hl
  xor a
  ld (playerinitialscount),a
  
  ; RESET INITIALS COPY
  ld a," "
  ld (playerinitials),a
  ld (playerinitials+1),a
  ld (playerinitials+2),a
  
  ; RESET PLAYER SPRITE TO QBERT
  xor a
  ld (npctype),a
  ; COPY CORRECT SPRITE IMAGES IN CASE WE WERE GREEN BALL
  ld ix,spriteid
  ld d,0
  call copyspriteptrsbynpcid  
  
;  call qbertbyebye
 
  jp showscoreboard           ; NOW SHOW ACTUAL SCOREBOARD

 
; MOVEMENT DOES NOT USE A STRICT PARABOLIC SHAPE.
; INSTEAD WE ADD HEIGHT PIXELS TO DRAW A STRAIGHT LINE FROM ONE CUBE TO ANOTHER, OFFSET 16 X 24 Y
; THEN WE ADD Y OFFSET ON TOP OF THIS FOR THE CURVE
; THIS IS DONE SO QBERT'S JUMP DOESN'T GET TOO HIGH
; WHEN JUMPING OFF THE PYRAMID WE DO NEED TO USE A PARABOLIC SHAPE SO HE SPEEDS UP

moveyoffsetparabolic: defb 10,9,8,7,6,5,4,3,3,2,2,1,1,1,0,0,0

; MOVEMENTS MUST ADD UP TO PRECISE PIXEL POSITION FOR SCOREBOARD TO DETECT WHICH LETTER POINTER IS AT
movescoreboardleapupright:
  ; X       Y
  defb 0,   0  ; ZERO MOVECOUNTER NOT USED
  defb 2,   3;5 
  defb 2,   2;4  
  defb 2,   1;3 
  defb 2,   1;3  
  defb 2,   0;2  
  defb 2,   0;2  
  defb 2,   0;1  
  defb 2,  -1;1  
  defb 2,  -1;1  
  defb 2,  -1;0  
  defb 2,  -2;0  
  defb 2,  -2;0  
  defb 2,  -3;-1  
  defb 2,  -3;-1  
  defb 2,  -4;-2 
  defb 2,  -6;-3 
  
movescoreboardleapupleft:
  ; X       Y
  defb 0,   0  ; ZERO MOVECOUNTER NOT USED
  defb %10000010,   3;5 
  defb %10000010,   2;4  
  defb %10000010,   1;3 
  defb %10000010,   1;3  
  defb %10000010,   0;2  
  defb %10000010,   0;2  
  defb %10000010,   0;1  
  defb %10000010,  -1;1  
  defb %10000010,  -1;1  
  defb %10000010,  -1;0  
  defb %10000010,  -2;0  
  defb %10000010,  -2;0  
  defb %10000010,  -3;-1  
  defb %10000010,  -3;-1  
  defb %10000010,  -4;-2 
  defb %10000010,  -6;-3 

movescoreboardleapdownright:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb 2,  6 
  defb 2,  4  
  defb 2,  3 
  defb 2,  3  
  defb 2,  2  
  defb 2,  2  
  defb 2,  1  
  defb 2,  1  
  defb 2,  1  
  defb 2,  0  
  defb 2,  0  
  defb 2,  0  
  defb 2, -1  
  defb 2, -1  
  defb 2, -2 
  defb 2, -3 
  
movescoreboardleapdownleft:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb %10000010,  6 
  defb %10000010,  4  
  defb %10000010,  3 
  defb %10000010,  3  
  defb %10000010,  2  
  defb %10000010,  2  
  defb %10000010,  1  
  defb %10000010,  1  
  defb %10000010,  1  
  defb %10000010,  0  
  defb %10000010,  0  
  defb %10000010,  0  
  defb %10000010, -1  
  defb %10000010, -1  
  defb %10000010, -2 
  defb %10000010, -3 

movemenuleapdownright:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb 1,  8 
  defb 1,  7  
  defb 1,  6 
  defb 1,  5  
  defb 1,  4  
  defb 1,  3  
  defb 1,  2  
  defb 1,  1  
  defb 1,  1  
  defb 1,  0  
  defb 1,  0  
  defb 1,  0  
  defb 1, -1  
  defb 1, -1  
  defb 1, -2 
  defb 1, -3 

; HORIZONTAL MOVEMENT MUST BE EXACTLY 64 PIXELS
; PROBABLY NEEDS TO BE IN INCREMENTS OF 2 SO COLLISION DETECTION DOESN'T SKIP FRAMES?
; BIT 7 SET INDICATES NEGATIVE AMOUNT
moveuggleapleft:
  defb 0,    0  ; ZERO MOVECOUNTER NOT USED
  defb %10001101,   -3 ; <13
  defb %10001011,   -2 ; <11
  defb %10001001,   -2 ; <9
  defb %10001000,   -1 ; <8
  defb %10000111,    0 ; <7
  defb %10000110,    0 ; <6
  defb %10000101,   -1 ; <5
  defb %10000100,    0 ; <4
  defb %10000011,    0 ; <3
  defb %10000010,   -1 ; <2
  defb %10000001,    0 ; <1
  defb %10000001,    0 ; <1
  defb 0,            1 ; 
  defb 1,            2 ; >1
  defb 2,            3 ; >2
  defb 3,            4 ; >3
  
; HORIZONTAL MOVEMENT MUST BE EXACTLY 64 PIXELS
; PROBABLY NEEDS TO BE IN INCREMENTS OF 2 SO COLLISION DETECTION DOESN'T SKIP FRAMES?
; BIT 7 SET INDICATES NEGATIVE AMOUNT
movewrongwayleapright:
  defb 0,    0  ; ZERO MOVECOUNTER NOT USED
  defb %00001101,   -3 ; <13
  defb %00001011,   -2 ; <11
  defb %00001001,   -2 ; <9
  defb %00001000,   -1 ; <8
  defb %00000111,    0 ; <7
  defb %00000110,    0 ; <6
  defb %00000101,   -1 ; <5
  defb %00000100,    0 ; <4
  defb %00000011,    0 ; <3
  defb %00000010,   -1 ; <2
  defb %00000001,    0 ; <1
  defb %00000001,    0 ; <1
  defb 0,            1 ; 
  defb %10000001,           2 ; >1
  defb %10000010,           3 ; >2
  defb %10000011,           4 ; >3

; HORIZONTAL MOVEMENT MUST BE EXACTLY 32 PIXELS
; PROBABLY NEEDS TO BE IN INCREMENTS OF 2 SO COLLISION DETECTION DOESN'T SKIP FRAMES?
; BIT 7 SET INDICATES NEGATIVE AMOUNT
moveuggleapupleft:
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb %10000111, -1  ;<7
  defb %10000110, -2  ;<6
  defb %10000101, -1  ;<5
  defb %10000100, -2  ;<4
  defb %10000100, -1  ;<4
  defb %10000011, -2  ;<3
  defb %10000011, -1  ;<3
  defb %10000010, -2  ;<2
  defb %10000010, -1  ;<2
  defb %10000001, -2  ;<1
  defb %10000001, -1  ;<1  
  defb %00000000, -2  
  defb %00000000, -1  
  defb %00000001, -2  ;>1
  defb %00000010, -1  ;>2
  defb %00000011, -2  ;>3

; HORIZONTAL MOVEMENT MUST BE EXACTLY 32 PIXELS
; PROBABLY NEEDS TO BE IN INCREMENTS OF 2 SO COLLISION DETECTION DOESN'T SKIP FRAMES?
; BIT 7 SET INDICATES NEGATIVE AMOUNT
movewrongwayleapupright:
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb %00000111, -1  ;<7
  defb %00000110, -2  ;<6
  defb %00000101, -1  ;<5
  defb %00000100, -2  ;<4
  defb %00000100, -1  ;<4
  defb %00000011, -2  ;<3
  defb %00000011, -1  ;<3
  defb %00000010, -2  ;<2
  defb %00000010, -1  ;<2
  defb %00000001, -2  ;<1
  defb %00000001, -1  ;<1  
  defb %00000000, -2  
  defb %00000000, -1  
  defb %10000001, -2  ;>1
  defb %10000010, -1  ;>2
  defb %10000011, -2  ;>3

movestdleapdownright:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb 2,  7 
  defb 2,  6  
  defb 2,  5 
  defb 2,  4  
  defb 2,  3  
  defb 2,  2  
  defb 2,  2  
  defb 2,  1  
  defb 2,  1  
  defb 2,  0  
  defb 2,  0  
  defb 2,  0  
  defb 2, -1  
  defb 2, -1  
  defb 2, -2 
  defb 2, -3 
 
; BIT 7 SET INDICATES NEGATIVE AMOUNT
movestdleapdownleft:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb %10000010,  7 
  defb %10000010,  6  
  defb %10000010,  5 
  defb %10000010,  4  
  defb %10000010,  3  
  defb %10000010,  2  
  defb %10000010,  2  
  defb %10000010,  1  
  defb %10000010,  1  
  defb %10000010,  0  
  defb %10000010,  0  
  defb %10000010,  0  
  defb %10000010, -1  
  defb %10000010, -1  
  defb %10000010, -2 
  defb %10000010, -3 
movestdleapupright:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb 2,  3  
  defb 2,  2  
  defb 2,  1   
  defb 2,  1  
  defb 2,  0   
  defb 2,  0   
  defb 2,  0   
  defb 2, -1   
  defb 2, -1   
  defb 2, -2   
  defb 2, -2   
  defb 2, -3   
  defb 2, -4   
  defb 2, -5   
  defb 2, -6   
  defb 2, -7  
  
movestdleapupleft:
  ; X       Y
  defb 0,  0  ; ZERO MOVECOUNTER NOT USED
  defb %10000010,  3  
  defb %10000010,  2  
  defb %10000010,  1   
  defb %10000010,  1  
  defb %10000010,  0   
  defb %10000010,  0   
  defb %10000010,  0   
  defb %10000010, -1   
  defb %10000010, -1   
  defb %10000010, -2   
  defb %10000010, -2   
  defb %10000010, -3   
  defb %10000010, -4   
  defb %10000010, -5   
  defb %10000010, -6   
  defb %10000010, -7  

; TABLE OF NOISE FUNCTIONS CALLED BEFORE WE LAND ON CUBE
; TIMED SO NOISE IS SOUNDING WHEN WE ACTUALLY LAND
nonoise:
ret
noisesbynpcid:
  defw dojumpnoise        ; 0  = QBERT
  defw dojumpnoiseredball ; 1  = RED BALL
  defw dojumpnoisebigball ; 2  = COILY EGG
  defw nonoise            ; 3  = COILY SNAKE - DO LEAP NOISE INSTEAD
  defw nonoise            ; 4  = GREEN BALL
  defw nonoise            ; 5  = SLICK
  defw nonoise            ; 6  = SAM
  defw dolazerboltnoise   ; 7  = UGG
  defw dolazerboltnoise   ; 8  = WRONGWAY
  defw nonoise            ; 9  = 
  defw nonoise            ; 10 = GREEN BALL IN HIGH SCORE MENU

; PAUSE GAME FUNCTION
togglepausegame:
  ld a,0:ispaused
  xor 1
  ld (ispaused-1),a
  call km_wait_keyrelease
  or a
  ret z
  pausegameloop:
    call flashgamepaused
    call testkeypause
  jr nz,pausegameloop
  jp clearsinglemessage

moveplayersprite:
  ld a,(ix+ix_isjumpingdir)      ; IF WE ARE NOT JUMPING, DON'T MOVE SPRITE
  or a
  ret z           
  
  ; IF WE ARE UGG OR WRONGWAY, START PARABOLIC MOVEMENT AT END OF NORMAL LEAP
  ; THIS MAKES UGG AND WRONGWAY JUMPS BETTER CURVED
  ld a,(ix+ix_npctype)
  cp 7
  jr z,startparabolicmovementendofleap  
  cp 8
  jr z,startparabolicmovementendofleap  
  jr skipdelayparabolicmovement
  
  startparabolicmovementendofleap:
  ld a,(ix+ix_movecounter)
  cp 1
  jr nz,skip_setmoveplayersprite_parabolic
  
  skipdelayparabolicmovement:

  ; IF SPRITE HAS JUMPED OFF PYRAMID, SET MOVEMENT TO PARABOLIC
  ld a,(ix+ix_destplayercube)
  or a
  jp z,moveplayersprite_parabolic
  
  ; IF COILY, UGG, WRONGWAY AND DEST ID IS > 29, SET MOVEMENT TO PARABOLIC SO HE DOESN'T LAND ON DISK
  sub 29
  jp c,skip_setmoveplayersprite_parabolic
  
  ld a,(ix+ix_npctype)
  or a
  jp nz,moveplayersprite_parabolic
  
  skip_setmoveplayersprite_parabolic:
  ; IF DROPSTART, BUILD MOMENTUM
  ; DECREASE Y POS BY MOMENTUM - GOING DOWN
  ld a,(ix+ix_dropstart)
  or a
  jr z,skipmovebymomentum
  
  ; ----------------------------------------------
  ; DROP START TOP OF PYRAMID 
  
  ; BUILD MOMENTUM DOWN
  ld hl,moveyoffsetparabolic
  ld b,0
  ld c,(ix+ix_movecounter)
  add hl,bc
  ld a,(hl)
  ld e,a
  
  ; DECREASE HEIGHT BY MOMENTUM
  ld a,(ix+ix_currplayerposy)
  add e  
  ld (ix+ix_currplayerposy),a
  
  jp domovesprite
  ; ----------------------------------------------
  
  skipmovebymomentum:
  
  ld a,(ix+ix_playermovedirection)
  dec a;cp 1
  jr z,doleapupright
  dec a;cp 2
  jr z,doleapupleft
  dec a;cp 3
  jr z,doleapdownright
  dec a;cp 4
  jr z,doleapdownleft
  dec a;cp 5 ; FIRE
  ret z
  dec a;cp 6
  jr z,doleapleft_ugg
  dec a;cp 7
  jr z,doleapupleft_ugg
  dec a;cp 8
  jr z,doleapright_wrongway
  dec a;cp 9
  jr z,doleapupright_wrongway
  dec a;cp 10 CHEAT - PRESSED R
  jp z,advanceround
  dec a;cp 11 PAUSE
  jp z,togglepausegame

  ;jr z,resetfirebutton

  doleapdownright:
    ld hl,movestdleapdownright:leaptype2
    jr continuemove
  doleapleft_ugg:
    ld hl,moveuggleapleft
	jr continuemove
  doleapupleft_ugg:
    ld hl,moveuggleapupleft
	jr continuemove
  doleapdownleft:
    ld hl,movestdleapdownleft:leaptype
	jr continuemove
  doleapupleft:
    ld hl,movestdleapupleft:leaptype3
	jr continuemove
  doleapright_wrongway:
    ld hl,movewrongwayleapright
	jr continuemove
  doleapupright_wrongway:
    ld hl,movewrongwayleapupright
	jr continuemove
  doleapupright:
    ld hl,movestdleapupright:leaptype4
  continuemove:
	ld a,(ix+ix_movecounter)
    rlca
    ld b,0
    ld c,a
    add hl,bc
    ld a,(hl)
	
	; UPATE HORIZONTAL POSITION
    push hl
    ld hl,(ix+ix_currplayerposxyhires)
    bit 7,a     ; ARE WE MOVING LEFT OR RIGHT
    jr nz,skipmoveright2
    ld c,a
    add hl,bc
    jr finishedhorizontalmove2
    skipmoveright2:
    res 7,a     ; CLEAR NEGATIVE BIT 7
    ld c,a  
    sbc hl,bc
    finishedhorizontalmove2:
    ld (ix+ix_currplayerposxyhires),hl
    pop hl
  
    inc hl
    ld a,(hl)
    ld c,a      ; GET VERTICAL OFFSET IN C
  
    ; UPATE VERTICAL POSITION
    ld a,(ix+ix_currplayerposy)
    add c
    ld (ix+ix_currplayerposy),a
  
  ; MOVE SPRITE
  domovesprite:
  ld hl,(ix+ix_currplayerposxyhires)
  ld b,a
  ld a,(ix+ix_spriteid)
  call moveplussprite2
  
  ; =================================================================
  ;  SPRITE IMAGE ALTERATIONS
  ; -----------------------------------------------------------------
  
  ld a,(ix+ix_npctype)
  cp 3 ; CHECK IF MOVING COILY,    IF SO, DRAW HEAD SPRITE 16 ROWS ABOVE
  jp z,drawcoilyhead
  cp 5 ; CHECK IF MOVING SLICK,    IF SO, UPDATE CORRECT IMAGE FOR MOVEMENT
  jr z,updateslickimage
  cp 6 ; CHECK IF MOVING SAM,      IF SO, UPDATE CORRECT IMAGE FOR MOVEMENT
  jr z,updateslickimage
  cp 7 ; CHECK IF MOVING UGG,      IF SO, UPDATE CORRECT IMAGE FOR MOVEMENT
  jr z,updateuggimage
  cp 8 ; CHECK IF MOVING WRONGWAY, IF SO, UPDATE CORRECT IMAGE FOR MOVEMENT
  jr z,updatewrongwayimage
  jp skipenemymovementalterations
  
  ; SLICK AND SAM AND OTHER CHARACTERS UPDATE SPRITE IMAGE AS IT MOVES THROUGH THE JUMP!
  ; CHECK MOVE COUNTER AND UPDATE ACCORDINGLY
  updateslickimage:
  ld a,(ix+ix_movecounter)
  cp 4
  jr z,drawslick2
  cp 8
  jr z,drawslick3
  cp 12
  jr z,drawslick2
  jp skipenemymovementalterations
  
  ; GET CORRECT SLICK IMAGE
  drawslick2:
    ld hl,(ix+ix_playerspriteids+8)
	jr drawslickfinal
  drawslick3:
    ld hl,(ix+ix_playerspriteids+10)
  ; DRAW TO ASIC IN THE CORRECT DIRECTION
  drawslickfinal:
    ld a,(ix+ix_playermomentumx)
	cp 1 ; RIGHT
	jp z,drawslickright
    ; DRAW SLICK LEFT
	ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  	call dodrawflipimage2_compressed
	jr skipenemymovementalterations
  drawslickright:
    ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
	call dodrawnormalimage2_compressed
	jr skipenemymovementalterations
  
  ; UGG AND WRONGWAY UPDATE SPRITE IMAGE AS IT MOVES THROUGH THE JUMP!
  ; CHECK MOVE COUNTER AND UPDATE ACCORDINGLY
  ; THESE IMAGES ARE ROTATED 90 DEGREES INSTEAD OF BEING FLIPPED
  updateuggimage:
  ld a,(ix+ix_movecounter)
  cp 4
  jr z,drawugg2
  cp 8
  jr z,drawugg3
  cp 12
  jr z,drawugg2
  jr skipenemymovementalterations
  
  ; GET CORRECT UGG IMAGE
  drawugg2:
    ld hl,(ix+ix_playerspriteids+8)
	jr drawuggfinal
  drawugg3:
    ld hl,(ix+ix_playerspriteids+10)
  ; DRAW TO ASIC IN THE CORRECT DIRECTION
  drawuggfinal:
    ld a,(ix+ix_playermovedirection)
	cp 7 ; UGG UP
	jr z,drawslickright
	cp 9 ; WRONG WAY UP
	jr z,drawslickright
    ; DRAW ROTATED
  	call dodrawflipimage_rotate90
	jr skipenemymovementalterations
	
  updatewrongwayimage:
  ld a,(ix+ix_movecounter)
  cp 4
  jr z,drawwrongway2
  cp 8
  jr z,drawwrongway3
  cp 12
  jr z,drawwrongway2
  jr skipenemymovementalterations
  
  ; GET CORRECT UGG IMAGE
  drawwrongway2:
    ld hl,(ix+ix_playerspriteids+8)
	jr drawwrongwayfinal
  drawwrongway3:
    ld hl,(ix+ix_playerspriteids+10)
  ; DRAW TO ASIC IN THE CORRECT DIRECTION
  drawwrongwayfinal:
    ld a,(ix+ix_playermovedirection)
	cp 7 ; UGG UP
	jr	z,drawwrongwayjumpleft
	cp 9 ; WRONG WAY UP
	jr z,drawwrongwayjumpleft
    ; DRAW ROTATED
  	call dodrawflipimage_rotate90_wrongway
	jr skipenemymovementalterations
  drawwrongwayjumpleft:
    ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  	call dodrawnormalimage2_compressed
	jr skipenemymovementalterations
  
  drawcoilyhead:
  ld a,b
  sub 16
  ld b,a
  ld a,1 ;COILY HEAD ALWAYS NUMBER 1 SPRITE
  call moveplussprite2
  
  skipenemymovementalterations:
  
  ; =================================================================
  ;  COLLISION DETECTION
  ; -----------------------------------------------------------------
  
  ; UPDATE DESTINATION CUBE TO CURRENT CUBE ONCE WE PASS MIDPOINT
  
  ld a,(ix+ix_movecounter)
  cp 8
  jr nz,skipupdatecurrentcube
  
  ; SET DESTINATION CUBE AS CURRENT ONE
  ld a,(ix+ix_destplayercube)
  ld (ix+ix_currplayercube),a
  
  ; PLAY SOUND EFFECT EARLY SO BOUNCE SOUND HAPPENS WHEN WE CONTACT CUBE
  ; --------------------------------------------------------------------
  ld a,(ix+ix_npctype)
  ld hl,noisesbynpcid
  call vectortablelaunchcode
  
  skipupdatecurrentcube:
  
  ; ====================================================================
  
  ; IF CURRENT SPRITE IS PLAYER, CHECK IF HORIZONTAL POSITION IS SAME AS ANY OTHER SPRITE
  ; IF SO, CHECK IF CURRENT CUBE OCCUPIED IS SAME AS ANY OTHER SPRITE
  ; IF SO, WE HAVE COLLIDED
 
  ld a,(ix+ix_npctype)
  cp 10 ; POINTER - NO COLLISION DETECTION
  jp z,skipcollisiondetection
  or a ; PLAYER
  jr nz,spritecollisiondetection
  
  ; PLAYER COLLIDED WITH ENEMY
  
  ld bc,(currplayerposxyhires)
  ld a,(currplayerposy)
  ld d,a

  ; CHECK HORIZONTAL POSITION AGAINST ALL SPRITES
  ld iy,aspriteid
  call checkcollisionsprite1
  ld iy,a2spriteid
  call checkcollisionsprite1
  ld iy,a3spriteid
  call checkcollisionsprite1
  ld iy,a4spriteid
  call checkcollisionsprite1
  
  ; WE DIDN'T COLLIDE WITH ANY SPRITES
  jp skipcollisiondetection
  
  spritecollisiondetection:  
  
  ; ENEMY COLLIDED WITH PLAYER
  
  ld bc,(ix+ix_currplayerposxyhires)
  ld d,(ix+ix_currplayerposy)
  
  ld hl,(currplayerposxyhires)
  or a ; RESET ZERO FLAG
  sbc hl,bc
  jr nz,skipcollisiondetection
  ld a,(currplayerposy)
  cp d
  jp nz,skipcollisiondetection
  
  ; IF THIS IS DROP START WE NEED TO CHECK VERTICAL POSITION
  jr checknpctype_playercollision_ix
  
  skipcollisiondetection:
  
  ; CHECK IF WE LANDED ON SQUARE
  ld a,(ix+ix_movecounter)
  dec a
  ld (ix+ix_movecounter),a
  or a
  ret nz
  
  jp landedoncube
  
checkcollisionsprite1:
  ld a,(iy+ix_playeralive)
  or a
  ret z
  
  ; IF WE MATCHED VERTICAL POSITION, CHECK HORIZONTAL
  ld a,(iy+ix_currplayerposy)
  cp d
  ret nz
  
  ld hl,(iy+ix_currplayerposxyhires)
  sbc hl,bc
  ret nz
  jp checknpctype_playercollision_iy

killnpc_iy_greenball:
  call killsprite_iy
  jr continuekillgreenball
killnpc_ix_greenball:
  call killsprite_ix
  continuekillgreenball:
  call enablepaletteshiftgreenball
  call enablemusic_greenball
  ld a,255
  ld (greenballtimer-1),a
  
  ld bc,100
  call deductextralifepointscounter
  
  ld bc,&0100
  call doaddscorebcd
  jp printscore

checknpctype_playercollision_iy:
  ld a,(iy+ix_npctype)
  cp 4  ; GREEN BALL- HARMLESS, FREEZE ENEMIES, STOP SPAWN, RENDER HARMLESS, 100 POINTS, TIME LIMITED
  jr z,killnpc_iy_greenball
  cp 5  ; SLICK - HARMLESS
  jp z,killsprite_iy
  cp 6  ; SAM   - HARMLESS
  jp z,killsprite_iy
  ; HIT A PURPLE OR RED SPRITE
  jr playercollision
checknpctype_playercollision_ix:
  ld a,(ix+ix_npctype)
  cp 4  ; GREEN BALL - HARMLESS, FREEZE ENEMIES, STOP SPAWN, RENDER HARMLESS, 100 POINTS
  jr z,killnpc_ix_greenball
  cp 5  ; SLICK - HARMLESS
  jp z,killsprite_ix
  cp 6  ; SAM   - HARMLESS
  jp z,killsprite_ix
  ; HIT A PURPLE OR RED SPRITE
playercollision:
  ld a,0:greenballtimer ; IF ON TIMER, WE ARE INVULNERABLE
  or a
  ret nz

  ; IF GAME ATTRACT, DON'T DEDUCT LIVES
  ld a,(isautoplay)
  or a
  jr nz,skipdeductlives2
  
  ld a,(lives)
  dec a
  ld (lives),a
  call drawlivescounter
  
  skipdeductlives2:
  call doballcollisionnoise
  
  ; SET MENU TIMER
  ld bc,300
  call dodelay
  call displayswear

  ; SET MENU TIMER
  ld bc,600
  call dodelay
  call hideswear
  
  ; KILL SPRITE 
  call killsprite_ix
  ; PLAYER DIED
  ; KILL ALL ENEMIES
  call killallenemies
  
  ld a,(lives)
  or a
  jp z,showscoreboardentry
  
  ; --- HIDE SWEAR WORD -------------------------------------------
  
  ; RESET SPAWN TIMER SO ENEMIES DON'T SPAWN IMMEDIATELY WHEN WE REGENERATE
  xor a
  ld (interruptcounterspawnenemies),a
  
  ; RESET POSITION ON CUBE AFTER DEATH INCASE WE WERE JUMPING
  ld a,(lastplayercubex)
  ld (playerqubelocx),a
  ld a,(lastplayercubey)
  ld (playerqubelocy),a 
 
  ld bc,(lastplayercoordinatesx)
  ld a,(lastplayercoordinatesy)
  ld ix,spriteid
  call doresetplayerposition         ; RESET TO LAST CUBE POSITION
  
  ; IF PLAYING TWO PLAYER GAME, SWITCH PLAYERS
  ld a,(istwoplayer)
  or a
  ret z
  jp continueotherplayergame

; PTR TO CURRENT FUNCTION TO CLIP SPRITE IN LEAP OFF PYRAMID
; GETS INCREMENTED WITH EACH FRAME
clipplayerfunctionsptr: defw clipplayerfunctions

doqbert_right_clip8:
  call qbert_right_clip8
  jp skippyramidclipping
doqbert_right_clip9:
  call qbert_right_clip9
  jp skippyramidclipping
doqbert_right_clip10:
  call qbert_right_clip10
  jp skippyramidclipping
doqbert_right_clip11:
  call qbert_right_clip11
  jp skippyramidclipping
doqbert_right_clip12:
  call qbert_right_clip12
  jp skippyramidclipping
doqbert_right_clip13:
  call qbert_right_clip13
  jp skippyramidclipping

clipplayerfunctions:
  jp skippyramidclipping   ; 0
  jp skippyramidclipping   ; 1
  jp skippyramidclipping   ; 2
  jp skippyramidclipping   ; 3
  jp skippyramidclipping   ; 4
  jp skippyramidclipping   ; 5
  jp doqbert_right_clip8   ; 6
  jp doqbert_right_clip9   ; 7
  jp doqbert_right_clip10  ; 8
  jp doqbert_right_clip11  ; 9
  jp doqbert_right_clip12  ; 10
  jp doqbert_right_clip13  ; 11

; PTR TO CURRENT FUNCTION TO CLIP SPRITE IN LEAP OFF PYRAMID
; GETS INCREMENTED WITH EACH FRAME
clipcoilyfunctionsptr: defw clipcoilyfunctions

docoily_right_clip8:
  call coily_right_clip8
  jp skippyramidclipping  
docoily_right_clip9:
  call coily_right_clip9
  jp skippyramidclipping 
docoily_right_clip10:
  call coily_right_clip10
  jp skippyramidclipping 
docoily_right_clip11:
  call coily_right_clip11
  jp skippyramidclipping 
docoily_right_clip12:
  call coily_right_clip12
  jp skippyramidclipping 
docoily_right_clip13:
  call coily_right_clip13
  jp skippyramidclipping 
docoily_right_clip14:
  call coily_right_clip14
  jp skippyramidclipping 

clipcoilyfunctions:
  jp skippyramidclipping   ; 0
  jp skippyramidclipping   ; 1
  jp skippyramidclipping   ; 2
  jp skippyramidclipping   ; 3
  jp skippyramidclipping   ; 4
  jp skippyramidclipping   ; 5
  jp docoily_right_clip8   ; 6
  jp docoily_right_clip9   ; 7
  jp docoily_right_clip10   ; 8
  jp docoily_right_clip11   ; 9
  jp docoily_right_clip12   ; 10
  jp docoily_right_clip13   ; 11
  jp docoily_right_clip14   ; 12
   
; PLAY SOUND EFFECT OF BALL BOUNCING OF QBERT'S HEAD EARLY, BUT ONLY ONCE
   
donejumpnoisebigballmenu: defb 0
dojumpnoisebigballonce:
  ld a,(donejumpnoisebigballmenu)
  cp 1
  ret z
  call dojumpnoisebigball
  ld a,1
  ld (donejumpnoisebigballmenu),a
ret  
   
; USED FOR MOVING SPRITE IN PARABOLIC ARC OFF SCREEN

playingdeathleapplayer: defb 0
playingdeathleapcoily:  defb 0
moveplayersprite_parabolic:
  ; START LEAP SOUND IF COILY OR PLAYER
  ; ONLY IF SOUND HAS NOT STARTED ALREADY
  ld a,(ix+ix_npctype)
  or a ; PLAYER
  jr z,checkplayingdeathleapsoundplayer
  cp 3 ; COILY
  jr z,checkplayingdeathleapsoundcoily
  jr skip_checkplayingdeathleapsound
  
  checkplayingdeathleapsoundplayer:
  ld a,(playingdeathleapplayer)
  or a
  jr nz,skip_checkplayingdeathleapsound
  
  call dodeathleapnoise
  
  ld a,1
  ld (playingdeathleapplayer),a
  
  jr skip_checkplayingdeathleapsound
  
  checkplayingdeathleapsoundcoily:
  ld a,(playingdeathleapcoily)
  or a
  jr nz,skip_checkplayingdeathleapsound
  
  call dodeathleapnoise
  
  ld a,1
  ld (playingdeathleapcoily),a
 
  skip_checkplayingdeathleapsound:
  ld a,(ix+ix_gravityforcex)
  ; FIND IF POSITIVE OR NEGATIVE X GRAVITY
  bit 7,a ; NEGATIVE
  jr nz,movegravityleft
  ; POSITIVE GRAVITY RIGHT OR NO MOVEMENT
  ld a,(ix+ix_movexpixels)
  ld b,(ix+ix_gravityforcex)
  add b
  ld (ix+ix_movexpixels),a
  
  ld hl,(ix+ix_currplayerposxyhires)
  ld b,0
  ld c,a
  
  ; INCREASE X POS BY MOMENTUM - MOVING RIGHT 
  ld a,(ix+ix_playermomentumxdirection)
  or a ; MOVE LEFT
  jr z,movespriteleft
  add hl,bc
  jr movegravitydown
  
  movespriteleft:
  sbc hl,bc
  jr movegravitydown
  
  ; NEGATIVE GRAVITY MOVEMENT TO LEFT
  movegravityleft:
  ld a,(ix+ix_movexpixels)
  ld b,(ix+ix_gravityforcex)
  res 7,b
  add b
  ld (ix+ix_movexpixels),a
  
  ld hl,(ix+ix_currplayerposxyhires)
  ld b,0
  ld c,a
  
  ; DECREASE X POS BY MOMENTUM - MOVING LEFT
  sbc hl,bc
  movegravitydown:
  ld (ix+ix_currplayerposxyhires),hl
  ld a,(ix+ix_playermomentumy)
  ld b,(ix+ix_gravityforcey)
  add b
  ld (ix+ix_playermomentumy),a
  
  ; MOVEMENT UPDATED EVERY TWO FRAMES INSTEAD OF ONE
  ld a,(isqbertmenumovement)
  or a
  jr nz,skipslowparabolicjump
  ld a,(ix+ix_movedelay)
  xor 1
  ld (ix+ix_movedelay),a
  or a
  jr z,skipslowparabolicjump
  
  skipslowparabolicjump:
  
  ; DECREASE Y POS BY MOMENTUM - GOING DOWN
  ld a,(ix+ix_playermomentumy)
  ld c,a
  ld a,(ix+ix_currplayerposy)
  add c
  ld (ix+ix_currplayerposy),a
  
  ; -----------------------------------------------------------
  ; RED BALL STRIKES QBERT'S HEAD AT 17 PIXEL INERTIA IN MENU
  ld a,(isqbertmenumovement) ; ONLY REBOUND OFF HEAD IF WE ARE IN MENU!!!
  or a
  jr z,skipredballbounceffhead
  ld a,c
  cp 8
  call z,dojumpnoisebigballonce 
  cp 17
  jr nz,skipredballbounceffhead
  
  ; SET DIRECTION
  ld (ix+ix_isjumpingdir),1
  ; SET MOMENTUM
  ld (ix+ix_movexpixels),4
  ld (ix+ix_playermomentumy),-6
  ld (ix+ix_playermomentumx),1
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),1
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),1

  ; SET UP NEXT MENU MOVE FUNCTION  
  ld a,(menumovecounter)
  inc a
  ld (menumovecounter),a
  
  ; SET GRAPHIC TO HURT QBERT
  ld hl,(image_qbert_frontright_landed)
  xor a
  call drawnormalimage_fixedid_compressed
  jr skipobscureprite
  
  skipredballbounceffhead:
  ; NEED TO OBSCURE SPRITE AS IT PASSES BEHIND PYRAMID
  ; BUT ONLY IF JUMPING UP LEFT OR UP RIGHT
  ; STARTING AT MOMENTUM 8 FOR FEET AND GOING TO 14 INVISIBLE
  ; THEN WE NEED TO WORK OUT BASED ON SPRITE POSITION WHEN IT IS VISIBLE AGAIN AT BOTTOM OF SCREEN
  
  ld a,(ix+ix_isjumpingdir)
  cp 1 ; JUMPING DOWN, DON'T CLIP  
  jr nz,skippyramidclipping
  
  ld a,(ix+ix_npctype) ; ONLY CLIP FOR PLAYER AND COILY
  cp 3 ; COILY
  jr z,docoilyclip
  or a
  jr nz,skippyramidclipping

  ; START CLIP = FRAME 5 TO 10
  ld a,c
  or a
  jr nz,skipsetclipstarttable
  
  ; SET CLIPPING PTR TO START OF FRAME MOVEMENT
  ld hl,clipplayerfunctions
  ld (clipplayerfunctionsptr),hl
  
  skipsetclipstarttable:
  sub 11  ; MAX TABLE ENTRY FOR CLIP ROUTINES IS 10 FRAMES
  jr nc,skippyramidclipping

  ld hl,(clipplayerfunctionsptr)
  inc hl
  inc hl
  inc hl
  ld (clipplayerfunctionsptr),hl
  ld a,(ix+ix_playermomentumxdirection)
  jp (hl)
  
  ; START CLIP = 12 TO 18
  
  docoilyclip:
	ld a,c
	or a
    jr nz,skipsetclipstarttable_coily
	
	; SET CLIPPING PTR TO START OF FRAME MOVEMENT
    ld hl,clipcoilyfunctions
    ld (clipcoilyfunctionsptr),hl
	
	skipsetclipstarttable_coily:
	
    sub 12  ; MAX TABLE ENTRY FOR CLIP ROUTINES IS 18 FRAMES
    jr nc,skippyramidclipping

    ld hl,(clipcoilyfunctionsptr)
    inc hl
    inc hl
    inc hl
    ld (clipcoilyfunctionsptr),hl
    ld a,(ix+ix_playermomentumxdirection)
	ld b,(ix+ix_spriteid) ; WE NEED ID TO UPDATE CORRECT SPRITE
    jp (hl)
	
  skippyramidclipping:
  
  ; -----------------------------------------------------------
  skipobscureprite:
  ; MOVE SPRITE
  ld hl,(ix+ix_currplayerposxyhires)
  ld b,(ix+ix_currplayerposy)
  ld a,(ix+ix_spriteid)
  call moveplussprite2
  
  ; CHECK IF MOVING COILY, IF SO, DRAW HEAD SPRITE 16 ROWS ABOVE
  ld a,(ix+ix_npctype)
  cp 3
  jr nz,skipdrawcoilytop2
  ld a,b
  sub 16
  ld b,a
  ld a,1 ; COILY HEAD ALWAYS NUMBER 1
  call moveplussprite2
  skipdrawcoilytop2:

  ; CHECK IF OFF BOTTOM OF SCREEN, OR TOO FAR LEFT OR RIGHT
  ld a,(ix+ix_currplayerposy)
  sub 255-16;32
  jr nc,dokillsprite
  ld hl,(ix+ix_currplayerposxyhires)
  ld bc,16
  sbc hl,bc
  jr c,dokillsprite
  ld hl,(ix+ix_currplayerposxyhires)
  ld bc,640-32-16
  sbc hl,bc
  ret c
  
  dokillsprite:
  ; SPRITE OFF SCREEN - KILL SPRITE
  call killsprite_ix
  ; CHECK WHO DIED
  ld c,(ix+ix_npctype)
  ld a,c                  ; CHECK SPRITE ID TO SEE WHAT TO DO
  or a
  jr z,skipnpcdeathcode
  cp 3                    ; COILY, AWARD POINTS
  jr z,addcoilydeathpoints
  ret                     ; NPC DEATH, DO NOTHING
  skipnpcdeathcode:
  ; PLAYER DIED
  ; ALLOW PLAYER DEATH LEAP SOUND AGAIN
  xor a
  ld (playingdeathleapplayer),a

  call initsoundf ; CLEAR SOUND BUFFERS
  call doexplosionsound
  
  ; KILL ALL ENEMIES
  call killallenemies

  ; IF GAME ATTRACT, DON'T DEDUCT LIVES
  ld a,(isautoplay)
  or a
  jr nz,skipdeductlives
  
  ld a,(lives)
  dec a
  ld (lives),a
  call drawlivescounter
  
  ld a,(lives)
  or a
  jp z,displaygameover
  
  ; IF PLAYING TWO PLAYER GAME, SWITCH PLAYERS
  ld a,(istwoplayer)
  or a
  jr z,skipdeductlives
  
  continueotherplayergame:
  call switchplayer  
  ld ix,spriteid
  jp drawnewlevelclearscreen_nocleargridproperties ; WE NEED TO DRAW WHOLE PYRAMID IN CASE OTHER PLAYER IS IN DIFFERENT ROUND
  
  skipdeductlives:
  ld ix,spriteid
  jp drawlevelnoclearscreentoppyramid

addcoilydeathpoints:
  ; ALLOW COILY DEATH LEAP SOUND AGAIN
  xor a
  ld (playingdeathleapcoily),a
  ld bc,500
  call deductextralifepointscounter

  ld bc,&0500
  call doaddscorebcd
  jp printscore

killallenemies:
  ld ix,aspriteid
  call killsprite_ix
  ld ix,a2spriteid
  call killsprite_ix
  ld ix,a3spriteid
  call killsprite_ix
  ld ix,a4spriteid
  jp killsprite_ix

killsprite_iy:
  ; IF ALREADY DEAD, DON'T DO ANYTHING
  ld a,(iy+ix_playeralive)
  or a
  ret z
  
  ld a,(iy+ix_spriteid)
  ld (killspriteid-1),a
  ld (iy+ix_playeralive),0
  jr continuekillsprite
; KILL AND HIDE SPRITE FROM SCREEN
; INPUT
; IX = SPRITE DATA BLOCK
killsprite_ix:
  ; IF ALREADY DEAD, DON'T DO ANYTHING
  ld a,(ix+ix_playeralive)
  or a
  ret z
  ; IF PLAYER, DON'T DO ANYTHING
  ld a,(ix+ix_npctype)
  or a
  ret z
  ; IF POINTER, DON'T DO ANYTHING
  cp 10
  ret z
  
  ld a,(ix+ix_spriteid)
  ld (killspriteid-1),a
  ld (ix+ix_playeralive),0
  
  continuekillsprite:
  ld a,(ix+ix_npctype)
  ; CHECK IF COILY, IF SO, KILL HIS EXTRA LIFE VARIABLE, SO HE CAN APPEAR AGAIN
  cp 2
  jr nz,skipkillcoilyegg
  xor a
  ld (coilyalive-1),a
  ld (coilyeggmovecounter-1),a
  ld (coilyegghatchtimer-1),a
  jr skipkillcoily
  
  skipkillcoilyegg:
  cp 3
  jr nz,skipkillcoily
  xor a
  ld (coilyalive-1),a
  ld (coilyeggmovecounter-1),a
  ld (coilyegghatchtimer-1),a
  ld b,1

  call hideplussprite ; HIDE COILY'S HEAD

  skipkillcoily:
  
  ; HIDE FROM SCREEN
  ld b,0:killspriteid 
  call hideplussprite
  ; CLEAR SPRITE IN USE RECORD
  ld hl,spriteidsinuse
  ld c,b
  ld b,0
  add hl,bc
  ld (hl),b
ret

resetplayermomentum:
  ; CHECK DROPSTART VARIABLE - IF CLEAR, MOVE TO NORMAL MOVEMENT
  ld a,(ix+ix_dropstart)
  cp 1
  jr z,resetplayermomentum_dropstart

  xor a
  ; RESET PLAYER INPUT
  ld (ix+ix_playermovedirection),a  
  ; SET DIRECTION
  ld (ix+ix_isjumpingdir),a
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),a
  ld (ix+ix_playermomentumx),a
  ; DON'T MOVE HORIZONTALLY
  ld (ix+ix_movexpixels),2
  ld (ix+ix_movecounter),16
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),a
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),a
  ; SET DELAY FOR NPCS SO THEY DON'T MOVE TOO QUICKLY
  ld (ix+ix_movedelay),12
ret

resetplayermomentum_dropstart:
  ; RESET PLAYER INPUT
  xor a
  ld (ix+ix_playermovedirection),3
  ; SET DIRECTION DOWN
  ld (ix+ix_isjumpingdir),2
  
  ; SET MOMENTUM
  ld (ix+ix_playermomentumy),1
  ld (ix+ix_playermomentumx),a
  ; DON'T MOVE HORIZONTALLY
  ld (ix+ix_movexpixels),a
  ld (ix+ix_movecounter),16
  
  ; 1 = UP, 0 = DOWN
  ld (ix+ix_playermomentumydirection),a
  ; 1 = RIGHT, 0 = LEFT
  ld (ix+ix_playermomentumxdirection),a
  ; SET DELAY FOR NPCS SO THEY DON'T MOVE TOO QUICKLY
  ld (ix+ix_movedelay),12
ret

draw_downleft_wrongwaylanded:
  ld hl,(ix+ix_playerspriteids+4)
  call dodrawflipimage_rotate90_wrongway
  jp landedoncubecont2

draw_upleft_ugglanded:
  ld hl,(ix+ix_playerspriteids+4)
  jr dodrawnormalimage
draw_downleft_ugglanded:
  ld hl,(ix+ix_playerspriteids+4)
  call dodrawflipimage_rotate90
  jp landedoncubecont2

draw_upright_playerlanded:
  ld hl,(ix+ix_playerspriteids+2)
  jr dodrawnormalimage
draw_downright_playerlanded:
  ld hl,(ix+ix_playerspriteids+6)
  dodrawnormalimage:
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawnormalimage2_compressed
  jp landedoncubecont2
draw_upleft_playerlanded:
  ld hl,(ix+ix_playerspriteids+2)
  jr dodrawflipimage
draw_downleft_playerlanded:
  ld hl,(ix+ix_playerspriteids+6)
  dodrawflipimage:
  ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  call dodrawflipimage2_compressed
  jp landedoncubecont2

doblockcolourlevelscreen:
  ld hl,setblockcolour_levelscreen
  jr dosetblockcoloura
doblockcolournormal:
  ld hl,setblockcolour
  dosetblockcoloura:
  ld (blockcolourfunction1-2),hl
  ld (blockcolourfunction2-2),hl
ret

; COUNT CUBES COILY EGG LANDS ON SO WE CAN STOP AT BOTTOM
incrementcoilyeggcounter:
  ld a,(coilyeggmovecounter-1)
  inc a
  ld (coilyeggmovecounter-1),a
ret
;  jp dojumpnoisebigball

; WE NEED TO HIDE COILY'S HEAD SPRITE WHEN HE LANDS
hidecoilyhead:
  ; HIDE HEAD
  ld b,1; COILY HEAD ALWAYS NUMBER 1 SPRITE
  jp hideplussprite
 
donothing:
  ret
 
drawlandedspritetable:
  jp landedoncubecont2
  jp draw_upright_playerlanded
  jp draw_upleft_playerlanded
  jp draw_downright_playerlanded
  jp draw_downleft_playerlanded
  jp landedoncubecont2             ; FIRE BUTTON IN MENU
  jp draw_downleft_ugglanded       ; UGG AND WRONG WAY ROTATED 90 AND 240 DEGREES
  jp draw_upleft_ugglanded         ; UGG AND WRONG WAY ROTATED 90 AND 240 DEGREES
  jp draw_downleft_wrongwaylanded  ; UGG AND WRONG WAY ROTATED 90 AND 240 DEGREES
  jp draw_upleft_ugglanded         ; UGG AND WRONG WAY ROTATED 90 AND 240 DEGREES
 
landedoncube:
ifdef debugcoords
  ld hl,(ix+ix_currplayerposxyhires)
  call debugprinthl
  ld a,(ix+ix_currplayerposy)
  call debugprinta2num
endif
  ; RESET DROP START VARIABLE JUST IN CASE IT WAS SET
  ld (ix+ix_dropstart),0
  ; DRAW LANDED SPRITE
  ld c,(ix+ix_playermovedirection)
  ld hl,drawlandedspritetable
  ld b,0
  add hl,bc
  add hl,bc
  add hl,bc
  jp (hl)

  landedoncubecont2:
  call resetplayermomentum
  
  ; CHECK IF WE ARE PLAYER OR NPC
  ; NEED TO CHANGE OUTCOME TO CUBE DEPENDING ON WHAT NPC WE ARE
  ld a,(ix+ix_npctype)
  or a
  jr z,docolourcubecode
  cp 2  ; COILY EGG  - STOP AT BOTTOM AND HATCH
  jr z,incrementcoilyeggcounter
  cp 3  ; COILY SNAKE
  jr z,hidecoilyhead
  cp 5
  jr z,checkslicksamundocolourchange
  cp 6
  jr z,checkslicksamundocolourchange
  ;cp 8
  ;jr z,docolourcubecode ; DEBUG CHECK TO SEE WHICH CUBE UGG IS AFFECTING
  cp 10 ; GREEN POINTER IN MENU - DISPLAY RED UNDERSCORE
  jp z,showunderscoresprite
  ret   ; ANY OTHER SPRITE, DON'T AFFECT CUBE

  docolourcubecode:
  ; CHECK IF WE ARE JUST MOVING QBERT IN THE MENU
  ; IF SO, REVEAL MENU TEXT INSTEAD OF PAINTING CUBE
  ld a,(isqbertmenumovement)
  cp 1
  jp z,drawmenutext
  cp 2
  ret z ; SCOREBOARD NAME ENTRY

  ; STORE CURRENT PLAYER COORDINATES, SO IF WE DIE IN A COLLISION, THESE CAN BE RESTORED
  ; BUT ONLY IF WE ARE PLAYER
  ld a,(ix+ix_npctype)
  or a
  jr nz,skiprecordcurrentplayerlocation
  ld hl,(currplayerposxyhires)
  ld (lastplayercoordinatesx),hl
 
  ld a,(currplayerposy)
  ld (lastplayercoordinatesy),a
  
;  call debugprinthl
;  call debugprinta2num
  
  ld a,(playerqubelocx)
  ld (lastplayercubex),a
  ld a,(playerqubelocy)
  ld (lastplayercubey),a
  
  skiprecordcurrentplayerlocation:
  
  checkslicksamundocolourchange:
  
  ; RECORD THAT WE COLOURED CUBE
  ; SO WE KNOW WHEN LEVEL IS COMPLETE
  ld a,(ix+ix_currplayercube)
  sub 29
  jp nc,landedondisk
  add 29
  ld c,a
  ld hl,gridproperties
  ld l,a

  ld d,0 ; DON'T ENABLE SCORE CHANGE BY DEFAULT

  ; CHECK IF SLICK OR SAM LANDED ON CUBE
  ld a,(ix+ix_npctype)
  cp 5
  jr z,slickundocolourchange
  cp 6
  jr z,slickundocolourchange
  
  ; LEVEL HARDNESS
  ; CHECK MODE TO SEE IF WE WANT SINGLE COLOUR CUBES, DOUBLE COLOUR, TOGGLE, TOGGLE INTERMEDIATE, TOGGLE REVERSE
  ; COLOUR CUBE
;  push hl
;  call dojumpnoise
;  pop hl
  ld c,l
  
  ld a,(cubecolourchangemode)
  or a
  jr z,dosinglecolourchange
  dec a;cp 1
  jr z,dodoublecolourchange
  dec a;cp 2
  jr z,dotogglecolourchange
  dec a;cp 3
  jr z,dotogglecolourchangeintermediate
  dec a;cp 4
  jr z,dotogglecolourchangeintermediate2
  
  ; SLICK AND SAM UNDO COLOUR CHANGE
  slickundocolourchange:
  ld a,(hl)
  dec a
  cp 255
  ret z
  jr donetogglecube
  
  ; SINGLE COLOUR MODE
  
  dosinglecolourchange:
  ld a,(hl)
  cp 1
  ret z  
  inc a
  ld (hl),a
  call setblockcolour:blockcolourfunction1
  ; ADD SCORE
  ld d,1 ; AFFECT SCORE
  call addcubescore
  jp checklevelcomplete
  
  ; DOUBLE COLOUR MODE
  
  dodoublecolourchange:
  ld a,(hl)
  inc a
  cp 3
  ret z
  ld d,1 ; AFFECT SCORE
  jr donetogglecube
  
  ; TOGGLE SINGLE COLOUR MODE
  
  dotogglecolourchange:
  ld a,(hl)
  or a
  jr z,togglecubecolour
  dec a
  jr donetogglecube
  togglecubecolour:
  inc a
  ld d,1 ; AFFECT SCORE
  donetogglecube:
  ld (hl),a
  push af
  push de
  call setblockcolour:blockcolourfunction2
  pop de
  pop af
  cp 2
  jr z,addintermediatecubescore
  call addcubescore
  jp checklevelcomplete
  addintermediatecubescore:
  call addcubescoreintermediate
  jp checklevelcomplete
  
  ; TOGGLE DOUBLE COLOUR MODE, REHIT CAUSES TO GO BACK TO INTERMEDIATE
  
  dotogglecolourchangeintermediate:
  ld a,(hl)
  or a
  jr z,togglecubecolour
  cp 1
  jr z,togglecubecolour
  xor a
  jr togglecubecolour
  
  ; TOGGLE DOUBLE COLOUR MODE, REHIT CAUSES TO GO BACK TO NORMAL
  
  dotogglecolourchangeintermediate2:
  ld a,(hl)
  or a
  jr z,togglecubecolour
  cp 1
  jr z,togglecubecolour
  xor a
  jr donetogglecube
  
  ; UNDOES PLAYER COLOUR
  
  dotogglecolourchangeslicksam:
  ld a,(hl)
  dec a
  cp 255
  jr z,doresetcubecolour
  jr donetogglecube
  doresetcubecolour:
  xor a
  jr donetogglecube

addscoreroundcomplete:
  ld a,(round)
  ld b,a
  ld a,(level)
  rlca ; DOUBLE LEVEL TWICE TO GET CORRECT ROUND NUMBER
  rlca 
  add b
  sub 17
  jr nc,dodisplaybonus
  
  ; EXTRA 250 FOR EACH ROUND COMPLETED UP TO 5000
  ld bc,250
  call addbonusnormal ; KEEP TRACK OF CURRENT BONUS IN DECIMAL FORM

  ld bc,&0250
  call addbonusbcd

  ; ADD BONUS TO SCORE
  dodisplaybonus:
  
  ; CHECK IF WE NEED TO AWARD EXTRA LIFE
  ld bc,(currentbonusnormal)
  call deductextralifepointscounter
  
  ld bc,(currentbonusbcd)
  call doaddscorebcd
  ; DISPLAY BONUS
  ld a,3
  call txt_set_pen
  ld h,12
  ld l,6
  call my_txt_set_cursor
  ld hl,txt_bonusscore
  call printstring_oldnontransp
  
  ; DISPLAY BONUS FIGURE
  ld a,1
  call txt_set_pen
  ld h,18
  ld l,6
  call my_txt_set_cursor
  ld hl,(currentbonusbcd)
  ld a,h
  ld h,l
  ld l,a
  call doprintbcdinhl
  jp printscore ; MAKE SURE WE PRINT NEW SCORE AMOUNT
  
clearbonustext:
  ld h,12
  ld l,6
  call my_txt_set_cursor
  ld hl,txt_clearbonusscore
  jp printstring_oldnontransp
  
displaygameover:
  ; SET MENU TIMER
  ld hl,(timepleasehl)
  ld bc,1000
  add hl,bc
  ld (menutimerdelay),hl
  
  gameoverloop:
    ; CHECK TIME DELAY FOR DISPLAYING GAME OVER
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	jp z,showscoreboardentry
  
    call flashgameover
  jp gameoverloop

displayplayer1turn:
  ; SET MENU TIMER
  ld hl,(timepleasehl)
  ld bc,800
  add hl,bc
  ld (menutimerdelay),hl
  
  displayplayer1turnloop:
    ; CHECK TIME DELAY FOR DISPLAYING INSTRUCTIONS
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	jp z,clearsinglemessage
  
    call flashplayer1
  jp displayplayer1turnloop
  
displayplayer2turn:
  ; SET MENU TIMER
  ld hl,(timepleasehl)
  ld bc,800
  add hl,bc
  ld (menutimerdelay),hl
  
  displayplayer2turnloop:
    ; CHECK TIME DELAY FOR DISPLAYING INSTRUCTIONS
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	jp z,clearsinglemessage
  
    call flashplayer2
  jp displayplayer2turnloop
  
addcubescoreintermediate:
  ; CHECK IF COLOUR CHANGE HAS TO AFFECT SCORE
  ld a,d
  or a
  ret z

  ld bc,15
  call deductextralifepointscounter

  ld bc,&0015
  jr doaddscorebcd2
addcubescore:
  ; CHECK IF COLOUR CHANGE HAS TO AFFECT SCORE
  ld a,d
  or a
  ret z

  ld bc,25
  call deductextralifepointscounter

  ld bc,&0025
  doaddscorebcd2:
  ld a,(isqbertlevelscreenmovement) ; DON'T ADD SCORE IF WE ARE JUMPING IN A LEVEL SCREEN
  or a
  ret nz
  ld a,(isautoplay)                 ; OR AUTOPLAY
  or a
  ret nz

  ; ADD SCORE
  call doaddscorebcd
  jp printscore
  
; extralifebonusmilestone CONTAINS THE NEXT MILESTONE WE HAVE TO REACH TO GAIN EXTRA LIFE
; IT STARTS AT 8000, AND ONCE IT REACHES 0, WE AWARD EXTRA LIFE.
; IT GETS RESET TO 14000

; INPUT
; BC = SCORE IN ORDINARY FORMAT TO DEDUCT FROM EXTRA LIFE POINT COUNTDOWN
deductextralifepointscounter:
  ; CHECK FOR EXTRA LIFE BONUS
  ld hl,(extralifebonusmilestone)
  sbc hl,bc
  ld (extralifebonusmilestone),hl
  ret nc
  ; RESET POINT TARGET
  ld hl,extralifebonusamt2
  ld (extralifebonusmilestone),hl
  ld a,(lives)
  inc a
  ld (lives),a
  ; UPDATE LIVES COUNTER
  jp drawlivescounter

; BC = BONUS TO ADD IN DECIMAL FORMAT
addbonusnormal:
  ld hl,(currentbonusnormal)
  add hl,bc
  ld (currentbonusnormal),hl
ret

; BC = BONUS TO ADD IN BCD FORMAT
addbonusbcd:
  ld (extrabonusbcd),bc
  
  ld hl,extrabonusbcd
  ld de,currentbonusbcd
  or a ; CLEAR CARRY FLAG
  ld b,2
  jr addscorebcdagain
; INPUT
; BC = SCORE IN HEX FORMAT EG &25
doaddscorebcd:
  ld (scorebcdsource),bc
; ADD TWO BCD (DECIMAL NUMBERS DISPLAYED IN HEXADECIMAL FORM) NUMBERS TOGETHER
; INPUTS
;addscorebcd:
  ld hl,scorebcdsource
  ld de,scorebcd
  or a ; CLEAR CARRY FLAG
  ld b,4
  addscorebcdagain:
    ld a,(de)
    adc (hl)
    daa       ; CONVERT RESULT FROM DECIMAL 25 to HEX &25
    ld (de),a
    inc de
    inc hl
  djnz addscorebcdagain
ret  

; ==================================================
; SCORE BOARD
; --------------------------------------------------

congratulationstitle_big:  defb "HI THERE>",255
congratulationstitle_big2: defb "YOU DID IT>",255

isscoreboardmenu: db #00
; SCORES RECORDED RIGHT TO LEFT
scoreboardnames:  
  defb "CDP",255,&00,&30,&00,&00
  defb "JML",255,&00,&25,&00,&00
  defb "JAH",255,&00,&20,&00,&00
  defb "MJS",255,&50,&17,&00,&00
  defb "ECW",255,&00,&15,&00,&00
  defb "BLT",255,&50,&12,&00,&00
  defb "BMW",255,&00,&10,&00,&00
  defb "DMV",255,&50,&09,&00,&00
  defb "FDA",255,&00,&09,&00,&00
  defb "LMG",255,&25,&08,&00,&00
  defb "DDT",255,&00,&08,&00,&00
  defb "JCM",255,&75,&07,&00,&00
  defb "ZAP",255,&50,&07,&00,&00
  defb "NAB",255,&25,&07,&00,&00
  defb "JUN",255,&00,&07,&00,&00
  defb "HFR",255,&75,&06,&00,&00
  defb "RON",255,&50,&06,&00,&00
  defb "FXS",255,&25,&06,&00,&00
  defb "DLB",255,&00,&06,&00,&00
  defb "LEE",255,&75,&05,&00,&00
  defb "CPB",255,&50,&05,&00,&00
  defb "WBD",255,&25,&05,&00,&00
  defb "SAM",255,&00,&05,&00,&00
endscoreboardnames:
  
showscoreboard:
  ; IF TWO PLAYER GAME AND THIS IS PLAYER ONE'S TURN, WE NEED TO GO BACK TO GAME TO FINISH PLAYER TWO'S TURN
  ld a,(istwoplayer)
  or a
  jr z,skipchecktwoplayermode
  
  ; COPY PLAYER DATA TO PLAYER ONE AND TWO SPARE DATA AREAS 
  ld a,(currentplayer)
  cp 1
  jr z,checkplayer2data
  ld a,(playerdata_copy_player1) ; CHECK NUMBER OF LIVES LEFT OF OTHER PLAYER
  jr continuecheckplayerdata
  checkplayer2data:
  ld a,(playerdata_copy_player2)
  continuecheckplayerdata:
  ; CHECK LIVES LEFT
  or a
  jp nz,continueotherplayergame  ; GO BACK TO PLAYER TWO'S TURN

  skipchecktwoplayermode:
  ld a,1
  ld (isscoreboardmenu),a
  call hideallplussprites

  call splitscreen_allmode1
  call enablesplitpalettescoreboard ; ALLOW BIG LETTERS TO SHOW YELLOW COLOUR
 
  ; SET GRAPHIC
  ld hl,(image_qbert_frontright)
  xor a
  call drawflipimage_fixedid_compressed
  ld hl,(image_qbert_frontright)
  ld a,1
  call drawnormalimage_fixedid_compressed
  ; DRAW 2 QBERTS
  ld hl,256-64-32-16-8
  ld b,0
  xor a
  call moveplussprite2
  ld hl,256+64+32+8
  ld a,1
  call moveplussprite2
 
  ld hl,txt_setupscoreboard
  call printstring
  
  ; PRINT TOP SCORE NAME  
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ; PRINT TOP SCORE
  ld de,&8000+64+64+64+20+&0800+&0800+&0800+&0800+&0800+&0800
  ld hl,scoreboardnames
  call printlargeword
 
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  
  ; PRINT TOP SCORE
  xor a
  call txt_set_paper
  ld a,1
  call txt_set_pen
  ld hl,#1104
  call locatetextf
  ld d,h
  ld e,l
  ld hl,scoreboardnames+4 
  call printscoreboardscore
  
  ; PRINT 2nd TO LAST SCORES
  call printscorelist
  
  ; RESET SCORE IN CASE WE HAVE ENTERED IT IN SCOREBOARD
  ld hl,0
  ld (scorebcd),hl
  ld (scorebcd+2),hl

  ; SET MENU TIMER
  ld hl,(timepleasehl)
  ld bc,1200
  add hl,bc
  ld (menutimerdelay),hl
  
  ld ix,spriteid ; LOAD SPRITE DATABLOCK INTO IX
  scoreboardloop:
    ; CHECK TIME DELAY FOR DISPLAYING INSTRUCTIONS
    ld a,(timepleasehl+1)
	ld c,a
    ld a,(menutimerdelay+1)
    cp c
	jp z,resetgame

    call doflashranks
  jr scoreboardloop
  
scorey:  defb 0
scorex:  defb 0
scorey2: defb 0
scorex2: defb 0
rownum2: defb 0
nameptr: defw 0
 
printscorelist:
  ; COORDINATES OF SCORE TEXT
  ld hl,&0209
  ld (scorey),hl
  ld hl,&1009
  ld (scorey2),hl
  
  ld a,2
  ld (rownum2),a
  ld hl,scoreboardnames+8
  ld (nameptr),hl
  
  ld b,11
  printscorelistloop:
    push bc
	
	; PRINT LEFT NAME
	
    ld hl,(scorey) ; SET ROW LOCATION
    call doprintscoreline
	; MOVE TO NEXT ROW
	ld hl,scorey   ; INC LOCATION
	inc (hl)
	inc (hl)
	
	; MOVE TO NEXT SCORE
	ld hl,(nameptr)
	ld bc,8
	add hl,bc
	ld (nameptr),hl
	
	; INC ROW NUM
	ld hl,rownum2
	inc (hl)
	
	; PRINT RIGHT NAME
	
	ld hl,(scorey2) ; SET ROW LOCATION
	call doprintscoreline
    ; MOVE TO NEXT ROW
	ld hl,scorey2   ; INC LOCATION
	inc (hl)
	inc (hl)
	
	; MOVE TO NEXT SCORE
	ld hl,(nameptr)
	ld bc,8
	add hl,bc
	ld (nameptr),hl
	
	; INC ROW NUM
	ld hl,rownum2
	inc (hl)
	
	pop bc
  djnz printscorelistloop
ret



doclearscoreline:
  call my_txt_set_cursor
  ld hl,txt_printscoreempty
  jp printstring_oldnontransp
  
doprintscoreline:
  call my_txt_set_cursor
  ld a,1
  call txt_set_pen
  
  ld a,(rownum2)
  ld h,0
  ld l,a
  call convwordtostr
  ld hl,wordtostr2
  call printstring_oldnontransp
  
  ld a,3
  call txt_set_pen
  ld a,")"
  call my_txt_output
  ld a,2
  call txt_set_pen
  ld hl,(nameptr)
  call printstring_oldnontransp
  ld a,1
  call txt_set_pen
  ld a," "
  call my_txt_output
  inc hl
  jp printscoreboardscore
 
doprinttopscoreline:
  call my_txt_set_cursor
  ld a,1
  call txt_set_pen
  ld hl,(nameptr)
  inc hl
  inc hl
  inc hl
  ;call printstring_oldnontransp
  ;ld a,1
  ;call txt_set_pen
  ld a," "
  call my_txt_output
  inc hl
  jp printscoreboardscore
timer: defb 0
pointerposy: defb 0
pointerposx: defb 0
playerinitials:          defb "   ",255
playerintiialsunderline: defb "---  ",255
playerinitialsptr:       defw playerinitials
playerinitialscount:     defb 0

ranklocationtable:
  defw 0      ; 0
  defw &1105  ; 1
  defw &0209  ; 2
  defw &1009  ; 3
  defw &020b  ; 4
  defw &100b  ; 5
  defw &020d  ; 6
  defw &100d  ; 7
  defw &020f  ; 8
  defw &100f  ; 9
  defw &0211  ; 10
  defw &1011  ; 11
  defw &0213  ; 12
  defw &1013  ; 13
  defw &0215  ; 14
  defw &1015  ; 15
  defw &0217  ; 16
  defw &1017  ; 17
  defw &0219  ; 18
  defw &1019  ; 19
  defw &0221  ; 20
  defw &1021  ; 21
  defw &0223  ; 22
  defw &1023  ; 23

flashranktoggle: defb 0

doflashranks:
  ; USE TWO TIMERS TO SLOW FLASHING MESSAGE
  ld a,(flashmessagetimer)
  dec a
  ld (flashmessagetimer),a
  or a
  ret nz
  ld a,250
  ld (flashmessagetimer),a
  
  ld a,(flashmessagetimer2)
  dec a
  ld (flashmessagetimer2),a
  or a
  ret nz
  ld a,40
  ld (flashmessagetimer2),a

  ld a,(flashranktoggle)
  xor 1
  ld (flashranktoggle),a
  
  ld a,(rankp1)
  call flashrank
  ld a,(rankp2)
  
  ; INPUT
  ; A = RANK TO FLASH
  flashrank:
  or a
  ret z
  cp 24
  ret z
  cp 25  ; IN CASE DEMOTED PLAYER 1 MOVES PAST END OF RANK
  ret z
  
  ; SET ROW NUM
  ld (rownum2),a
  ; SET NAME PTR
  ld hl,scoreboardnames
  ld b,0
  dec a
  rlca
  rlca
  rlca
  ld c,a
  add hl,bc
  ld (nameptr),hl

  ; GET RANK POSITION ON SCREEN IN HL
  ld hl,ranklocationtable
  ld b,0
  ld a,(rownum2)
  rlca 
  ld c,a
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a

  ld a,(flashranktoggle)
  or a
  jr z,showrank
  
  ; CLEAR RANK
  ld a,(rownum2)
  jp doclearscoreline
  showrank:
  ; PRINT RANK
  ld a,(rownum2)
  cp 1
  jp z,doprinttopscoreline
  jp doprintscoreline
  
showscoreboardentry:
  call disablezerotinterrupt
  call setbgblack                    ; RESET COLOURS IN CASE GREEN BALL WAS ACTIVATED
  xor a
  ld (greenballtimer-1),a
  ld (playermovedcursor-1),a         ; RESET SOUND VARIABLE SO SOUND SOUNDS WHEN PLAYER MOVES CURSOR FOR FIRST TIME
	
  ld a,(currentplayer)
  cp 2
  jr z,calculateplayer2rank
  call calculaterank
  ld a,(currentrank)                 ; RECORD PLAYER 1 AND 2 RANKS SEPATELY SO WE CAN FLASH APPROPRIATE ENTRIES IN SCOREBOARD
  ld (rankp1),a
  jr finishedcalculaterank
  calculateplayer2rank:
  ; CHECK IF WE REACHED HIGH SCORE
  call calculaterank
  ld a,(currentrank)                 ; RECORD PLAYER 1 AND 2 RANKS SEPATELY SO WE CAN FLASH APPROPRIATE ENTRIES IN SCOREBOARD
  ld (rankp2),a
  
  ; IF SECOND PLAYER 2 RANK IS HIGHER OR EQUAL TO PLAYER 1
  ; WE NEED TO INCREMENT PLAYER 1 SO THEY MOVE DOWN A RANK
  ld a,(rankp2)
  ld b,a
  ld a,(rankp1)
  sub b
  jr nc,demoteplayer1
  jr skipdemoteplayer1
  
  demoteplayer1:
  ld hl,rankp1
  inc (hl)
  skipdemoteplayer1:
  ld a,(rankp2)
  
  finishedcalculaterank:
  cp 24                  ; NO, JUST SHOW SCOREBOARD
  jp z,showscoreboard
  
  ; WE REACHED HIGH SCORE
  ld a,1
  ld (isscoreboardmenu),a
  ld a,2
  ld (isqbertmenumovement),a

  ld a,30
  ld (timer),a
  
  call hideallplussprites

  ; GET CORRECT COLOURS FOR SPRITES
  call enablescoreboardtimer
  call splitscreen_allmode1
  call enablesplitpalettescoreboard ; ALLOW BIG LETTERS TO SHOW YELLOW COLOUR
  
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ld de,&8000+64+64+64+64+64+64+64+64+64+64+64+12+8+2
  call drawqbertlogo
  
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c  

  ; MOVE RUB SYMBOL TO BUFFER
  ld hl,image_rub		
  ld a,1;&42
  call copyspritefromunderasictoasic
  ld hl,image_rub		
  ld a,2;&42
  call copyspritefromunderasictoasic
  ld hl,image_end		
  ld a,3;&42
  call copyspritefromunderasictoasic
  ld hl,image_end		
  ld a,4;&42
  call copyspritefromunderasictoasic
  
  ; RUB AND END SPRITES
  ; COPY SPRITE IMAGE FROM BUFFER TO ASIC
  ld hl,(image_greenball_squash)
  xor a
  call drawnormalimage_fixedid_compressed

  ld de,&4500
  call clearasicsprite
  ld de,&4500
  ld hl,(image_red_underline)
  ld bc,16*2
  ldir
  ; POINTER
  ; NEED TO UPDATE IMAGE OF GREEN BALL FOR SPRITE
  ld ix,spriteid
  ld d,4
  call copyspriteptrsbynpcid  
  ld (ix+ix_playeralive),1
 
  ld a,(currentrank)
  cp 1
  jr nz,skipprintsupreme
  
  ld hl,txt_highscoreboard_supreme
  call printstring
  
  ; PRINT TOP SCORE NAME  
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ; PRINT TOP SCORE
  ld de,&8000+64+10+&0800+&0800+&0800
  ld hl,congratulationstitle_big2
  call printlargestring
  
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  
  jp printscoreentrytext
  
  skipprintsupreme:
  ld hl,txt_highscoreboard
  call printstring
  ld hl,txt_highscoreboard2
  call printstring
  
  ; PRINT RANK NUMBER
  ld h,0
  ld a,(currentrank)
  ld l,a
  call convwordtostr
  ld a,1
  call txt_set_pen
  ld h,23
  ld l,7
  call my_txt_set_cursor
  
  ; LEFT ALIGN RANK NUMBER  
  ld a,(currentrank)
  sub 10
  jr nc,rightalignrank
  ld hl,wordtostr+4
  jr printrank
  rightalignrank:
  ld hl,wordtostr+3
  printrank:
  call printstring_oldnontransp  
  
  ; PRINT RANK REMARKS
  ld a,3
  call txt_set_pen
  ld h,4
  ld l,9
  call my_txt_set_cursor
  
  ; PRINT TOP SCORE NAME  
  ;; page-out asic registers
  ld bc,&7fa0
  out (c),c
  
  ld a,(currentrank)
  ld hl,(congratulationsposition)
  ld b,0
  rlca
  ld c,a
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  call printstring_oldnontransp  
 
  ; PRINT TOP SCORE
  ld de,&8000+64+15;+&0800+&0800+&0800;+&0800+&0800+&0800
  ld hl,congratulationstitle_big
  call printlargestring
  
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c
  
  ; DISPLAY RUB END SPRITES INSTRUCTIONS
  ld hl,256-64-64-64+32+8
  ld b,100-4+8
  ld a,1
  call moveplussprite2
  ld hl,256+64+8
  ld a,3
  call moveplussprite2
  
  ; PRINT PLAYER ONE/TWO IF TWO PLAYER GAME
  ld a,(istwoplayer)
  or a
  jr z,skipscoreentrytext
  
  printscoreentrytext:
  
  ld h,20-6-1
  ld l,2+3
  call my_txt_set_cursor
  ld a,3
  call txt_set_pen
  ld hl,txt_player
  call printstring_oldnontransp
  ld a,(currentplayer)
  add 48 ; CONVERT PLAYER NUMBER TO ASCII
  call my_txt_output
  
  skipscoreentrytext:

  ; DISPLAY RUB END SPRITES KEYBOARD
  ld hl,256+32+16+11
  ld b,196-4
  ld a,2
  call moveplussprite2
  ld hl,256+32+16+11+64
  ld a,4
  call moveplussprite2

  ld a,2
  call txt_set_pen

  ld hl,txt_highscoreboard3
  call printstring
  
  ; PRINT PLAYER INITIALS UNDERLINE
  call printplayerinitials
  call drawplayerinitialunderline
  
  ld ix,spriteid ; LOAD SPRITE DATABLOCK INTO IX
  call resetplayerpositiontoppyramid_scoreboardentry
  call showunderscoresprite

  scoreboardloop2:
    ld a,(timer)
	or a
	jp z,finishscoreboardentry
  
    ld a,(mummymovementok)
    or a
    jr nz,skipdomovements2a
    ld a,1
    ld (mummymovementok),a	
    ; CHECK TIME DELAY

    call drawmenutimer ; DRAW TIMER IF TICK HAS TUCK

    call checkplayerinput
    call domovements_scoreboard
	skipdomovements2a:
  jr scoreboardloop2

calculaterank:
  ; START AT 1
  ld hl,currentrank
  ld (hl),1

  ld hl,scoreboardnames
  
  ld b,23
  calcrankloop:
    push bc
	push hl

    ; MOVE TO SCORE BCD	IN LIST
	ld bc,7   ; COMPARE RIGHT TO LEFT SCORE
	add hl,bc
	
	; COMPARE
	ld de,scorebcd+3
	call comparebcd
	jr nc,foundrank

    ld hl,currentrank
	inc (hl)

    pop hl
    ld bc,8   ; MOVE NEXT SCORE
	add hl,bc
	
	pop bc
  djnz calcrankloop
  ; WE DIDN'T MAKE THE LIST - RANK = 24
ret
foundrank:
  pop hl
  pop bc
ret

; COMPARE TWO BINARY CODED DECIMAL STRINGS
; INPUT
; HL = STRING BEING CHECKED
; DE = STRING TO COMPARE
comparebcd:
  or a       ; CLEAR CARRY
  ld b,4     ; LENGTH TO COMPARE
  docomparebcd:
    ld a,(de)
    cp (hl)
    ret c
    ret nz
    dec de
    dec hl
  djnz docomparebcd
  or a ; CLEAR CARRY
ret  

; MAKE ENTRY IN SCOREBOARD
; MOVE BELOW ENTRIES DOWN ONE ROW
; ERASE OLD ENTRY AND ENTER NEW SCORE
makenewscoreentry:
  ; ONLY IF WE MADE THE TABLE
  ld a,(currentrank)
  cp 24
  ret z
  cp 23 ; LAST IN LIST, DON'T MOVE SCORES LIST DOWN!
  jr nz,continuemovescoreslist
  ld hl,endscoreboardnames-8
  jr insertscoreinlist2
  continuemovescoreslist:
  ld hl,endscoreboardnames-8-8
  ld de,endscoreboardnames-8
  ld b,a
  ld a,23 ; GET REMAINDER OF SCORES TO MOVE
  sub b
  ld b,a
  copyloop:
    push bc
	; COPY TEXT
	ld bc,8
	ldir
	; MOVE HL AND DE UP TO NEXT RECORD TO COPY DOWN
	ld bc,8
	sbc hl,bc
	sbc hl,bc
	ex de,hl
	sbc hl,bc
	sbc hl,bc
	ex de,hl
	pop bc
  djnz copyloop  
  ; MOVE TO SPACE WE HAVE MADE
  ld bc,8
  add hl,bc
  ; COPY PLAYER INITIALS
  insertscoreinlist2:
  ld de,playerinitials
  ex de,hl
  ld bc,3
  ldir
  inc de
  ; COPY NEW SCORE IN PLACE
  ld hl,scorebcd
  ld bc,4
  ldir
ret
  
drawmenutimer:
  ld a,(dodrawtimer) ; ONLY UPDATE TIMER IF TICK HAS TUCK
  or a
  ret z
  xor a
  ld (dodrawtimer),a ; RESET BOOLEAN
  ; DRAW TIMER
  ld h,0
  ld a,(timer)
  ld l,a
  call convwordtostr
  ld a,1
  call txt_set_pen
  ld de,&86D2
  ld hl,wordtostr2
  jp printstring_oldnontransp_de ; MUST USE HARDCODED LOCATION IN INTERRUPT, OR IT MESSES WITH TEXT

landedondisk:
  call enablemusic_disk
  call enablepaletteshiftbgdisk

  call clearqubeidfromgrid ; ERASE DISK OBJECT FROM MAP
  ld (moveqbertondiskvariable),a
  ; WORK OUT WHICH DISK WE LANDED ON, LEFT OR RIGHT BASED ON UNIQUE ID
  sub 40
  jr nc,domovedisk
  add 10
  
  ; MOVE DISK TO UNDERNEATH PLAYER
  domovedisk:
  ; DEDUCT FROM 16 SO SPRITE IS LAST IN LIST AND APPEARS BEHIND OTHER SPRITES
  ld b,a
  ld a,16
  sub b
  
  ld d,a
  
  ; SET TIME DELAY FOR DISK DISAPPEARANCE
  ld a,120
  ld (moveqbertondiskvariabledelay),a
  
  ld hl,(currplayerposxyhires)
  ld (qbertdiskmovespritexpos),hl  ; STORE POSITION OF DISK SO WE CAN MOVE IT LATER
  ld a,(ix+ix_currplayerposy)
  add 6 ; CENTRE DISK BELOW PLAYER
  ld (qbertdiskmovespriteypos),a   ; STORE POSITION OF DISK SO WE CAN MOVE IT LATER
  ld b,a
  
  ld a,d
  ld (qbertdiskmovespriteid),a     ; STORE SPRITE ID SO WE CAN MOVE TO TOP

  jp moveplussprite2

moveqbertondiskvariable: defb 0      ; ID OF DISK QBERT LANDED ON
moveqbertondiskvariabledelay: defb 0 ; DELAY BEFORE WE ALLOW DISK TO DISAPPEAR
qbertdiskmovespriteid:   defb 0
qbertdiskmovespritexpos: defw 0
qbertdiskmovespriteypos: defb 0
qbertdiskmoveypixels:    defb 1 
  
moveqbertondisk:
  ld a,(moveqbertondiskvariable)
  or a
  ret z
  cp 255
  jr z,dodiskdisappearancetimer
 
  ; WORK OUT WHICH DISK WE LANDED ON, SO WE KNOW TO MOVE SPRITES LEFT OR RIGHT
  sub 40 ; LEFT
  jr c,moveqbertondiskleft
  
  ; MOVE QBERT ON DISK RIGHT
  ld hl,(ix+ix_currplayerposxyhires)
  dec hl
  dec hl
  ld (ix+ix_currplayerposxyhires),hl  
  ; MOVE DISK
  ld hl,(qbertdiskmovespritexpos)
  dec hl
  dec hl
  ld (qbertdiskmovespritexpos),hl 
  jr skipmovemoveqbertondiskleft
  
  moveqbertondiskleft:
  
  ld hl,(ix+ix_currplayerposxyhires)
  inc hl
  inc hl
  ld (ix+ix_currplayerposxyhires),hl
  ; MOVE DISK
  ld hl,(qbertdiskmovespritexpos)
  inc hl
  inc hl
  ld (qbertdiskmovespritexpos),hl 
 
  skipmovemoveqbertondiskleft:
  
  ; ALTERNATE NUMBER OF Y PIXELS TO MOVE BETWEEN 1 AND 2 SO WE GET TO TOP MIDDLE CUBE
  ld a,(qbertdiskmoveypixels)
  inc a
  cp 2
  jr z,skipresetqbertdiskmoveypixels
  ld a,1
  skipresetqbertdiskmoveypixels:
  ld (qbertdiskmoveypixels),a
  
  ; MOVE VERTICAL PIXELS
  ld b,a
  ; MOVE QBERT
  ld a,(ix+ix_currplayerposy)
  sub b
  ld (ix+ix_currplayerposy),a
  ; MOVE DISK
  ld a,(qbertdiskmovespriteypos)
  sub b
  ld (qbertdiskmovespriteypos),a
  
  ; MOVE HORIZONTAL PIXELS - SPRITES - QBERT
  ld hl,(ix+ix_currplayerposxyhires)
  ld a,(ix+ix_currplayerposy)
  ld b,a
  xor a
  call moveplussprite2
  ; MOVE HORIZONTAL PIXELS - SPRITES - DISK
  ld hl,(qbertdiskmovespritexpos)
  ld a,(qbertdiskmovespriteypos)
  ld b,a
  ld a,(qbertdiskmovespriteid)
  call moveplussprite2
  
  ; STOP MOVEMENT WHEN WE REACH TOP OF SCREEN
  ld a,(qbertdiskmovespritexpos)
  cp -16
  ret nz
  
  call playemptymusic ; STOP MUSIC PLAYING NICELY WHEN WE REACH TOP WITHOUT CUTTING NOTES
  
  dodiskdisappearancetimer:
  ld a,255 ; MARK THAT WE REACHED TOP
  ld (moveqbertondiskvariable),a
  
  ; START COUNTER TO DISK DISAPPEARANCE
  ld a,(moveqbertondiskvariabledelay)
  dec a
  ld (moveqbertondiskvariabledelay),a
  or a
  ret nz
  
  call disablemusic
  
  xor a
  ld (moveqbertondiskvariable),a
  ; WE REACHED THE TOP - REMOVE DISK FROM SCREEN AND MEMORY
  ld a,(qbertdiskmovespriteid)
  ld b,a
  call hideplussprite
  
  ld a,(disksonscreen-1)
  dec a
  ld (disksonscreen-1),a
  
  ; RESET SPAWN TIMER SO ENEMIES DON'T SPAWN IMMEDIATELY WHEN WE DROP
  xor a
  ld (interruptcounterspawnenemies),a
  
  ; MAKE FALLING SOUND
  call dodropstartnoise
  jp resetplayerpositiontoppyramid

; THE REQUIRED COLOUR THAT COMPLETES THE LEVEL

checklevelcomplete:
  ld a,1:changecubecolour
  ld hl,gridproperties+1
  ld b,28
  checklevelcompleteloop:
    cp (hl)
	ret nz ; LEVEL NOT COMPLETE, WE HAVE A CUBE THAT IS THE WRONG COLOUR
	inc l
  djnz checklevelcompleteloop
 
  advancenextroundorlevel:
  ; LEVEL COMPLETE
  call advanceround
  jp c,drawlevelscreen ; SHOW LEVEL SCREEN IF WE HAVE ADVANCED A LEVEL
  jp drawnewlevel      ; JUST GO TO NEXT ROUND SCREEN

; TEXTS REVEALED BY QBERT IN THE MAIN MENU
menutexttable:
  defw 0            ; START AT 1
  defw txt_instr1
  defw txt_instr2
  defw txt_instr3
  defw txt_instr4
  defw txt_instr5

; DRAW MENU TEXT IN MENU INSTEAD OF PAINTING QUBE WHEN QBERT LANDS
drawmenutext:
  ld a,(menumovecounter)
  ld hl,menutexttable
  call vectorlookuphl
  jp printstring

moveoddevenmummies: defb 0

; CONVERT A 16 BIT HEX TO STRING - EG FOR PLAYER MONEY
; INPUTS
; HL = NUMBER TO CONVERT
convwordtostr:
  ld bc,10000
  call convwordtostrloop
  ld (wordtostr+0),a  ; SAVE RESULT IN STRING
  ld bc,1000
  call convwordtostrloop
  ld (wordtostr+1),a  ; SAVE RESULT IN STRING
  ld bc,100
  call convwordtostrloop
  ld (wordtostr+2),a  ; SAVE RESULT IN STRING
  ld bc,10
  call convwordtostrloop
  ld (wordtostr+3),a  ; SAVE RESULT IN STRING
  ld a,l
  add 48
  ld (wordtostr+4),a  ; SAVE RESULT IN STRING
  
  ; REMOVE LEADING ZEROES
  ld a,(wordtostr)
  cp "0"
  ret nz
  ld a," "
  ld (wordtostr),a
  
  ld a,(wordtostr+1)
  cp "0"
  ret nz
  ld a," "
  ld (wordtostr+1),a

  ld a,(wordtostr+2)
  cp "0"
  ret nz
  ld a," "
  ld (wordtostr+2),a
  
  ld a,(wordtostr+3)
  cp "0"
  ret nz
  ld a," "
  ld (wordtostr+3),a
ret

getleftalignwordtostr:
  ld hl,wordtostr
  ld a,(hl)
  cp " "
  ret nz
  inc hl
  ld a,(hl)
  cp " "
  ret nz
  inc hl
  ld a,(hl)
  cp " "
  ret nz
  inc hl
  ld a,(hl)
  cp " "
  ret nz
  inc hl
ret


convwordtostrnormal:
  ld bc,10000
  call convwordtostrloop
  ld (wordtostr+0),a  ; SAVE RESULT IN STRING
  ld bc,1000
  call convwordtostrloop
  ld (wordtostr+1),a  ; SAVE RESULT IN STRING
  ld bc,100
  call convwordtostrloop
  ld (wordtostr+2),a  ; SAVE RESULT IN STRING
  ld bc,10
  call convwordtostrloop
  ld (wordtostr+3),a  ; SAVE RESULT IN STRING
  ld a,l
  add 48
  ld (wordtostr+4),a  ; SAVE RESULT IN STRING
ret

; INPUTS
; BC = TENS HUNDREDS UNIT TO CHECK FOR
convwordtostrloop:
  xor a      ; RESET COUNTER
  convwordtostrloop2:
    sbc hl,bc
    inc a
  jr nc,convwordtostrloop2
  add hl,bc
  dec a
  add 48               ; CONVERT TO ASCII
ret

wordtostr:  defb 0,0
wordtostr2: defb 0,0,0,255

; ====================================================
; NORMAL NON GAME MOVEMENT
; ----------------------------------------------------


; GET RANDOM RESULT FROM RANGE BASED ON TIMER
; a = TOP RANGE NUMBER
getrandomnumber:
  ld de,(currenttime)
  call l7d78
  push hl
  ld e,75;#4b
  ld a,(currenttime)
  call l7d78
  ld de,#004b
  add hl,de
  ld de,#0101
  xor a
  l7d6b:
  sbc hl,de
  jr c,l7d71
jr l7d6b

l7d71:
  add hl,de
  dec hl
  ld (currenttime),hl
  pop af
ret

l7d78:
  ld h,a
  ld l,0
  ld d,l
  ld b,8
  l7d7e:
    add hl,hl
    jr nc,l7d82
    add hl,de
    l7d82:
  djnz l7d7e
ret


; INPUT
; HL = STRING TO PRINT AT GFX POS
printstring_old:
  ;ld b,(hl) ; NUMBER OF CHARS
    ;inc hl
    ld a,(hl)
	bit 7,a;cp 255
    ret nz
    call my_txt_outputtransp
	inc hl
  jr printstring_old
; INPUT
; HL = STRING TO PRINT AT GFX POS
printstring_oldnontransp:
  ;ld b,(hl) ; NUMBER OF CHARS
    ;inc hl
    ld a,(hl)
	bit 7,a;cp 255
    ret nz
    call my_txt_output
	inc hl
  jr printstring_oldnontransp
printstring_oldnontransp_de:
  ;ld b,(hl) ; NUMBER OF CHARS
    ;inc hl
    ld a,(hl)
	bit 7,a;cp 255
    ret nz
    call my_txt_output_de
	inc hl
  jr printstring_oldnontransp

; =============================================================
; MY INTERRUPT AND KEYBOARD FUNCTIONS
; -------------------------------------------------------------

interruptcountermummies:defb 0
interruptcounterspawnenemies: defb 0
interruptcounter2:      defb 0
interruptcounter3:      defb 0
interruptcounter4:      defb 0
interrupt_stack:        defs 256
interrupt_stack_start:

timepleasehl:           defw 0
timepleasede:           defw 0

matrix_buffer:          defb 255,255,255,255,255,255,255,255,255,255;10  ;map with 10*8 = 80 key status bits (bit=0 key is pressed)
charbuffer:             defb 0   ; RETAIN LAST CHAR PRESSED FROM KEYBOARD ROUTINE
keyrelease:             defb 0   ; HAS PLAYER RELEASED KEY?

interrupttableptr:      defw interrupttable
interrupttable:
  jp fiftiethofasecondinterrupt5a ; PLAY A CHANNEL
  jp fiftiethofasecondinterrupt4a ; READ KEYBOARD
  jp fiftiethofasecondinterrupt3a ; PLAY C CHANNEL
  jp fiftiethofasecondinterrupt2a ; GAME SPEED DELAY
  jp fiftiethofasecondinterrupt1a ; PLAY B CHANNEL
  jp fiftiethofasecondinterrupt  ; PLAY MUSIC


mc_wait_flyback:
  ; WAIT FLYBACK
  ld b,&f5
  v1b3:
  in a,(c)
  rra
  jr nc,v1b3
ret
  
installinterrupt:
  ld a,&C3; JP
  ld hl,&0038
  ld (hl),a
  inc hl
  ld bc,myinterrupt
  ld (hl),c
  inc hl
  ld (hl),b
ret
  
myinterrupt:
  ld (previous_stack+1),sp
  ld sp,interrupt_stack_start

  ; SWITCH TO SHADOW REGISTERS
  exx
  ex af,af'

  ; RECORD TIME EVERY 300th OF A SECOND
  ld hl,(timepleasehl)
  inc hl
  ld (timepleasehl),hl
  ld a,h
  or l   ; CHECK IF hl = 0, IF SO ZERO IS SET
  jr nz,skipsettimepleasede
  ; INC DE AS WE HAVE MADE A CYCLE OF HL
  ld hl,(timepleasede)
  inc hl
  ld (timepleasede),hl
  skipsettimepleasede:
  
  ld hl,(interrupttableptr)
  jp (hl)
  
  finishinterrupt:
  ld hl,(interrupttableptr)
  inc hl
  inc hl
  inc hl
  ld (interrupttableptr),hl
  finishinterrupt2:
  
  exx
  ex af,af'
  previous_stack:
  ld sp,0
  ei
ret

;interruptcheck equ 1

fiftiethofasecondinterrupt5a:
ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&06
  inc hl
  ld (hl),&f0
endif

  ld b,&7f;c,&7f00+128+4+8+0 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  ld c,&8d:modesplit5a ; MODE 1 SCREEN SPLIT
  ;ld bc,&7f00+128+4+8+1 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  out (c),c
  
  defb 0:setplayertextcolourscall
  defw 0:setplayertextcoloursfunction

  defb 0:splitpalettecall2
  defw 0:splitpalettefunction2
  
  call playsound_a
jp finishinterrupt


fiftiethofasecondinterrupt4a: 

; WE NEED TO SLOW DOWN INTERRUPT HERE OTHERWISE BOTTOM OF TEXT COMES OUT AS MODE 1
;ld b,35
;#pointlessloopy:
;djnz pointlessloopy

ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&00
  inc hl
  ld (hl),&ff
endif

  ld b,&7f;c,&7f00+128+4+8+0 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  ld c,&8d:modesplit4a ; MODE 1 SCREEN SPLIT
  ;ld bc,&7f00+128+4+8+1 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  out (c),c

  defb 0:setroundcolourscall
  defw 0:setroundcoloursfunction

  ; READ KEYBOARD EVERY 50th OF A SECOND
        ;di              ;1 ##%%## C P C   VERSION ##%%##
        ld hl,matrix_buffer    ;3
        ld bc,#f782     ;3
        out (c),c       ;4
        ld bc,#f40e     ;3
        ld e,b          ;1
        out (c),c       ;4
        ld bc,#f6c0     ;3
        ld d,b          ;1
        out (c),c       ;4
        ld c,0          ;2
        out (c),c       ;4
        ld bc,#f792     ;3
        out (c),c       ;4
        ld a,#40        ;2
        ld c,#4a        ;2 44
loopb:  ld b,d          ;1
        out (c),a       ;4 select line
        ld b,e          ;1
        ini             ;5 read bits and write into KEYMAP
        inc a           ;1
        cp c            ;1
        jr c,loopb      ;2/3 9*16+1*15=159
        ld bc,#f782     ;3
        out (c),c       ;4                
jp finishinterrupt

scr_set_mode:
  ld bc,&7f00+128+4+8+1 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  out (c),c
ret

; A = I


fiftiethofasecondinterrupt3a:
ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&0f
  inc hl
  ld (hl),&fa
endif

  ld b,&7f;c,&7f00+128+4+8+0 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  ld c,&8d:modesplit3a ; MODE 1 DEFAULT
  out (c),c
  
  defb 0:setscoreboardpalettecall
  defw 0:setscoreboardpalettefunction

  call playsound_c
jp finishinterrupt


fiftiethofasecondinterrupt2a:
ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&0f
  inc hl
  ld (hl),&f0
endif

  ; SET MODE 1 FOR LEVEL SCREEN HERE
  ld b,&7f;c,&7f00+128+4+8+0 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  ld c,&8d:modesplit1a ; MODE 1 SCREEN SPLIT
  ;ld bc,&7f00+128+4+8+1 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  out (c),c

  ld a,(interruptcountermummies)
  inc a
  ld (interruptcountermummies),a

  cp 1:mummyinterruptspeed
  jp nz,skipresetmummymovement

  xor a
  ld (interruptcountermummies),a
  ld (mummymovementok),a          ; TELL MUMMY MOVEMENT FUNCTION THAT WE ARE OKAY TO MOVE
  
  skipresetmummymovement:

  ; ONLY PLAY MUSIC EVERY SO MANY INTERRUPTS
  ; THERE IS NO BUFFER SO THIS SLOWS MUSIC SPEED
  ld a,(interruptcounter4)
  inc a
  ld (interruptcounter4),a
  cp 3:firstinterruptspeed2
  jr nz,skipresethirdinterruptcounter2
  xor a
  ld (interruptcounter4),a

  defb 0:firstinterruptcommand2   ; &CD = CALL
  defw 0:firstinterruptfunction2  ; play music
    
  skipresethirdinterruptcounter2:
  
jp finishinterrupt

mummymovementok: defb 0

fiftiethofasecondinterrupt1a:

ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&0a
  inc hl
  ld (hl),&ff
endif

  defb 0:splitpalettecall
  defw 0:splitpalettefunction

  call playsound_b
jp finishinterrupt


fiftiethofasecondinterrupt: 
ifdef interruptcheck
  ld hl,&6400+32
  ld (hl),&0f
  inc hl
  ld (hl),&af
endif

  ; UNSET MODE 1 FOR LEVEL SCREEN HERE
  ld b,&7f;c,&7f00+128+4+8+0 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  ld c,&8c:modesplit1 ; MODE 1 SCREEN SPLIT
  ;ld bc,&7f00+128+4+8+1 ; SET MODE TO 0 (LAST DIGIT SETS MODE)
  out (c),c

  ld hl,interrupttable
  ld (interrupttableptr),hl
  
  ; UPDATE DISK PALETTE INTERRUPT COUNTER
  ld a,(interruptcounter3)
  inc a
  ld (interruptcounter3),a
  cp 6:firstinterruptspeed
  jr nz,skipresethirdinterruptcounter
  xor a
  ld (interruptcounter3),a
  call cycleplayerpalette

  defb 0:firstinterruptcommand    ; &CD = CALL
  defw 0:firstinterruptfunction   ; fadepalette

  skipresethirdinterruptcounter:
  
  ; UPDATE CHANGE TEXT INTERRUPT COUNTER
  ld a,(interruptcounter2)
  inc a
  ld (interruptcounter2),a

  cp 20:thirdinterruptspeed
  jp nz,finishinterrupt2
 
mysecondinterrupt:
  xor a
  ld (interruptcounter2),a

  defb 0:thirdinterruptcommand    ; &CD = CALL
  defw 0:thirdinterruptfunction   ; playmusic
  
  defb 0:secondinterruptcommand   ; &CD = CALL
  defw 0:secondinterruptfunction  ; fadepalette
jp finishinterrupt2

enableplayertextfadecolours:
  ld a,&cd
  ld (setplayertextcolourscall-1),a
  ld (setroundcolourscall-1),a
  ld hl,setplayertextcolours
  ld (setplayertextcoloursfunction-2),hl
  ld hl,setpaletteroundcolours
  ld (setroundcoloursfunction-2),hl
ret
disableplayertextfadecolours:
  xor a
  ld (setplayertextcolourscall-1),a
  ld (setroundcolourscall-1),a
  ld hl,0
  ld (setplayertextcoloursfunction-2),hl
  ld (setroundcoloursfunction-2),hl
ret

splitscreen_allmode1:
  ld a,&8d ; MODE 1
  ld (modesplit5a-1),a
  ld (modesplit4a-1),a
  ld (modesplit3a-1),a
  ld (modesplit1a-1),a
  ld (modesplit1-1),a
ret
splitscreen_mode1top_player:
  ld a,&8c ; MODE 0
  ld (modesplit5a-1),a
  ld a,&8d ; MODE 1
  ld (modesplit4a-1),a
  ld a,&8c ; MODE 0
  ld (modesplit3a-1),a
  ld (modesplit1a-1),a
  ld (modesplit1-1),a
ret
splitscreen_mode1top_autoplay:
  ld a,&8d ; MODE 1
  ld (modesplit5a-1),a
  ld (modesplit4a-1),a
  ld a,&8c ; MODE 0
  ld (modesplit3a-1),a
  ld (modesplit1a-1),a
  ld (modesplit1-1),a
ret
splitscreen_mode1middle:
  ld a,&8c ; MODE 0
  ld (modesplit5a-1),a
  ld (modesplit4a-1),a
  ld (modesplit3a-1),a
  ld a,&8d ; MODE 1
  ld (modesplit1a-1),a
  ld a,&8d ; MODE 0
  ld (modesplit1-1),a
ret

enablesplitpalettescoreboard:
  ld a,&cd                    ; CALL = &CD
  ld hl,setuppluspalettescoreboardbigletters
  ld (setroundcolourscall-1),a
  ld (setroundcoloursfunction-2),hl
  ld hl,setuppluspalettescoreboardnormal
  ld (setscoreboardpalettecall-1),a
  ld (setscoreboardpalettefunction-2),hl
ret
enablesplitpalettelevelscreen:
  call disablesplitpalettelevelscreen
  ld a,&cd                    ; CALL = &CD
  ld hl,setlevellogopalette2  ; secondinterruptcommand
  ld (splitpalettecall-1),a
  ld (splitpalettefunction-2),hl
  ld hl,setlevellogopalette
  ld (splitpalettecall2-1),a
  ld (splitpalettefunction2-2),hl
ret
; DISABLE ALL PALETTE CHANGES IN INTERRUPTS
disablesplitpalettelevelscreen:
  xor a                ; CALL = &CD
  ld hl,0              ; secondinterruptcommand
  ld (splitpalettecall-1),a
  ld (splitpalettefunction-2),hl
  ld (splitpalettecall2-1),a
  ld (splitpalettefunction2-2),hl
  ld (setscoreboardpalettecall-1),a
  ld (setscoreboardpalettefunction-2),hl
  ld (setroundcolourscall-1),a
  ld (setroundcoloursfunction-2),hl
ret

; ENABLE MUSIC IN LEVEL SCREEN
enablemusic:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call initmusicf                 ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  continueenablemusic:
  ld a,&CD                        ; CALL = &CD
  ld bc,playmusicf                ; secondinterruptcommand
  jp setfirstinterrupt2
  
enablemusic_levelcomplete:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call playlevelcompletemusic     ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  jr continueenablemusic
enablemusic_greenball:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call playgreenballmusic         ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  jr continueenablemusic
enablemusic_newlevel:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call playnewlevelmusic         ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  jr continueenablemusic
enablemusic_disk:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call playdiskmusic              ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  jr continueenablemusic

enablemusic_empty:
  ld hl,firstinterruptspeed2-1    ; PASS LOCATION OF INTERRUPT SPEED TO FUNCTION
  call playemptymusic             ; CLEAR BUFFERS AND CHANNELS AND RESET MUSIC TO START OF SCORE
  jr continueenablemusic

; DISABLE MUSIC
disablemusic:
  call initsoundf      ; CLEAR SOUND CHANNELS AND BUFFERS
  xor a                ; CALL = &CD
  ld (musicstatus),a   ; IN CASE WE DISABLED MUSIC WHILE PLAYING NOTE!
  ld bc,0              ; secondinterruptcommand
  jp setfirstinterrupt2

; ENABLE FLASHING SCORE POSITION
;enableflashscoreentryposition:
;  ld bc,flashscoreentryposition 
;  jr doenablesecondinterrupt
; MENU SCOREBOARD TIMER
enablescoreboardtimer:
  ld bc,decrementscoreboardtimer               ; secondinterruptcommand
  jr doenablesecondinterrupt
; ANIMATE ARROWS ON MINI CUBE
enablechangetocycleinterrupt:
  ld bc,cyclechangetotext               ; secondinterruptcommand
  jr doenablesecondinterrupt
; ENABLE FLASHING PUSH P1 P2 START
;enablepushp1p2startmessage:
;  ld bc,flashpushp1p2message               ; secondinterruptcommand
  doenablesecondinterrupt:
  ld a,&CD                                 ; CALL = &CD
  ld (secondinterruptcommand-1),a
  ld (secondinterruptfunction-2),bc
ret

; DON'T DRAW TIMER TEXT IN INTERRUPT AS IT INTERFERES WITH PLAYER NAME TEXT
; JUST MARK THAT WE CAN UPDATE IT IN MAIN LOOP
dodrawtimer: defb 0
decrementscoreboardtimer:
  ; SLOW DOWN TIMER TO ROUGHLY 1 SECOND INTERVALS
  ld a,0:timer2
  inc a
  ld (timer2-1),a
  cp 3
  ret nz
  xor a 
  ld (timer2-1),a
  ld a,(timer)
  dec a
  ld (timer),a
  ld a,1
  ld (dodrawtimer),a
ret

flashmessagetimer:  defb 50
flashmessagetimer2: defb 5

flashpushp1p2message:
  ; DON'T DISPLAY IF THERE ARE NO CREDITS
  ld a,(credits)
  or a
  ret z

  ; USE TWO TIMERS TO SLOW FLASHING MESSAGE
  ld a,(flashmessagetimer)
  dec a
  ld (flashmessagetimer),a
  or a
  ret nz
  ld a,250
  ld (flashmessagetimer),a
  
  ld a,(flashmessagetimer2)
  dec a
  ld (flashmessagetimer2),a
  or a
  ret nz
  ld a,7
  ld (flashmessagetimer2),a
  
  ; CYCLE MESSAGE
  ld a,0:flashpushp1p2messagecounter
  xor 1
  ld (flashpushp1p2messagecounter-1),a
  or a
  jr z,clearpushmessage
  ; PRINT PUSH MESSAGE BASED ON CREDITS
  ld a,(credits)
  cp 1
  jr z,printpush1playeronly
  ld hl,txt_push2pstart
  jp printstring
  printpush1playeronly:
  ld hl,txt_push1pstart
  jp printstring
  clearpushmessage:
  ld hl,txt_push1pstartclear
  jp printstring
  
flashplayer2:
  ld hl,txt_player2turn
  ld bc,txt_gameoverboxcoloursclear
  jr flashsinglemessage
flashplayer1:
  ld hl,txt_player1turn
  ld bc,txt_gameoverboxcoloursclear
  jr flashsinglemessage
flashgameover:
  ld hl,txt_gameoverboxcolours
  ld bc,txt_gameoverboxcoloursclear
  jr flashsinglemessage
flashgamepaused:
  ld hl,txt_gamepausedboxcolours
  ld bc,txt_gameoverboxcoloursclear
; INPUTS
; HL = MESSAGE STRING
; BC = CLEAR MESSAGE STRING
flashsinglemessage:
  ld (flashstring-2),hl
  ld (clearstring-2),bc
  ; USE TWO TIMERS TO SLOW FLASHING MESSAGE
  ld a,(flashmessagetimer)
  dec a
  ld (flashmessagetimer),a
  or a
  ret nz
  ld a,250
  ld (flashmessagetimer),a
  
  ld a,(flashmessagetimer2)
  dec a
  ld (flashmessagetimer2),a
  or a
  ret nz
  ld a,20
  ld (flashmessagetimer2),a
  
  ; CYCLE MESSAGE
  ld a,(flashpushp1p2messagecounter-1)
  xor 1
  ld (flashpushp1p2messagecounter-1),a
  or a
  jr z,clearsinglemessage

  ld hl,0:flashstring
  jp printstring
  clearsinglemessage:
  ld hl,0:clearstring
  jp printstring

my_kl_time_please:
  ld hl,(timepleasehl)
  ld de,(timepleasede)
ret

; =================================================================
; MY CUSTOM FUNCTIONS - DROP IN REPLACEMENTS FOR FIRMWARE FUNCTIONS
; -----------------------------------------------------------------

scr_addr equ &8000

currenttxtpos:     defw scr_addr
currentwindowxy:   defw 0
currentwindowxy2:  defb 29,31;160,20;39,24
currentpapernum:   defb 0 ; 0,1,2,3
currentpennum:     defb 1 ; 0,1,2,3

; INPUT
; HL = TOP LEFT CORNER
; DE = BOTTOM RIGHT CORNER
my_txt_set_window:
  ld (currentwindowxy),hl
  ld (currentwindowxy2),de
ret

; GET WINDOW DIMENSIONS AND CLEAR USING CURRENT PAPER
my_txt_clear_window:
  ; GET TOP LEFT SCREEN LOCATION
  ld hl,locatetable
  ; GET Y OFFSET FROM TOP WINDOW POSITION
  ld a,(currentwindowxy)
  call vectorlookuphl
  
  ; GET X OFFSET
  ld a,(currentwindowxy+1)
  rla   ; DOUBLE FOR MODE 1
  ld b,0
  ld c,a
  ; ADD TO LOOKUP
  add hl,bc 
  
  ; RESULT SHOULD BE TOP LEFT CORNER OF WINDOW AREA OF MEMORY TO CLEAR
  ; NOW WE NEED TO FILL DOWN NUMBER OF ROWS TIMES 8, BY NUMBER OF BYTES IN WIDTH
  
  ; GET WIDTH IN BYTES OF WINDOW
  ld a,(currentwindowxy+1)
  ld c,a
  ld a,(currentwindowxy2+1)
  inc a                     ; TREAT 0 AS COL 1
  sub c
  rla                       ; DOUBLE FOR MODE 1 GRID
  dec a                     ; LESS ONE BYTE AS START BYTE OF LINE ALREADY SET
  ld c,a
  ld (bytestoclear-2),bc
   
  ; GET ROWS TO CLEAR * 8
  ld a,(currentwindowxy)
  ld c,a
  ld a,(currentwindowxy2)
  inc a                     ; TREAT 0 AS ROW 1
  sub c
  rla                       ; MULTIPLY BY 8 PIXELS
  rla
  rla
  ld b,a
  
  clearloopvert:
    push bc
	push hl
	ld (hl),0:currentpaper
	ld d,h
	ld e,l
	inc e
	ld bc,0:bytestoclear
	ldir
	pop hl
	pop bc
    call scr_next_line_hl
  djnz clearloopvert 
ret

; INPUT
; HL = TABLE OF 16BIT NUMBERS
; A = INDEX
; OUTPUT
; HL = 16 BIT NUMBER FROM LIST
vectorlookuphl:
  push bc
  ;rlca ; DOES NOT WORK OVER TABLE LENGTH > 128
  ld b,0
  ld c,a
  add hl,bc
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  pop bc
ret
; MOVE BASED ON DIRECTION JUMP TABLE
; VECTOR TABLE LAUNCH CODE
; INPUTS 
; A = ID NUMBER
; HL = LOOKUP TABLE
vectortablelaunchcode:
  call vectorlookuphl
  jp (hl)     ; JUMP TO VECTOR TABLE FUNCTION

; SET PEN OF PAPER USING BINARY PATTERN
; INPUT 
; A = PEN NUMBER

txt_set_pen:
  ld (currentpennum),a
  jp setpaperpeninks

txt_set_paper:
  ld (currentpapernum),a
  call txt_set_paper2
  ld (currentpaper-1),a
  jp setpaperpeninks

txt_set_paper2:
  dec a;cp 1
  jr z,setpaper1
  dec a;cp 2
  jr z,setpaper2
  dec a;cp 3
  jr z,setpaper3
setpaper0:
  xor a;ld a,&00 ; YELLOW
  ret
setpaper1:
  ld a,&F0 ; BLACK
  ret
setpaper2:
  ld a,&0F ; ORANGE
  ret
setpaper3:
  ld a,&FF ; BLUE
  ret

dosetink:
  push bc
  inc hl
  ld a,(hl) ; GET INDEX
  ld b,a
  inc hl
  inc hl
  ld a,(hl) ; GET COLOUR
  ld c,a
  ld a,b
  ld b,c
  push hl
  
  call scr_set_ink

  pop hl
  pop bc
  dec b
  dec b
  dec b
  jp continueprintstring2
  
dosetborder:
  push bc
  inc hl
  inc hl
  ld a,(hl)
  ld c,a
  ld b,c
  push hl
  
  call scr_set_border

  pop hl
  pop bc
  dec b
  dec b
  jp continueprintstring2

dosetscreenmode:
  push bc
  inc hl
  ld a,(hl) ; GET MODE
  ld b,&7f
  add 128
  add 4
  add 8 
  ld c,a
  out (c),c
  
  push hl
  call my_txt_clear_window ; CHANGE IN MODE SEEMS TO DO CLS TOO
  pop hl

  pop bc
  dec b  
  jr continueprintstring2


; A = INDEX
; C = PEN COLOUR INDEX IN FIRMWARE TABLE
scr_set_border:
  ld a,#10
scr_set_ink:
  ; GET HARDWARE PEN COLOUR IN FIRMWARE ORDERED TABLE
  ld b,0
  ld hl,pensfirmware
  add hl,bc
  
  ld c,a
  ld b,&7f;10          ;{{0793-01107f}}  set border colour

;;====================================================================
;; set colour for a pen
;;
;; HL = address of colour for pen
;; C = pen index

set_colour_for_a_pen:             ;{{Addr=$07aa Code Calls/jump count- 2 Data use count- 0}}
        out     (c),c             ;{{07aa-ed49}}  select pen 
        ld      a,(hl)            ;{{07ac-7e}} 
        and     &1f               ;{{07ad-e61f}} 
        or      &40               ;{{07af-f640}} 
        out     (c),a             ;{{07b1-ed79}}  set colour for pen
        ret                       ;{{07b3-c9}} 

; HARDWARE COLOURS OF PEN ARRANGED BY FIRMWARE ORDER (BLACK TO WHITE)
pensfirmware:
  defb 20
  defb 4
  defb 21
  defb 28
  defb 24
  defb 29
  defb 12
  defb 5
  defb 13
  defb 22
  defb 6
  defb 23
  defb 30
  defb 0
  defb 31
  defb 14
  defb 7
  defb 15
  defb 18
  defb 2
  defb 19
  defb 26
  defb 25
  defb 27
  defb 10
  defb 3
  defb 11

writelineplainfde:
  ex de,hl
writelineplainf:
  ld a,(hl)
  cp 255
  ret z
  call writecharplainf
  inc hl
  jr writelineplainf  
  
; INPUT
; HL = STRING TO PRINT AT GFX POS
printstring:
  ; LOCATE TEXT BASED ON LAST SCREEN COORDINATE
  ld b,(hl) ; NUMBER OF CHARS TO PRINT AT START OF STRING
  my_printstringcharloop:
    inc hl
    ld a,(hl)
	
	cp #1f                ; TEXT LOCATE COMMAND
	jp z,my_locate
	; ASCII CONTROL CODES
	or a;cp #00                ; IGNORE ZERO
	jr z,continueprintstring2
	cp #04
	jr z,dosetscreenmode
	cp #08
	jr z,domovebackonechar
	cp #0a
	jr z,domovedownoneline
	cp #0c                ; CLEAR CURRENT TEXT WINDOW
	jr z,doclearwindow
	cp #0e                ; SET PAPER
	jr z,dosetpaperink    
	cp #0f                ; SET PEN
	jr z,dosetpenink    
	cp #1c                ; SET INK
	jp z,dosetink 
	cp #1d                ; SET BORDER
	jp z,dosetborder      

	; NORMAL CHARACTER
    call my_txt_output
	continueprintstring2:
  djnz my_printstringcharloop
ret

domovebackonechar:
  push hl
  ld hl,(currenttxtpos)
  dec hl
  dec hl
  ld (currenttxtpos),hl
  pop hl
  jr continueprintstring2
  
domovedownoneline:
  push hl
  ld hl,(currenttxtpos)
  push bc
  ld bc,&0050
  add hl,bc
  pop bc
  ld (currenttxtpos),hl
  pop hl
  jr continueprintstring2
  
doclearwindow:
  push bc
  push hl
  call my_txt_clear_window
  pop hl
  pop bc
  jr continueprintstring2

dosetpaperink:
  push bc
  inc hl
  ld a,(hl)
  call txt_set_paper
  pop bc
  dec b
  jp continueprintstring2

dosetpenink:
  push bc
  inc hl
  ld a,(hl)
  call txt_set_pen
  pop bc
  dec b
  jp continueprintstring2

; INPUT
; HL = STRING TO PRINT
; 1st byte = 1F LOCATE COMMAND
; 2nd byte = COLUMN
; 3rd byte = LINE
my_locate:
  push bc
  inc hl
  push hl
  ld a,(hl)
  inc hl
  ld l,(hl)
  ld h,a
  dec h  ; START FROM 0 AS COORD INSTEAD OF 1
  dec l
  call locatetextf
  ld (currenttxtpos),hl ; STORE POSITION
  pop hl
  inc hl
  pop bc
  dec b
  dec b
  jp continueprintstring2
;  inc hl
;  ld h,a
  ; INPUT
; H = X ROW
; L = Y COL
; OUTPUT
; HL = SCREEN POS

; HL, BC, A CORRUPT
locatetextf:
  ld a,h
  push af
  ld a,l
  rlca ; DOUBLE FOR LOOKUP
  ld hl,locatetable
  ld b,0
  ld c,a
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  pop af
  rlca ; DOUBLE FOR HORIZ BYTES  
  ld c,a
  add hl,bc
ret

locatetable:
  defw &8000 ;1
  defw &8000+64 ;2 
  defw &8000+64+64 ;3
  defw &8000+64+64+64 ;4
  defw &8000+64+64+64+64 ;5
  defw &8000+64+64+64+64+64 ;6
  defw &8000+64+64+64+64+64+64 ;7
  defw &8000+64+64+64+64+64+64+64 ;8
  defw &8000+64+64+64+64+64+64+64+64 ;9
  defw &8000+64+64+64+64+64+64+64+64+64 ;10
  defw &8000+64+64+64+64+64+64+64+64+64+64 ;11
  defw &8000+64+64+64+64+64+64+64+64+64+64+64 ;12
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64 ;13
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64 ;14
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;15
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;16
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;17
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;18
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;19
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;20
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;21
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;22
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;23
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;24
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;25
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;26
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;27
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;28
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;29
  defw &8000+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64 ;30

; MOVE CURSOR TO COLUMN AND LINE NUMBER BASED ON CURRENT WINDOW LOCATION
; INPUTS
; H = X POS
; L = Y POS
my_txt_set_cursor:
  ld bc,(currentwindowxy)
  add hl,bc
  dec h  ; START FROM 0 INSTEAD OF 1
  dec l  ; START FROM 0 INSTEAD OF 1
; SAME AS ABOVE, ONLY WITHOUT WINDOW OFFSET ADDED
  my_txt_set_cursor_main:
  call locatetextf
  ld (currenttxtpos),hl
ret

foundnonzero: defb 0

; INPUT
; A = CHAR TO PRINT AT CURRENT COORDINATES

my_txt_output_skipleadingzero:
  cp "0"
  jr nz,my_txt_output_setnonezero
  
  ld a,(foundnonzero)
  or a
  ret z
  
  ; PRINT ZERO AS WE AREN'T FIRST IN NUMBER
  ld a,"0"
  jp writecharplainf;my_txt_output
  
  my_txt_output_setnonezero:
  call writecharplainf;my_txt_output
  ld a,1
  ld (foundnonzero),a
ret

my_txt_output_skipleadingzero_p2:
  cp "0"
  jr nz,my_txt_output_setnonezero
  
  ld a,(foundnonzero)
  or a
  jr z,outputspace
  
  ; PRINT ZERO AS WE AREN'T FIRST IN NUMBER
  ld a,"0"
  jp writecharplainf;my_txt_output
  outputspace:
  ld a," "
  jp writecharplainf;my_txt_output
  
my_txt_output:
  ld de,(currenttxtpos)
  my_txt_output_de:
  call writecharplainf
  ld (currenttxtpos),de
ret
my_txt_outputtransp:
  ld de,(currenttxtpos)
  call writecharplainftransp
  ld (currenttxtpos),de
ret

setqbertswearwordsprites:
  ld hl,image_qbert_swearword1
  ld a,6;&46
  call copyspritefromunderasictoasic
  ld hl,image_qbert_swearword2
  ld a,7;&47
  call copyspritefromunderasictoasic
  ld hl,image_qbert_swearword3
  ld a,8;&48
  call copyspritefromunderasictoasic
  ld hl,image_qbert_swearword4
  ld a,9;&49
  call copyspritefromunderasictoasic
  ld hl,image_qbert_swearword5
  ld a,10;&4A
  call copyspritefromunderasictoasic
  ld hl,image_qbert_swearword6
  ld a,11;&4B
; INPUT
; HL = SPRITE ADDRESS UNDER ASIC
; A = SPRITE ID
copyspritefromunderasictoasic:
  ;; page-out asic registers
  push af
  ld bc,&7fa0
  out (c),c

  ; FOLLOW PTR TO SPRITE DATA
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a

  ; COPY 1st SPRITE TO BUFFER
  ld de,sparespritebuff
  ld bc,256
  ldir
  
  ;; page-in asic registers
  ld bc,&7fb8
  out (c),c

  ; SET 1st SPRITE FROM BUFFER
  pop af
  ld hl,sparespritebuff
  jp drawnormalimage_fixedid_compressed

; INPUTS
; A  = CHAR
; DE = SCREEN POS
writecharplainf:
  push hl
  sub 32             ; START WITH SPACE
  rlca               ; DOUBLE FOR LOOKUP

  ld hl,amsfonttable
  ld l,a
  
  ; MOVE TO ACTUAL TABLE DATA IN HL
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  push de
  ; WRITE TO SCREEN
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  call writecharpixelline
  pop de
  inc e ; MOVE TO NEXT CHAR SPACE
  inc e
  pop hl
ret
; INPUTS
; A  = CHAR
; DE = SCREEN POS
writecharplainftransp:
  push hl
  sub 32             ; START WITH SPACE
  rlca               ; DOUBLE FOR LOOKUP
  
  ld hl,amsfonttable
  ld l,a

  ; MOVE TO ACTUAL TABLE DATA IN HL
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  push de
  ; WRITE TO SCREEN
  call writecharpixellinetransp
  call writecharpixellinetransp
  call writecharpixellinetransp
  call writecharpixellinetransp
  call writecharpixellinetransp;plain
  call writecharpixellinetransp;plain
  call writecharpixellinetransp;plain
  call writecharpixellinetransp;plain
  pop de
  inc e ; MOVE TO NEXT CHAR SPACE
  inc e
  pop hl
ret

; MACHINE CODE EQUIVALENTS FOR "AND, OR, XOR" FUNCTIONS IN COMMENTS BELOW
; THIS GETS COPIED TO THE CHARACTER DRAWING FUNCTION WHEN WE CHANGE PAPER OR PEN
; THIS TRANSFORMS BYTE DATA IN FONT SO PAPER AND PEN COLOURS ARE CORRECT
setpaperpeninkstable2:
  defw &0000,&0000, &F0E6,&F0EE, &0FE6,&0000, &F0EE,&0000 ; PEN 0, PAPER 0 1 2 3
  defw &F0E6,&0000, &0000,&0000, &0000,&0000, &F0F6,&0000 ; PEN 1, PAPER 0 1 2 3
  defw &0FE6,&0FEE, &FFEE,&0000, &0000,&0000, &0FF6,&0000 ; PEN 2, PAPER 0 1 2 3
  defw &0FEE,&0000, &F0F6,&0FEE, &0FF6,&0000, &0000,&0000 ; PEN 3, PAPER 0 1 2 3

; MODIFY CHARACTER DRAWING FUNCTION TO SET CORRECT PAPER AND PEN INKS
setpaperpeninks:
  push hl
  ld hl,setpaperpeninkstable2
  ; ADD 16 FOR EACH PEN
  ld a,(currentpennum)
  sla a
  sla a
  sla a
  sla a
  ld b,0
  ld c,a
  add hl,bc
  ld a,(currentpapernum)
  ; ADD 4 FOR EACH PAPER
  sla a
  sla a
  ld b,0
  ld c,a
  add hl,bc
  
  ; COPY COMMAND FOR FIRST BYTE IN CHARACTER INTO CHARACTER DRAWING FUNCTION
  push hl
  ld de,commbytes1
  ld bc,4
  ldir
  pop hl
  ; COPY COMMAND FOR SECOND BYTE IN CHARACTER
  ld de,commbytes2
  ld bc,4
  ldir
  pop hl
ret

  ; ADD 4 FOR EACH PEN
 
; 00000000 INK 0
; 00001111 INK 1
; 11110000 INK 2
; 11111111 INK 3

; DEFAULT BLACK ON ORANGE - INK 1 ON INK 2
;  -
;                   PEN INK, PAPER INK

;                   0,0

; YELLOW ON BLACK   0,1
;  AND %11110000
;  XOR %11110000

; YELLOW ON ORANGE  0,2
;  AND %00001111

; YELLOW ON BLUE    0,3
;  XOR %11110000

; BLACK ON YELLOW   1,0
;  AND %11110000

;                   1,1

; BLACK ON ORANGE   1,2
;  NO CHANGE
;

; BLACK ON BLUE     1,3
;  OR  %11110000

; ORANGE ON YELLOW  2,0
;  AND %00001111
;  XOR %00001111

; ORANGE ON BLACK   2,1
;  XOR %11111111

;                   2,2

; ORANGE ON BLUE    2,3
;  OR  %00001111

; BLUE ON YELLOW    3,0
;  XOR %00001111

; BLUE ON BLACK     3,1
;  OR  %11110000
;  XOR %00001111

; BLUE ON ORANGE    3,2
;  OR  %00001111

;                   3,3

writecharpixelline:
  ; LEFT BYTE
  ld a,(hl)
  commbytes1: defw &0FF6,&F0E6;0,0  PEN 1 PAPER 0 DEFAULT
  ld (de),a
  
  ; RIGHT BYTE
  inc e
  inc hl
  
  ld a,(hl)
  commbytes2: defw &0FF6,&F0E6;0,0  PEN 1 PAPER 0 DEFAULT
  ld (de),a
  inc hl

  dec e
  ex de,hl              ; MOVE TO NEXT PIXEL LINE DOWN
  call scr_next_line_hl
  ex de,hl
ret

writecharpixellinetransp:
  ; LEFT BYTE
  ld a,(hl)
  defw &0FF6,&F0E6;0,0  PEN 1 PAPER 0 DEFAULT
  ld c,a
  ld a,(de)
  or c
  ld (de),a
  
  ; RIGHT BYTE
  inc e
  inc hl
  
  ld a,(hl)
  defw &0FF6,&F0E6;0,0  PEN 1 PAPER 0 DEFAULT
  ld c,a
  ld a,(de)
  or c
  ld (de),a
  inc hl

  dec e
  ex de,hl              ; MOVE TO NEXT PIXEL LINE DOWN
  call scr_next_line_hl
  ex de,hl
ret

;scr_next_line_hl2:
;  ld a,h              ; &BC26=&0C13 (&0970)  [98] SCR_NEXT_LINE (Step a screen address down one line)
;  add a,&08
;  ld h,a
;  and &38
;  ret nz
;  ld a,h
;  sub &40
;  ld h,a
;  ld a,l
;  add a,&50
;  ld l,a
;  ret nc
;  inc h
;  ld a,h
;  and #7
;  ret nz
;  ld a,h
;  sub #8
;  ld h,a
;ret

; FOR REDUCED SCREEN SIZE
scr_next_line_hl:
  ld a,h              ; &BC26=&0C13 (&0970)  [98] SCR_NEXT_LINE (Step a screen address down one line)
  add a,&08
  ld h,a
  and &38
  ret nz
  ld a,h
  sub &40
  ld h,a
  ld a,l
  add a,72-8;&50
  ld l,a
  ret nc
  inc h
  ld a,h
  and #7
  ret nz
  ld a,h
  sub #8
  ld h,a
ret

;txt_presscorfirebutton: 
;  db 30;#29         ; NUM CHARS
;  db #0f,#02     ; PEN 
;  db #1f,#09,#17 ; LOCATE
;  db "Press any key to continue"  
txt_gameoverboxcolours:
  db 16          ; NUM CHARS
  db #0e,#00     ; PAPER
  db #0f,#03     ; PEN
  db #1f,#0c,#07 ; LOCATE
  db "GAME OVER"

txt_gameoverboxcoloursclear:
  db 12          ; NUM CHARS
  db #1f,#0c,#07 ; LOCATE
  db "         "
txt_gamepausedboxcolours:
  db 16          ; NUM CHARS
  db #0e,#00     ; PAPER
  db #0f,#03     ; PEN
  db #1f,#0c,#07 ; LOCATE
  db "  PAUSED "
  
txt_player1turn:
  db 16          ; NUM CHARS
  db #0e,#00     ; PAPER
  db #0f,#03     ; PEN
  db #1f,#0c,#07 ; LOCATE
  db " PLAYER 1"
txt_player2turn:
  db 16          ; NUM CHARS
  db #0e,#00     ; PAPER
  db #0f,#03     ; PEN
  db #1f,#0c,#07 ; LOCATE
  db " PLAYER 2"
  
currenttime:    db #00,#00
txt_setupscreen2: 
  db 9;14;#19             ; 25 CHARS TO PRINT
  db #1d,#00,#00     ; SET BORDER PURPLE
  db #0e,#00         ; SET PAPER  INK 0
  db #04,#00         ; SET SCREEN MODE + CLS
  db #0f,#03         ; SET PEN    INK 1
txt_setupscreen: 
  db 6;14;#19             ; 25 CHARS TO PRINT
  db #0e,#00         ; SET PAPER  INK 0
  db #04,#01         ; SET SCREEN MODE + CLS
  db #0f,#03         ; SET PEN    INK 1
txt_setupscoreboard: 
  db 43;14;#19             ; 25 CHARS TO PRINT
  db #1d,#00,#00     ; SET BORDER BLACK
  db #1c,#00,#00,#00 ; SET INK 0  BLACK
  db #0e,#00         ; SET PAPER  INK 0
  db #04,#01         ; SET SCREEN MODE + CLS

  db #0f,#02         ; SET PEN    INK 1
  db #1f,17-5,1    ; LOCATE
  db "HIGH SCORES"
  db #0f,#03         ; SET PEN    INK 1
  db #1f,17-5,2    ; LOCATE
  db "---- ------"
txt_highscoreboard_supreme: 
  db 76+29+17+21+2;14;#19             ; 25 CHARS TO PRINT
  db #1d,#00,#00     ; SET BORDER BLACK
  db #1c,#00,#00,#00 ; SET INK 0  BLACK
  db #0e,#00         ; SET PAPER  INK 0
  db #04,#01         ; SET SCREEN MODE + CLS
  db #0f,#02         ; SET PEN    INK 1
  db #1f,7,5+1    ; LOCATE
  db "YOU HAVE USURPED ALL"
  db #1f,7,6+1    ; LOCATE
  db "OTHERS TO BECOME THE"
  db #0f,#01         ; SET PEN    INK 1
  db #1f,10,8+1    ; LOCATE
  db "SUPREME NOSER!"
  
  db #0f,#03         ; SET PEN    INK 1
  db #1f,10,9+1    ; LOCATE
  db "------- ------"
  db #0f,#02         ; SET PEN    INK 1
  db #1f,4,11+1    ; LOCATE
  db "KINDLY ENTER YOUR INITIALS"
  db #1f,10,12+1    ; LOCATE
  db "FOR ALL TO SEE"

txt_highscoreboard: 
  db 61;14;#19             ; 25 CHARS TO PRINT
  db #1d,#00,#00     ; SET BORDER BLACK
  db #1c,#00,#00,#00 ; SET INK 0  BLACK
  db #0e,#00         ; SET PAPER  INK 0
  db #04,#01         ; SET SCREEN MODE + CLS
  db #0f,#02         ; SET PEN    INK 1
  db #1f,3,5+1    ; LOCATE
  db "WELCOME TO THE NOSER ELITE!"
  db #1f,5+2,6+1    ; LOCATE
  db "YOUR RANKING IS"
  
txt_highscoreboard2:
  db 27+27+27+27+2;14;#19             ; 25 CHARS TO PRINT
  db #0f,#02         ; SET PEN    INK 1
  db #1f,4,10+1    ; LOCATE
  db "JOYSTICK SELECTS LETTERS"
  db #1f,4,11+1    ; LOCATE
  db "EITHER BUTTON WILL ENTER"
  db #1f,4,13+1    ; LOCATE
  db "USE   TO      USE   WHEN"
  db #1f,4,14+1    ; LOCATE
  db "      ERASE         DONE"
  
txt_highscoreboard3:
  db 27+27+27+27+27+7;14;#19
  db #1f,4+1,16+1    ; LOCATE
  db "A   B   C   D   E   F   "  
  db #1f,4+1,18+1    ; LOCATE
  db "  G   H   I   J   K   L "
  db #1f,4+1,20+1    ; LOCATE
  db "M   N   O   P   Q   R   "
  db #1f,4+1,22+1    ; LOCATE
  db "  S   T   U   V   W   X "
  db #1f,4+1,24+1    ; LOCATE
  db "Y   Z       .           "
  db #1f,5+1,27+1    ; LOCATE
  db "TIME"
  
topinstructionrow  equ 6
leftinstructionrow equ 8
txt_instr1:
  db 51+8
  db #0f,#03         ; SET PEN    INK 1
  db #1f,leftinstructionrow,topinstructionrow    ; LOCATE
  db "JUMP ON SQUARES TO"
  db #1f,leftinstructionrow,topinstructionrow+1    ; LOCATE
  db "CHANGE THEM TO"
  db #1f,leftinstructionrow,topinstructionrow+2    ; LOCATE
  db "THE TARGET COLOR"
txt_instr2:
  db 87+9
  db #0f,#03         ; SET PEN    INK 1
  db #1f,leftinstructionrow+1,topinstructionrow+4    ; LOCATE
  db "STAY ON PLAYFIELD!  "
  db #1f,leftinstructionrow+1,topinstructionrow+5    ; LOCATE
  db "JUMPING OFF RESULTS "
  db #1f,leftinstructionrow+1,topinstructionrow+6    ; LOCATE
  db "IN A FATAL PLUMMET  "
  db #1f,leftinstructionrow+1,topinstructionrow+7    ; LOCATE
  db "UNLESS A DISK IS THERE"
txt_instr3:
  db 59+6
  db #0f,#03         ; SET PEN    INK 1
  db #1f,leftinstructionrow+2,topinstructionrow+9    ; LOCATE
  db "AVOID ALL OBJECTS "
  db #1f,leftinstructionrow+2,topinstructionrow+10    ; LOCATE
  db "AND CREATURES THAT"
  db #1f,leftinstructionrow+2,topinstructionrow+11    ; LOCATE
  db "ARE NOT GREEN     "
txt_instr4:
  db 59+6
  db #0f,#03         ; SET PEN    INK 1
  db #1f,leftinstructionrow+3,topinstructionrow+13    ; LOCATE
  db "USE SPINNING DISKS"
  db #1f,leftinstructionrow+3,topinstructionrow+14    ; LOCATE
  db "TO LURE SNAKE TO  "
  db #1f,leftinstructionrow+3,topinstructionrow+15    ; LOCATE
  db "HIS DEATH         "
txt_instr5:
  db 53+12
  db #0f,#03         ; SET PEN    INK 1
  db #1f,leftinstructionrow+4,topinstructionrow+17    ; LOCATE
  db "EXTRA LIFE AT   "
  db #1f,leftinstructionrow+4,topinstructionrow+18    ; LOCATE
  db #0f,#01        ; SET PEN
txt_bonuslives1:
  db " 8000"
  db #0f,#03        ; SET PEN
  db " AND EACH  "
  db #1f,leftinstructionrow+4,topinstructionrow+19    ; LOCATE
  db "ADDITIONAL "
  db #0f,#01        ; SET PEN
txt_bonuslives2:
  db "14000"
  
txt_playerone:
  db 15
  db #1f,leftinstructionrow+4,topinstructionrow+22    ; LOCATE
  db #0f,#01        ; SET PEN
  db "PLAYER ONE"
txt_playertwo:
  db 15
  db #1f,leftinstructionrow+4,topinstructionrow+22    ; LOCATE
  db #0f,#01        ; SET PEN
  db "PLAYER TWO"

txt_title: db 80;99-16;30;#2c    ; NUMBER OF CHARS
  db #1f,#08-2,#0B+4     ; LOCATE 
  db #0f,#01         ; PEN
  db "1982"
  db #0f,#03         ; PEN
  db " D. GOTTLIEB AND CO."
  db #1f,#0A-3,#0C+4     ; LOCATE 

  db "ALL RIGHTS RESERVED"
  db #1f,#0B-3,#10+4     ; LOCATE 
  db #0f,#01         ; PEN
  db "1"
  db #0f,#03         ; PEN
  db " COIN  = "
  db #0f,#01         ; PEN
  db "1"
  db #0f,#03         ; PEN
  db " PLAY"
txt_credits: db 12;20  
  db #1f,32-9,#03     ; LOCATE 
  db #0f,#03         ; PEN
  db "CREDITS"
;  db #1f,40,#02     ; LOCATE 
;  db #0f,#01         ; PEN
;  txt_numcredits:
;  db "0"
  ;db #0e,#01         ; SET PAPER
  ;db #0f,#03         ; PEN

txt_push1pstart: db 33;18;20  
  db #1f,3,28;40-26     ; LOCATE 
  db #0f,#03         ; PEN
  db " PUSH ONE PLAYER START ONLY "
txt_push2pstart: db 33;18;20  
  db #1f,3,28;40-28     ; LOCATE 
  db #0f,#03         ; PEN
  db "PUSH ONE OR TWO PLAYER START"
; CLEAR ABOVE TEXT SO IT FLASHES WHEN PLAYER INSERTS COINS
txt_push1pstartclear: db 33;18;20  
  db #1f,3,28;40-28     ; LOCATE 
  db #0f,#03         ; PEN
  db "                            "

txt_round: defb 0,255
txt_level: defb 0,255
txt_lives: defb 0,255

txt_player:          defb "PLAYER ",255
txt_pressakeyfor:    defb "Ply 1 key for ",255
txt_pressakeyfor2:   defb "Ply 2 key for ",255
txt_up:              defb "up   ",255
txt_down:            defb "down ",255
txt_left:            defb "left ",255
txt_right:           defb "right",255
txt_fire:            defb "fire ",255
txt_pause:           defb "pause",255
txt_bonusscore:      defb "BONUS",255
txt_clearbonusscore: defb "          ",255
txt_player1:         defb "PLAYER 1",255
txt_player2:         defb "PLAYER 2",255
txt_printscoreempty: defb "              ",255
;inputmethod:       defb "Input: ",255
;joysticktext:      defb "Joystick",255
;keyboardtext:      defb "Keyboard",255
;customtext:        defb "Custom  ",255
;optionyes:         defb "Yes",255
;optionno:          defb "No ",255
;set1playertext:    defb "1",255
;set2playertext:    defb "2",255

currentmenuoption:  defb 0
ismainmenu:         defb 0

; ========================================================
; JOYSTICK SCOREBOARD NAME ENTRY
; --------------------------------------------------------

km_wait_key:
  call mc_wait_flyback
  call km_read_key
  jr nc,km_wait_key
ret

km_check_keyrelease:
  ld hl,matrix_buffer
  ld b,10
  ld a,255
  km_wait_keyreleaseloop2:
    cp (hl)
	jr nz,returnkeyheld
	inc hl
  djnz km_wait_keyreleaseloop2
  ; WE HAVE KEY RELEASE
  ; RECORD IT
  scf;xor a ; SET CARRY FLAG
ret
returnkeyheld:
  xor a ; CLEAR CARRY FLAG
ret

km_wait_keyrelease:
  push af
  push bc
  km_wait_keyrelease2:
  call mc_wait_flyback
  ld hl,matrix_buffer
  ld b,10
  ld a,255
  km_wait_keyreleaseloop:
    cp (hl)
	jr nz,km_wait_keyrelease2
	inc hl
  djnz km_wait_keyreleaseloop
  pop bc
  pop af
ret

; FLASH BG PALETTE GREEN BALL
enablepaletteshiftgreenball:
  ld a,&CD  ; CALL = &CD
  ld bc,setcoloursgreenball
  jr setzerointerrupt
; DISABLE PALETTE FADE / CURSOR BLINK
disablezerotinterrupt:
  xor a   ; CALL = &CD
  ld bc,0 ; secondinterruptcommand
  jr setzerointerrupt
; DISABLE PALETTE FADE / CURSOR BLINK
disablefirstinterrupt:
  xor a   ; CALL = &CD
  ld bc,0 ; secondinterruptcommand
  jr setfirstinterrupt
disablefirstinterrupt2:
  xor a   ; CALL = &CD
  ld bc,0 ; secondinterruptcommand
  setfirstinterrupt2:
  ld (firstinterruptcommand2-1),a
  ld (firstinterruptfunction2-2),bc
ret

; DISABLE PALETTE FADE / CURSOR BLINK
disablesecondinterrupt:
  xor a   ; CALL = &CD
  ld bc,0 ; secondinterruptcommand
  jr setsecondinterrupt
; FLASH BG PALETTE ON DISK
enablepaletteshiftbgdisk:
  ld a,&CD  ; CALL = &CD
  ld bc,dopaletteshiftbgdisk2
  setzerointerrupt:
  ld (splitpalettecall2-1),a
  ld (splitpalettefunction2-2),bc
ret
; CYCLE COLOURS OF CUBES ON ROUND COMPLETION
enablecubecyclecolour:
  ; SET TIME FOR CYCLE TO RUN
  ld a,&CD  ; CALL = &CD
  ld bc,cyclecubecolourpalette
  setthirdinterrupt:
  ld (thirdinterruptcommand-1),a
  ld (thirdinterruptfunction-2),bc
ret
disablethirdinterrupt:
  xor a
  ld bc,0
  jr setthirdinterrupt

enablecyclediskpalette:
  ; SET TIME FOR CYCLE TO RUN
  ld a,&CD  ; CALL = &CD
  ld bc,cyclediskpalette
  setfirstinterrupt:
  ld (firstinterruptcommand-1),a
  ld (firstinterruptfunction-2),bc
ret

; FLASH SCREEN PALETTE ON LEVEL SCREEN
enableflashlevelscreenpalette:
  call startflashlevelscreenpalette
  ld a,&CD  ; CALL = &CD
  ld bc,flashlevelscreenpalette ; secondinterruptcommand
  setsecondinterrupt:
  ld (secondinterruptcommand-1),a
  ld (secondinterruptfunction-2),bc
ret

dopaletteshiftbgdisk2:
  ld a,0:currpaletteshiftcount
  call dopaletteshiftbgdisk
  ld a,(currpaletteshiftcount-1)
  inc a
  cp 17
  jr nz,skipresetpaletteshift
  xor a
  call disablezerotinterrupt
  skipresetpaletteshift:
  ld (currpaletteshiftcount-1),a
ret
  

; Z80 BIT *,a COMMANDS AS MACHINE CODE - LITTLE ENDIAN
bit0a equ &47CB
bit1a equ &4FCB
bit2a equ &57CB
bit3a equ &5FCB
bit4a equ &67CB
bit5a equ &6FCB
bit6a equ &77CB
bit7a equ &7FCB

doredefinekeys:
  ld hl,&1110
  ld de,txt_up
  call redefinekey

  ld hl,&1110
  ld de,txt_down
  call redefinekey
  
  ld hl,&1110
  ld de,txt_left
  call redefinekey
 
  ld hl,&1110
  ld de,txt_right
  call redefinekey
  
  ld hl,&1110
  ld de,txt_fire
  call redefinekey
  
  ld hl,&1110
  ld de,txt_pause
  jp redefinekey
  ; REWRITE REDEFINE KEYS TITLE
  ;ld hl,&030F
  ;call locatetextf
  ;ld de,redefinekeystext
  ;jp writelineplainf

; INPUT 
; HL = POSITION ON SCREEN
; DE = TEXT TO PRINT
redefinekey:
  call locatetextf           ; WRITE PROMPT FOR KEY
  call writelineplainfde 
  waitforupkey:
  
    ; SET SPEED OF GAME FOR WALKING
    ld a,(mummymovementok)        ; WAIT UNTIL INTERRUPT TELLS US TO MOVE MUMMIES
    or a
    jr nz,skipmovemummiesmenub    ; WE HAVE MOVED MUMMIES ALREADY
    ld a,1                        ; MARK THAT WE HAVE COMPLETED DELAY
    ld (mummymovementok),a	
	
	; RECORD WHETHER WE ARE TO MOVE ODD OR EVEN MUMMIES IN THIS LOOP
	; WE NEED TO DO THIS TO KEEP GAME SPEED REGULAR
	
	ld a,(moveoddevenmummies)
	xor 1
	ld (moveoddevenmummies),a
	or a
	jr z,moveevenmummies4
	
    ld b,1                   ; MOVE ODD MUMMIES
	jr domovemummies4
	moveevenmummies4:
	ld b,2                   ; MOVE EVEN MUMMIES
	domovemummies4:
	;call domummymovements
	
	skipmovemummiesmenub:
	
    call km_read_key_id      ; GET KEY FROM USER
  jr nc,waitforupkey         ; NO KEY PRESSED
  call km_wait_keyrelease    ; STOP KEY REPEAT
  ;jr nc,waitforupkey
  dec b  ; START LINE FROM 0 NOT 1 FOR LOOKUP
  ld d,b
  ld e,c
; INPUT
; D = LINE, E = BITS
savelinebitsinkeytable:
  ; GET LINE FROM TABLE
  ld a,d
  ld hl,tableoflines
  call vectorlookuphl
  ld b,h ; GET IN DE
  ld c,l

  ld hl,(redefinekeyptr)
  ld (hl),c
  inc hl
  ld (hl),b
  inc hl
  ld (redefinekeyptr),hl
  
  ; GET BITS FROM TABLE
  ld a,e
  ld hl,tableofbits
  call vectorlookuphl
  ld b,h ; GET IN BC
  ld c,l
  
  ld hl,(redefinekeyptr)
  ld (hl),c
  inc hl
  ld (hl),b
  inc hl  
  ld (redefinekeyptr),hl
ret

; REDEFINABLE JOYSTICK AND KEYS TABLE
; THIS IS USED IN THE ACTUAL GAME REGARDLESS OF INPUT METHOD 
; THE KEYS FOR KEYBOARD OR JOYSTICK ARE COPIED INTO IT
redefinekeyptr: defw 0

redefinekeytable:
  ; PLAYER 1
  defw 0,0
  defw 0,0
  defw 0,0
  defw 0,0
  defw 0,0
  defw 0,0
  defw 0,0
  ; PLAYER 2
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0
  ;defw 0,0

; STANDARD JOYSTICK AND KEYS CONFIGURATION
definekeysjoystick:
  ; PLAYER 1
  defw matrix_buffer+9,bit0a
  defw matrix_buffer+9,bit1a
  defw matrix_buffer+9,bit2a
  defw matrix_buffer+9,bit3a
  defw matrix_buffer+9,bit5a ; FIRE 1
  defw matrix_buffer+3,bit3a ; P - PAUSE
  defw matrix_buffer+8,bit2a ; FIRE 2
  ; PLAYER 2
  ;defw matrix_buffer+6,bit0a
  ;defw matrix_buffer+6,bit1a
  ;defw matrix_buffer+6,bit2a
  ;defw matrix_buffer+6,bit3a
  ;defw matrix_buffer+6,bit5a ; FIRE 1
  ;defw matrix_buffer+3,bit3a ; FIRE 2
  ;defw matrix_buffer+8,bit2a
;definekeyskeyboard:
  ; PLAYER 1
  ;defw matrix_buffer+0,bit7a 
  ;defw matrix_buffer+0,bit6a
  ;defw matrix_buffer+8,bit7a
  ;defw matrix_buffer+7,bit7a
  ;defw matrix_buffer+1,bit7a ; FIRE 1
  ;defw matrix_buffer+3,bit3a ; P - PAUSE
  ;defw matrix_buffer+8,bit2a
  ; PLAYER 2
  ;defw matrix_buffer+6,bit5a
  ;defw matrix_buffer+6,bit7a
  ;defw matrix_buffer+8,bit7a
  ;defw matrix_buffer+7,bit7a
  ;defw matrix_buffer+1,bit7a
  ;defw matrix_buffer+3,bit3a
  ;defw matrix_buffer+8,bit2a
  
; TABLES MAKE IT EASIER TO LOOK UP ADRESSES FROM AN INTEGER LINE OR BIT
tableoflines:
  defw matrix_buffer+0
  defw matrix_buffer+1
  defw matrix_buffer+2
  defw matrix_buffer+3
  defw matrix_buffer+4
  defw matrix_buffer+5
  defw matrix_buffer+6
  defw matrix_buffer+7
  defw matrix_buffer+8
  defw matrix_buffer+9
tableofbits:
  defw bit0a
  defw bit1a
  defw bit2a
  defw bit3a
  defw bit4a
  defw bit5a
  defw bit6a
  defw bit7a

; JOYSTICK KEYS
;setkeyboardbits:
;  ld hl,definekeyskeyboard
;  jr copykeyboardlinesbits 
setjoystickbits:
  ld hl,definekeysjoystick
  copykeyboardlinesbits:
  ld de,redefinekeytable
  ld bc,24*2
  ldir
ret

;defb "CHRISA"

; COPY KEYS LINES AND BITS INTO FUNCTIONS TO CHECK FOR THEM
setlinesandbits:
  ; PLAYER 1
  ; UP
  ld hl,(redefinekeytable+0)
  ld (testkeybuffercommandup-2),hl
  ld hl,(redefinekeytable+2)
  ld (testkeybitcommandup-2),hl
  ; DOWN
  ld hl,(redefinekeytable+4)
  ld (testkeybuffercommanddown-2),hl
  ld hl,(redefinekeytable+6)
  ld (testkeybitcommanddown-2),hl
  ; LEFT
  ld hl,(redefinekeytable+8)
  ld (testkeybuffercommandleft-2),hl
  ld hl,(redefinekeytable+10)
  ld (testkeybitcommandleft-2),hl
  ; RIGHT
  ld hl,(redefinekeytable+12)
  ld (testkeybuffercommandright-2),hl
  ld hl,(redefinekeytable+14)
  ld (testkeybitcommandright-2),hl
  ; FIRE
  ld hl,(redefinekeytable+16)
  ld (testkeybuffercommandfire-2),hl
  ld hl,(redefinekeytable+18)
  ld (testkeybitcommandfire-2),hl
  ; PAUSE GAME
  ld hl,(redefinekeytable+20)
  ld (testkeybuffercommandpause-2),hl
  ld hl,(redefinekeytable+22)
  ld (testkeybitcommandpause-2),hl
  ; PLAYER 2
  ; UP
  ;ld bc,(redefinekeytable+24)
  ;ld (testkeybuffercommandup2-2),bc
  ;ld bc,(redefinekeytable+26)
  ;ld (testkeybitcommandup2-2),bc
  ;; DOWN
  ;ld bc,(redefinekeytable+28)
  ;ld (testkeybuffercommanddown2-2),bc
  ;ld bc,(redefinekeytable+30)
  ;ld (testkeybitcommanddown2-2),bc
  ;; LEFT
  ;ld bc,(redefinekeytable+32)
  ;ld (testkeybuffercommandleft2-2),bc
  ;ld bc,(redefinekeytable+34)
  ;ld (testkeybitcommandleft2-2),bc
  ;; RIGHT
  ;ld bc,(redefinekeytable+36)
  ;ld (testkeybuffercommandright2-2),bc
  ;ld bc,(redefinekeytable+38)
  ;ld (testkeybitcommandright2-2),bc
  ; FIRE
  ;ld bc,(redefinekeytable+40)
  ;ld (testkeybuffercommandfire2-2),bc
  ;ld bc,(redefinekeytable+42)
  ;ld (testkeybitcommandfire2-2),bc
  ; PAUSE GAME
  ;ld bc,(redefinekeytable+44)
  ;ld (testkeybuffercommandpause2-2),bc
  ;ld bc,(redefinekeytable+46)
  ;ld (testkeybitcommandpause2-2),bc
ret



; INPUT - GENERAL
; WHEN PLAYER CHANGES FROM KEYBOARD TO JOYSTICK,
; OR REDEFINES KEYS, THESE MEMORY LOCATIONS AND BIT TESTING COMMANDS ARE OVERWRITTEN WITH CORRECT VALUES
; PLAYER 1
testkeyup:
  ld hl,matrix_buffer+9:testkeybuffercommandup
  ld a,(hl)
  bit 0,a:testkeybitcommandup
ret
testkeydown:
  ld hl,matrix_buffer+9:testkeybuffercommanddown
  ld a,(hl)
  bit 1,a:testkeybitcommanddown
ret
testkeyleft:
  ld hl,matrix_buffer+9:testkeybuffercommandleft
  ld a,(hl)
  bit 2,a:testkeybitcommandleft
ret
testkeyright:
  ld hl,matrix_buffer+9:testkeybuffercommandright
  ld a,(hl)
  bit 3,a:testkeybitcommandright
ret
testkeyfire:
  ld hl,matrix_buffer+9:testkeybuffercommandfire
  ld a,(hl)
  bit 5,a:testkeybitcommandfire
ret
testkeyfire2:
  ld hl,matrix_buffer+9:testkeybuffercommandfire2
  ld a,(hl)
  bit 4,a:testkeybitcommandfire2
ret
testkeypause:
  ld hl,matrix_buffer+3:testkeybuffercommandpause
  ld a,(hl)
  bit 3,a:testkeybitcommandpause
ret

; PLAYER 2
;testkeyup2:
;  ld hl,matrix_buffer+6:testkeybuffercommandup2
;  ld a,(hl)
;  bit 0,a:testkeybitcommandup2
;ret
;testkeydown2:
;  ld hl,matrix_buffer+6:testkeybuffercommanddown2
;  ld a,(hl)
;  bit 1,a:testkeybitcommanddown2
;ret
testkeyleft2:
  ld hl,matrix_buffer+6:testkeybuffercommandleft2
  ld a,(hl)
  bit 2,a:testkeybitcommandleft2
ret
;testkeyright2:
;  ld hl,matrix_buffer+6:testkeybuffercommandright2
;  ld a,(hl)
;  bit 3,a:testkeybitcommandright2
;ret
;testkeyfire2:
;  ld hl,matrix_buffer+8:testkeybuffercommandfire2
;  ld a,(hl)
;  bit 2,a:testkeybitcommandfire2
;ret
;testkeypause2:
;  ld hl,matrix_buffer+3:testkeybuffercommandpause2
;  ld a,(hl)
;  bit 3,a:testkeybitcommandpause2
;ret                       

defb "CHRIS2"  ; AROUND 3F90

; DATA BUFFER FOR SPEECH ROM
; NEED TO POINT IY TO THIS BEFORE WE CALL COMMANDS TO SPEAK
; IX NEEDS TO BE PTR TO STRING TO SPEAK
;speechimturnedon: defb "HELLO. I'M TURNED ON",10,13,0
speechdatabuffer: ds 235

; DISK COMPILATION MUST COMPILE ENTIRE PROJECT TO BE ABLE TO INSERT CONTENTS IN DISK HERE
; CARTRIDGE AND CASETTE COMPILATION CAN BE DONE SEPARATELY

ifndef ISCART
ifndef ISCASSETTE
;defb "CHRIS4"
; RASM INSERT INTO DSK
SAVE "QBERT3.BIN",&4000,&3B00,DSK,"../compile/build/QBert.dsk" ; LEAVE SPACE FOR FIRMWARE SO IT IS NOT OVERWRITTEN- WE NEED FOR CASETTE LOADING
SAVE "QBERT1.BIN",&0100,&3EFF,DSK,"../compile/build/QBert.dsk"
SAVE "QBERT2.BIN",&C100,&3EFF,DSK,"../compile/build/QBert.dsk" ; LEAVE 100 FOR THE STACK FOR LOADER!

endif
;ifdef ISCASSETTE
;save "QBERT3.BIN",&4000,&3B00 ; LEAVE SPACE FOR FIRMWARE SO IT IS NOT OVERWRITTEN - WE NEED FOR CASETTE LOADING
;save "QBERT2.BIN",&C100,&3EFF ; LEAVE 100 FOR THE STACK FOR LOADER!
;SAVE "QBERT1.BIN",&0100,&3EFF
;endif
endif