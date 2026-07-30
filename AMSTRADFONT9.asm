my_txt_set_window_ptr            equ &0103
my_txt_clear_window_ptr          equ my_txt_set_window_ptr+3
txt_set_paper_ptr                equ my_txt_clear_window_ptr+3
txt_set_pen_ptr                  equ txt_set_paper_ptr+3
scr_next_line_hl_ptr             equ txt_set_pen_ptr+3
locatetextf_ptr                  equ scr_next_line_hl_ptr+3
writelineplainf_ptr              equ locatetextf_ptr+3
scr_set_ink_ptr                  equ writelineplainf_ptr+3

; MASK TABLE = &FF00-FFFF
; SPARE SPRITE BUFFER = &FE00-FF00


org &C100
startofdataqbert3:

;align 256
amsfonttable:
  defw t1 ; 32 SPACE - 32
  defw t2 ; 33 !
  defw t3 ; 34
  defw t4 ; 35
  defw t5 ; 36
  defw t6 ; 37
  defw t7 ; 38 '
  defw t8 ; 39
  defw t9 ; 40
  defw t10
  defw t11
  defw t12
  defw t13 
  defw t14 ; -
  defw t15
  defw t16
  defw t17 ; 1
  defw t18 ; 2
  defw t19 ; 50
  defw t20
  defw t21
  defw t22
  defw t23
  defw t24
  defw t25
  defw t26
  defw t27
  defw t28
  defw t29 ; 60
  defw t30 ; >
  defw t31
  defw t32
  defw t33
  defw t34
  defw t35
  defw t36
  defw t37
  defw t38
  defw t39 ;70
  defw t40 ; 
  defw t41 ; 
  defw t43 ; 
  defw t44 ; 
  defw t45 ; 
  defw t46 ; 
  defw t47 ; M
  defw t48
  defw t49
  defw t50 ;80
  defw t51
  defw t52
  defw t53
  defw t54
  defw t55
  defw t56
  defw t57
  defw t58 ; 
  defw t59 ; Z
  defw t60 ; 90 [
  
toppixelrow_levelscreen equ &8000+64+64+64;F0

; LOCATION TABLE OF CUBES
qubelocationtable_levelscreen:
  defw toppixelrow_levelscreen+32-4
  
  defw toppixelrow_levelscreen+64+64+64+32-4-4
  defw toppixelrow_levelscreen+64+64+64+32-4+4
  
  defw toppixelrow_levelscreen+64+64+64+64+64+64+32-4-4-4
  defw toppixelrow_levelscreen+64+64+64+64+64+64+32-4
  defw toppixelrow_levelscreen+64+64+64+64+64+64+32-4+4+4

toppixelrow equ &8000+64+64+64+64+64+64+64+64;F0

; LOCATION TABLE OF CUBES
qubelocationtable:
  defw toppixelrow+32-4
  
  defw toppixelrow+64+64+64+32-4-4
  defw toppixelrow+64+64+64+32-4+4
  
  defw toppixelrow+64+64+64+64+64+64+32-4-4-4
  defw toppixelrow+64+64+64+64+64+64+32-4
  defw toppixelrow+64+64+64+64+64+64+32-4+4+4

  defw toppixelrow+64+64+64+64+64+64+64+64+64+32-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+32-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+32-4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+32-4+4+4+4
  
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+32-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4+4+4

  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4+4+4+4
  
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4-4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4-4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4+4+4
  defw toppixelrow+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+64+32-4+4+4+4+4+4+4
  
align 256 ; STARTS C200
jumptable:
  jp playsound_all_channelsf  ;39
  jp initmusicf
  jp playmusicf
  jp playsound_a
  jp playsound_b
  jp playsound_c
  jp initsoundf
  jp doballcollisionnoise
  jp dojumpnoisebigball
  jp dodiednoise
  jp setupplussprites
  jp hideallplussprites
  jp moveplussprite3
  jp dojumpnoise
  jp clearasicsprite
  jp dojumpnoisecoily
  jp dojumpnoiseredball
  jp hideplussprite
  jp playlevelcompletemusic
  jp playdiskmusic
  jp drawqube
  jp drawpyramid
  jp setuppluspalette
  jp scr_set_border_plus
  
  jp setblockcolour
  jp cyclediskpalette
  jp cyclechangetotext
  
  jp cyclecubecolourpalette
  jp setuppluspalettemode1
  jp playemptymusic
  jp drawminiqube
  jp setpaletteroundcolours
  jp updatepaletteroundcolours
  
  jp moveplussprite2
  jp drawlevelscreenpyramid
  jp setuppluspalettescoreboardbigletters
  jp setlevellogopalette
  jp setuppluspalettescoreboardnormal
  jp setlevellogopalette2
  jp setblockcolour_levelscreen
  jp startflashlevelscreenpalette
  jp flashlevelscreenpalette
  jp dopaletteshiftbgdisk
  jp cycleplayerpalette
  jp setplayertextcolours
  jp setbgblack
  jp shiftcoloursgreenball
  jp qbert_right_clip8
  jp qbert_right_clip9
  jp qbert_right_clip10
  jp qbert_right_clip11
  jp qbert_right_clip12
  jp qbert_right_clip13
  jp dofinishnoisescoreboard
  jp dodropstartnoise
  jp dodrawnormalimage2_compressed
  jp dodrawflippedimage2_compressed
  jp drawnormalimage_fixedid_compressed
  jp drawflipimage_fixedid_compressed
  jp coily_right_clip8
  jp coily_right_clip9
  jp coily_right_clip10
  jp coily_right_clip11
  jp coily_right_clip12
  jp coily_right_clip13
  jp coily_right_clip14
  jp dodeathleapnoise
  jp doexplosionsound
  jp dolazerboltnoise
  jp playgreenballmusic
  jp playnewlevelmusic

spritetable:
  defw image_disk
  defw image_qbert_backright
  defw image_qbert_backright_landed
  defw image_qbert_frontright
  defw image_qbert_frontright_landed
  defw image_redball
  defw image_redball_squash
  defw image_coilyegg
  defw image_coilyegg_squash
  defw image_coilysnake_backright_landed
  defw image_coilysnake_frontright_landed
  defw image_coilysnake_frontright_top
  defw image_coilysnake_frontright_bottom
  defw image_coilysnake_backright_top
  defw image_coilysnake_backright_bottom
  defw image_greenball
  defw image_greenball_squash
  defw image_slick_crouch
  defw image_slick_1
  defw image_slick_2
  defw image_slick_3
  defw image_sam_crouch
  defw image_sam_1
  defw image_sam_2
  defw image_sam_3
  defw image_ugg_backright
  defw image_ugg_backright2
  defw image_red_underline
  defw image_ugg_backright3
  defw image_ugg_backright4 
  defw image_ww_backright
  defw image_ww_backright2
  defw image_ww_backright3
  defw image_ww_backright4
  defw image_coilysnake_backright_bottom_clip8
  defw image_coilysnake_backright_bottom_clip9
  defw image_coilysnake_backright_bottom_clip10
  defw image_coilysnake_backright_top_clip10
  defw image_coilysnake_backright_bottom_clip11
  defw image_coilysnake_backright_top_clip11
  defw image_coilysnake_backright_top_clip12



; DATA AREA
musicstatus:  defb 0 ; MUSIC SCORE STATUS - 0 = NOT PLAYING, 1 = PLAYING
  
  
  
ifdef ISCART
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
endif

numplussprites equ 15

hideallplussprites:
  ld b,numplussprites
  hideallplusspritesloop:
    call hideplussprite
  djnz hideallplusspritesloop
  jp hideplussprite

; INPUT
; B = SPRITE NUMBER
hideplussprite:
  push hl
  push af
  ld a,b

  ; GET CORRECT POSITION OF SPRITE NUMBER IN ASIC RAM
  rlca
  rlca
  rlca

  ;; set x coordinate for sprite 0
  ld h,&60
  ld l,a
  ;ld (hl),e

  inc l
  inc l
  ;; set y coordinate for sprite 0
  ;ld (hl),d

  inc l
  inc l
  ;; set sprite x and y magnification
  ;; x magnification = 1
  ;; y magnification = 1
  ;ld a,%1001
  ld (hl),0 ; HIDE SPRITE
  pop af
  pop hl
ret

; INPUT
; A = SPRITE NUMBER
; HL = Y X POSITION CHAR
moveplussprite2:  
  push hl
  ; GET CORRECT POSITION OF SPRITE NUMBER IN ASIC RAM
  rlca
  rlca
  rlca

  ld b,h     ; STORE HEIGHT IN B

  ld h,0     ; FIND X POS   - RESOLUTION 640 X
  add hl,hl  ; DOUBLE       - RESOLUTION 320 X
  add hl,hl  ; DOUBLE AGAIN - RESOLUTION 160 X
  ;add hl,hl  ; DOUBLE AGAIN TO GET X PIXEL COORDINATE
  ;add hl,hl
  
  ex de,hl
  ;; set x coordinate for sprite 0
  ld h,&60
  ld l,a
  ld (hl),e
  inc l
  ld (hl),d

  inc l
  ;; set y coordinate for sprite 0
  ;ld a,b 
  ;rlca      ; TRIPLE H TO GET Y POS LINE
  ;rlca
  ;rlca
  ;ld a,b
  ;sub 200
  ;jr c,skipresetheight
  ;ld b,0 ; STOP QBERT GOING OFF TOP OF SCREEN
  ;skipresetheight:
  
  ld (hl),b

  inc l
  inc l
  ;; set sprite x and y magnification
  ;; x magnification = 1
  ;; y magnification = 1
  ld a,%1001
  ld (hl),a
  pop hl
ret

; INPUT
; A = SPRITE NUMBER
; HL = X POSITION
; B = Y POSITION
moveplussprite3:  
  push hl
  ; GET CORRECT POSITION OF SPRITE NUMBER IN ASIC RAM
  rlca
  rlca
  rlca

  ;ld b,h     ; STORE HEIGHT IN B

  ;ld h,0     ; FIND X POS   - RESOLUTION 640 X
  ;add hl,hl  ; DOUBLE       - RESOLUTION 320 X
  ;add hl,hl  ; DOUBLE AGAIN - RESOLUTION 160 X
  ;add hl,hl  ; DOUBLE AGAIN TO GET X PIXEL COORDINATE
  ;add hl,hl
  
  ex de,hl
  ;; set x coordinate for sprite 0
  ld h,&60
  ld l,a
  ld (hl),e
  inc l
  ld (hl),d

  inc l
  ;; set y coordinate for sprite 0
  ;ld a,b 
  ;rlca      ; TRIPLE H TO GET Y POS LINE
  ;rlca
  ;rlca
  ;ld a,b
  ;sub 200
  ;jr c,skipresetheight2
  ;ld b,0 ; STOP QBERT GOING OFF TOP OF SCREEN
  ;skipresetheight2:
  
  ld (hl),b

  inc l
  inc l
  ;; set sprite x and y magnification
  ;; x magnification = 1
  ;; y magnification = 1
  ld a,%1001
  ld (hl),a
  pop hl
ret
setuppluspalettescoreboardnormal:
  ld hl,palette_scoreboard_normal
  jr dosetuppluspalettemode1
setuppluspalettescoreboardbigletters:
  ld hl,palette_scoreboard_bigletters
  jr dosetuppluspalettemode1
; PALETTE FOR MENU SCREENS
setuppluspalettemode1:
  ld hl,palette_mode1
  dosetuppluspalettemode1:
  ld de,&6400
  ld bc,8
  ldir
ret
setuppluspalette:
  ld hl,palette
  ; SET UP PALETTE
  dosetuppluspalette:
  ld de,&6400
  ld bc,32
  ldir
ret



; INPUT
; DE = BORDER COLOUR - 0,G,B,R
scr_set_border_plus:
  push hl
  ld hl,&6420 ; &6420/21 BORDER COLOUR
  ld (hl),e   ; WRITE PALETTE DATA TO REGISTERS
  inc hl
  ld (hl),d
  pop hl
ret

setupplussprites:
  ;;--------------------------------------------------
  ;; STEP 2 - Setup sprite pixel data
  ;;
  ;; The ASIC has internal "RAM" used to store the sprite pixel
  ;; data. If you want to change the pixel data for a sprite
  ;; then you need to copy new data into the internal "RAM".
 
  ;; copy colours into ASIC sprite palette registers
  ld hl,sprite_colours
  ld de,&6422
  ld bc,15*2
  ldir
  
  ; QBERT SPRITE FOR MENU
  ld hl,image_qbert_frontright
  xor a
  call drawnormalimage_fixedid_compressed

  ; DISK
  ld hl,image_disk
  ld a,1
  call drawnormalimage_fixedid_compressed
  
  ld de,&0238
  jp scr_set_border_plus

; =============================================================
;  PALETTE FUNCTIONS
; -------------------------------------------------------------

shift_counter: defb 0
shift_r: defb 5
shift_g: defb 10
shift_b: defb 15

shiftcoloursgreenball:
  ; ALTERNATELY CHANGE COLOUR PENS
  ld a,(shift_counter)
  inc a
  cp 4
  jr nz,skipreset_shiftcounter
  xor a
  skipreset_shiftcounter:
  ld (shift_counter),a
  or a
  jr z,doshiftb
  cp 1
  jr z,doshiftg
doshiftr:
  ld hl,shift_r
  jr doshift
doshiftg:
  ld hl,shift_g
  jr doshift
doshiftb:
  ld hl,shift_b
  doshift:
  ld a,(hl)
  inc a
  cp 16
  jr nz,skipresetcolour
  ld a,5
  skipresetcolour:
  ld (hl),a
  ; SET COLOURS
  ld a,(shift_r)
  rla
  rla
  rla
  rla
  ld b,a
  ld a,(shift_g)
  or b
  ld l,a
  ld a,(shift_b)
  ld h,a
  jr dosetbackgroundcolour
  
; INPUT
; A = PALETTE COUNT
dopaletteshiftbgdisk:
  ld hl,palette_shift_background_disk
  ld b,0
  ld c,a
  add hl,bc
  
  ld h,(hl)
  ld l,0
  dosetbackgroundcolour:
  ld (palette),hl ; SET PALETTE
  ld (&6400),hl ; SET BACKGROUND ASIC
  ld (&6420),hl ; SET BORDER ASIC
ret
setbgblack:
  ld hl,0
  jr dosetbackgroundcolour
  
; FADE FROM GREEN TO BLACK
palette_shift_background_disk:
  defb &06
  defb &0a
  defb &0f
  defb &0e
  defb &0c
  defb &0b
  defb &0a
  defb &09
  defb &08
  defb &07
  defb &06
  defb &05
  defb &04
  defb &03
  defb &02
  defb &01
  defb &00

; MAIN MENU PALETTE
palette_mode1:
  defw &0238 ; PURPLE 312177
  defw &08f0 ; BRIGHT ORANGE ff7700
  defw &0ee0 ; YELLOW dede00
  defw &0c00 ; BRIGHT GREEN 008800
  
; LEVEL TEXT PALETTE - SET TO SAME AS ROUND COLOURS
palette_levellogo:
  defw &0000 ; BLACK
  defw &08f0 ; BRIGHT ORANGE ff7700
  defw &0ee0 ; YELLOW dede00
  defw &0c00 ; BRIGHT GREEN 008800
  
; FOR NUMBER AT BOTTOM OF SCREEN
palette_levellogo2_flash:
  defw &0000 ; BLACK
  defw &0900 ; DARK GREEN
  defw &0ee0 ; YELLOW dede00
  defw &00f0 ; RED

; FOR NUMBER AT BOTTOM OF SCREEN - BLANKED
palette_levellogo2:
  defw &0000 ; BLACK
  defw &0900 ; DARK GREEN
  defw &0000 ; YELLOW dede00
  defw &0000 ; RED
  
; FOR BIG LETTERS IN SCOREBOARD
palette_scoreboard_bigletters:
  defw &0000 ; BLACK
  defw &08f0 ; BRIGHT ORANGE ff7700
  defw &0ee0 ; YELLOW dede00
  defw &00f0 ; RED

; FOR REST OF SCOREBOARD
palette_scoreboard_normal:
  defw &0000 ; BLACK
  defw &08f0 ; BRIGHT ORANGE ff7700
  defw &02bb ; PURPLE b01fb0
  defw &00f0 ; RED

cycleplayerpalettecounter: defb 0
cycleplayerpaletteptr:     defw palette_playertext
cycleplayerpalette:
  ld hl,(cycleplayerpaletteptr)
  inc hl
  inc hl
  ld a,(cycleplayerpalettecounter)
  inc a
  cp 7
  jr nz,skipresetplayerpalettecounter
  xor a
  ld hl,palette_playertext
  skipresetplayerpalettecounter:
  ld (cycleplayerpaletteptr),hl
  ld (cycleplayerpalettecounter),a
ret  

palette_playertext_fixed:
  defw &06f9 ; 8
  defw &05d8 ; 9
; CYCLE PINKS
palette_playertext:
  defw &06f9 ; 8
  defw &05d8 ; 9
  defw &04c8 ; 10
  defw &02a7 ; 11
  defw &0076 ; 12
  defw &02a7 ; 13
  defw &04c8 ; 14
  defw &05d8 ; 15
  ; BELOW COLOURS ARE CYCLED
  defw &06f9
  defw &05d8
  defw &04c8
  defw &02a7
  defw &0076
  defw &02a7
  defw &04c8
  defw &05d8

;; 0,GREEN,RED,BLUE,
palette:     ; COLOUR HTML RGB
  defw &0000 ; BACKGROUND BLACK (PURPLE 31 21 77)
  
  defw &08f0 ; BRIGHT ORANGE ff7700 - PENS FOR MODE 1 MENU
  defw &0ee0 ; YELLOW dede00        - PENS FOR MODE 1 MENU
  defw &0c00 ; BRIGHT GREEN 008800  - PENS FOR MODE 1 MENU
palette_cubecolours:
  defw &056f ; PURPLE 5646ef        - COLOUR OF UNSELECTED CUBE
  defw &0ee0 ; YELLOW dede00        - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  
  ; UNUSED COLOURS
  
  defw &0af2 ; RED ef1021
  defw &06f0 ; ORANGE ef5600
  ;defw &08f0 ; BRIGHT ORANGE ff7700
  defw &0700 ; GREEN 006600
  ;defw &0900 ; BRIGHT GREEN 008800
  defw &0087 ; DARK PINK 770066
  defw &00bb ; MED PINK a900a9
  defw &07fa ; BRIGHT PINK ef6699
  defw &0fff ; WHITE ffffff
palette_cubecolours2:
  defw &0b6a ; TEAL 56a999         - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646    - CUBE RIGHT SIDE
  
; PALETTE ORDER NUMBERS IN ARCADE. 4,5,2,1,3
;; 0,GREEN,RED,BLUE,
palette_level1_round1:     ; COLOUR HTML RGB
  defw &056f ; PURPLE 5646ef        - COLOUR OF UNSELECTED CUBE
  defw &0ee0 ; YELLOW dede00        - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level1_round2:     ; COLOUR HTML RGB
  defw &0c23 ; GREEN 21b931   - COLOUR OF UNSELECTED CUBE
  defw &050e ; BLUE 0046de          - 1st COLOUR OF CUBE
  defw &0ef8 ; YELLOW efde77          - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN 663100              - CUBE LEFT SIDE  
  defw &08f2 ; ORANGE ff7721               - CUBE RIGHT SIDE

;; 0,GREEN,RED,BLUE,
palette_level1_round3:     ; COLOUR HTML RGB
  defw &0dcd ; PALE WHITE b9cece    - COLOUR OF UNSELECTED CUBE
  defw &072d ; BLUE 2166ce     - 1st COLOUR OF CUBE
  defw &0555 ; PINK 464646          - 2nd COLOUR OF CUBE
  defw &0888 ; LIGHT GREY 777777          - CUBE LEFT SIDE
  defw &0222 ; DARK GREY   212121         - CUBE RIGHT SIDE 
  
;; 0,GREEN,RED,BLUE,
palette_level1_round4:     ; COLOUR HTML RGB
  defw &070f ; PALE BLUE 0066ef    - COLOUR OF UNSELECTED CUBE
  defw &0cb1 ; YELLOW a9b910       - 1st COLOUR OF CUBE
  defw &00a7 ; PINK 990066         - 2nd COLOUR OF CUBE
  defw &0989 ; LIGHT GREY 778888         - CUBE LEFT SIDE
  defw &011a; DARK BLUE 101099          - CUBE RIGHT SIDE 
  
;; 0,GREEN,RED,BLUE,
palette_level2_round1:     ; COLOUR HTML RGB
  defw &050e ; BLUE 0046de    - COLOUR OF UNSELECTED CUBE
  defw &0ef8 ; YELLOW efde77       - 1st COLOUR OF CUBE
  defw &0c23 ; BRIGHT GREEN 21b931 - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN  663100            - CUBE LEFT SIDE  
  defw &08f2 ; ORANGE  ff7721             - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level2_round2:              ; COLOUR HTML RGB
  defw &00a7 ; DARK PINK 990066    - COLOUR OF UNSELECTED CUBE
  defw &070f ; BLUE 0066ef         - 1st COLOUR OF CUBE
  defw &0cb1 ; YELLOW a9b910       - 2nd COLOUR OF CUBE 
  defw &0989 ; LIGHT GREY 778888         - CUBE LEFT SIDE
  defw &011a ; DARK BLUE 101099          - CUBE RIGHT SIDE 
  
;; 0,GREEN,RED,BLUE,
palette_level2_round3:             ; COLOUR HTML RGB
  defw &07f7 ; PINK ff6666         - COLOUR OF UNSELECTED CUBE
  defw &056f ; PURPLE 5646ef       - 1st COLOUR OF CUBE
  defw &0ee0 ; YELLOW dede00       - 2nd COLOUR OF CUBE 
  defw &0b6a ; TEAL 56a999         - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646    - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level2_round4:              ; COLOUR HTML RGB
  defw &0dd0 ; YELLOW cece00        - COLOUR OF UNSELECTED CUBE
  defw &050f ; BLUE 0046ef          - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE 
  defw &0000 ; BLACK                - CUBE LEFT SIDE
  defw &0000 ; BLACK                - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level3_round1:     ; COLOUR HTML RGB
  defw &082d ; TEAL 2188ce          - COLOUR OF UNSELECTED CUBE
  defw &030a ; DARKER BLUE 003199     - 1st COLOUR OF CUBE
  defw &0098 ; PINK 880077          - 2nd COLOUR OF CUBE 
  defw &0cc2 ; YELLOW b9b921        - CUBE LEFT SIDE
  defw &03c3 ; RED b93131           - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level3_round2:     ; COLOUR HTML RGB
  defw &0555 ; DARK GREY 464646     - COLOUR OF UNSELECTED CUBE
  defw &0dcd ; PALE WHITE b9cece    - 1st COLOUR OF CUBE
  defw &072d ; PINK 2166ce          - 2nd COLOUR OF CUBE
  defw &0888 ; LIGHT GREY 777777          - CUBE LEFT SIDE
  defw &0222 ; DARK GREY  212121          - CUBE RIGHT SIDE 
  
;; 0,GREEN,RED,BLUE,
palette_level3_round3:     ; COLOUR HTML RGB
  defw &050e ; MED BLUE 0046de     - COLOUR OF UNSELECTED CUBE
  defw &0ef8 ; YELLOW efde77        - 1st COLOUR OF CUBE
  defw &0c23 ; BRIGHT GREEN 21b931  - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN 663100              - CUBE LEFT SIDE  
  defw &08f2 ; ORANGE ff7721               - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level3_round4:     ; COLOUR HTML RGB
  defw &0ee0 ; YELLOW dede00        - COLOUR OF UNSELECTED CUBE
  defw &056f ; PURPLE 5646ef        - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level4_round1:     ; COLOUR HTML RGB
  defw &0c23 ; GREEN 21b931     - COLOUR OF UNSELECTED CUBE
  defw &0ef8 ; YELLOW efde77        - 1st COLOUR OF CUBE
  defw &050e ; BLUE  0046de  - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN 663100              - CUBE LEFT SIDE  
  defw &08f2 ; ORANGE ff7721                - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level4_round2:     ; COLOUR HTML RGB
  defw &050f ; MED BLUE 0046ef     - COLOUR OF UNSELECTED CUBE
  defw &07f7 ; PINK ff6666          - 1st COLOUR OF CUBE
  defw &0dd0 ; YELLOW cece00        - 2nd COLOUR OF CUBE
  defw &0000 ; BLACK               - CUBE LEFT SIDE  
  defw &0000 ; BLACK                - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level4_round3:     ; COLOUR HTML RGB
  defw &0ee0 ; YELLOW dede00        - COLOUR OF UNSELECTED CUBE
  defw &07f7 ; PINK ff6666          - 1st COLOUR OF CUBE
  defw &056f ; PURPLE 5646ef        - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
 
;; 0,GREEN,RED,BLUE,
palette_level4_round4:     ; COLOUR HTML RGB
  defw &00a7 ; DARK PINK 990066         - COLOUR OF UNSELECTED CUBE
  defw &056f ; PALER BLUE 5646ef    - 1st COLOUR OF CUBE
  defw &0cb1 ; YELLOW a9b910       - 2nd COLOUR OF CUBE 
  defw &0989 ; LIGHT GREY  778888        - CUBE LEFT SIDE
  defw &011a ; DARK BLUE 101099          - CUBE RIGHT SIDE 

;; 0,GREEN,RED,BLUE,
palette_level5_round1:     ; COLOUR HTML RGB
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0ee0 ; YELLOW dede00        - 1st COLOUR OF CUBE
  defw &056f ; PURPLE 5646ef        - COLOUR OF UNSELECTED CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE

;; 0,GREEN,RED,BLUE,
palette_level5_round2:     ; COLOUR HTML RGB
  defw &0c23 ; BRIGHT GREEN 21b931 - COLOUR OF UNSELECTED CUBE
  defw &050e ; MED BLUE 0046de    - 1st COLOUR OF CUBE
  defw &0ef8 ; PALE YELLOW efde77       - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN 663100              - CUBE lEFT SIDE 
  defw &08f2 ; ORANGE ff7721             - CUBE RIGHT SIDE
  
;; 0,GREEN,RED,BLUE,
palette_level5_round3:     ; COLOUR HTML RGB
  defw &0555 ; MED GREY 464646     - COLOUR OF UNSELECTED CUBE
  defw &072d ; PALER BLUE 2166ce     - 1st COLOUR OF CUBE
  defw &0dcd ; PALE WHITE b9cece    - 2nd COLOUR OF CUBE
  defw &0888 ; LIGHT GREY  777777         - CUBE LEFT SIDE
  defw &0222 ; DARK GREY  212121          - CUBE RIGHT SIDE 
  
;; 0,GREEN,RED,BLUE,
palette_level5_round4:     ; COLOUR HTML RGB
  defw &0cb1 ; YELLOW a9b910        - COLOUR OF UNSELECTED CUBE
  defw &070f ; PALER BLUE 0066ef     - 1st COLOUR OF CUBE
  defw &00a7 ; PINK 990066          - 2nd COLOUR OF CUBE
  defw &0989 ; LIGHT GREY 778888          - CUBE LEFT SIDE
  defw &011a ; DARK BLUE   101099         - CUBE RIGHT SIDE 
  
 ;; 0,GREEN,RED,BLUE,
palette_level6_round1:     ; COLOUR HTML RGB
  defw &0c23 ; BRIGHT GREEN 21b931 - COLOUR OF UNSELECTED CUBE
  defw &050e ; MED BLUE 0046de    - 1st COLOUR OF CUBE
  defw &0ef8 ; PALE YELLOW efde77       - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN   663100            - CUBE LEFT SIDE 
  defw &08f2 ; ORANGE   ff7721           - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level6_round2:     ; COLOUR HTML RGB
  defw &070f ; PALER BLUE 0066ef     - 1st COLOUR OF CUBE
  defw &00a7 ; DARK PINK 990066         - COLOUR OF UNSELECTED CUBE
  defw &0cb1 ; PALE YELLOW a9b910       - 2nd COLOUR OF CUBE
  defw &0989 ; LIGHT GREY 778888          - CUBE LEFT SIDE
  defw &011a ; DARK BLUE   101099         - CUBE RIGHT SIDE 
  
 ;; 0,GREEN,RED,BLUE,
palette_level6_round3:     ; COLOUR HTML RGB
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0ee0 ; YELLOW dede00     - 1st COLOUR OF CUBE
  defw &056f ; PURPLE 5646ef        - COLOUR OF UNSELECTED CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE

 ;; 0,GREEN,RED,BLUE,
palette_level6_round4:     ; COLOUR HTML RGB
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &056f ; MED BLUE 5646ef     - 1st COLOUR OF CUBE
  defw &0dd0 ; YELLOW cece00        - COLOUR OF UNSELECTED CUBE
  defw &0000 ; BLACK               - CUBE LEFT SIDE  
  defw &0000 ; BLACK                - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level7_round1:     ; COLOUR HTML RGB
  defw &030a ; DARK BLUE 003199          - 2nd COLOUR OF CUBE
  defw &092d ; PALE BLUE 2188ce     - 1st COLOUR OF CUBE
  defw &0098 ; DARK PINK 880077      - COLOUR OF UNSELECTED CUBE
  defw &0cc2 ; YELLOW b9b921        - CUBE LEFT SIDE  
  defw &03c3 ; ORANGE b93131             - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level7_round2:     ; COLOUR HTML RGB
  defw &0dcd ; PALE WHITE b9cece   - COLOUR OF UNSELECTED CUBE
  defw &0555 ; GREY 464646       - 1st COLOUR OF CUBE
  defw &072d ; PALE BLUE 2166ce     - 2nd COLOUR OF CUBE
  defw &0888 ; LIGHT GREY 777777          - CUBE LEFT SIDE
  defw &0222 ; DARK GREY  212121          - CUBE RIGHT SIDE 
  
 ;; 0,GREEN,RED,BLUE,
palette_level7_round3:     ; COLOUR HTML RGB
  defw &0c23 ; BRIGHT GREEN 21b931 - COLOUR OF UNSELECTED CUBE
  defw &050e; MED BLUE 0046de              - 1st COLOUR OF CUBE
  defw &0ef8 ; PALE YELLOW efde77       - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN 663100              - CUBE LEFT SIDE 
  defw &08f2 ; ORANGE ff7721             - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level7_round4:     ; COLOUR HTML RGB
  defw &0ee0 ; YELLOW dede00        - COLOUR OF UNSELECTED CUBE
  defw &056f ; PURPLE 5646ef        - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level8_round1:     ; COLOUR HTML RGB
  defw &050e ; MED BLUE 0046de            - COLOUR OF UNSELECTED CUBE 
  defw &0ef8 ; PALE YELLOW efde77     - 1st COLOUR OF CUBE  
  defw &0c23 ; BRIGHT GREEN 21b931 - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN  663100             - CUBE LEFT SIDE 
  defw &08f2 ; ORANGE ff7721             - CUBE RIGHT SIDE

 ;; 0,GREEN,RED,BLUE,
palette_level8_round2:     ; COLOUR HTML RGB
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &050f; MED BLUE 0046ef    - 1st COLOUR OF CUBE
  defw &0dd0 ; YELLOW cece00        - COLOUR OF UNSELECTED CUBE
  defw &0000 ; BLACK               - CUBE LEFT SIDE  
  defw &0000 ; BLACK                - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level8_round3:     ; COLOUR HTML RGB
  defw &0ee0 ; YELLOW dede00        - COLOUR OF UNSELECTED CUBE
  defw &056f ; PURPLE 5646ef     - 1st COLOUR OF CUBE
  defw &07f7 ; PINK ff6666          - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
  
 ;; 0,GREEN,RED,BLUE,
palette_level8_round4:     ; COLOUR HTML RGB
  defw &0cb1 ; YELLOW a9b910        - COLOUR OF UNSELECTED CUBE
  defw &070f ; PALER BLUE 0066ef     - 1st COLOUR OF CUBE
  defw &00a7 ; DARK PINK 990066           - 2nd COLOUR OF CUBE
  defw &0989 ; LIGHT GREY 778888          - CUBE LEFT SIDE
  defw &011a ; DARK BLUE  101099          - CUBE RIGHT SIDE 
  
palette_level9_round1:     ; COLOUR HTML RGB
  defw &056f ; PURPLE 5646ef        - COLOUR OF UNSELECTED CUBE
  defw &07f7 ; PINK ff6666         - 1st COLOUR OF CUBE
  defw &0ee0 ; YELLOW dede00       - 2nd COLOUR OF CUBE
  defw &0b6a ; TEAL 56a999          - CUBE LEFT SIDE
  defw &0535 ; DARK TEAL 314646     - CUBE RIGHT SIDE
  
palette_level9_round2:     ; COLOUR HTML RGB
  defw &0ef8 ; PALE YELLOW efde77   - COLOUR OF UNSELECTED CUBE
  defw &0c23 ; BRIGHT GREEN 21b931  - 1st COLOUR OF CUBE 
  defw &050e ; MED BLUE  0046de   - 2nd COLOUR OF CUBE
  defw &0370 ; BROWN    663100          - CUBE LEFT SIDE  
  defw &08f2 ; ORANGE    ff7721           - CUBE RIGHT SIDE
 
palette_level9_round3:     ; COLOUR HTML RGB
  defw &0098 ; DARK PINK 880077     - COLOUR OF UNSELECTED CUBE
  defw &030a ; DARK BLUE 003199           - 1st COLOUR OF CUBE 
  defw &092d ; PALE BLUE 2188ce     - 2nd COLOUR OF CUBE
  defw &0cc2 ; YELLOW b9b921        - CUBE LEFT SIDE  
  defw &03c3 ; RED b93131               - CUBE RIGHT SIDE
  
palette_level9_round4:     ; COLOUR HTML RGB
  defw &00a7 ; DARK PINK 990066     - COLOUR OF UNSELECTED CUBE
  defw &0cb1 ; YELLOW a9b910           - 1st COLOUR OF CUBE 
  defw &070f ; PALER BLUE 0066ef     - 2nd COLOUR OF CUBE
  defw &0989 ; LIGHT GREY  778888         - CUBE LEFT SIDE
  defw &011a ; DARK BLUE  101099          - CUBE RIGHT SIDE 
 
paletteroundtable:
  defw palette_level1_round1
  defw palette_level1_round2
  defw palette_level1_round3
  defw palette_level1_round4
  defw palette_level2_round1
  defw palette_level2_round2
  defw palette_level2_round3
  defw palette_level2_round4
  defw palette_level3_round1
  defw palette_level3_round2
  defw palette_level3_round3
  defw palette_level3_round4
  defw palette_level4_round1
  defw palette_level4_round2
  defw palette_level4_round3
  defw palette_level4_round4
  defw palette_level5_round1
  defw palette_level5_round2
  defw palette_level5_round3
  defw palette_level5_round4
  defw palette_level6_round1
  defw palette_level6_round2
  defw palette_level6_round3
  defw palette_level6_round4
  defw palette_level7_round1
  defw palette_level7_round2
  defw palette_level7_round3
  defw palette_level7_round4
  defw palette_level8_round1
  defw palette_level8_round2
  defw palette_level8_round3
  defw palette_level8_round4
  defw palette_level9_round1
  defw palette_level9_round2
  defw palette_level9_round3
  defw palette_level9_round4
  
setplayertextcolours:
  ld hl,&0fff    ; SET WHITE
  ld (&6402),hl
  ld hl,&00f0    ; SET RED
  ld (&640e),hl
  ld hl,(cycleplayerpaletteptr)
  ; COPY TO ASIC
  ; SET UP PALETTE
  ld de,&6400+16
  ld bc,16
  ldir
ret
  
; COPY ENTIRE PALETTE DEFINITION
setpaletteroundcolours:
  ld hl,palette
  ; COPY TO ASIC
  ; SET UP PALETTE
  ld de,&6400
  ld bc,32
  ldir
ret
; COPY LEVEL ROUND PALETTE DEFINITION PENS
; INPUT
; A = LEVEL + ROUND
updatepaletteroundcolours:
  rlca ; DOUBLE FOR LOOKUP
  ld b,0
  ld c,a
  ld hl,paletteroundtable
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  
  ; SET UP PALETTE FOR MODE 0 GAME SCREEN
  push hl
  ld de,palette_cubecolours
  ld bc,6
  ldir
  ld de,palette_cubecolours2
  ld bc,4
  ldir
  pop hl
  
  ; UPDATE DISK SHADED SPRITE COLOURS WITH ROUND COLOURS  
  ld bc,(palette_cubecolours2)
  ld (sprite_colours+2),bc
  ld (&6422+2),bc ; COPY TO ASIC
  ld bc,(palette_cubecolours2+2)
  ld (&6422+6),bc ; COPY TO ASIC

  ; COPY COLOURS FOR LEVEL SCREEN TO LOGO PALETTE
  ld de,palette_levellogo+2
  ld bc,2
  ldir
  inc hl
  inc hl
  inc hl
  inc hl

  inc de
  inc de
  ld bc,2
  ldir
  dec de
  dec de
  dec de
  dec de
  ld bc,2
  ldir
ret

; -GRB
sprite_colours:
  defw &0fff ; QBERT WHITE -BACKGROUND BLACK (PURPLE 31 21 77)
  defw &0a59 ; DISK TEAL 56a999
  defw &06e9;7fa ; BRIGHT PINK ef6699
  defw &0434 ; DISK DARK TEAL 314646
  defw &0076;67 ; DARK PINK 770066defw &045f ; PURPLE 5646ef
  defw &00bb;69e;00bb ; MED PINK a900a9defw &06f6 ; PINK ff6666
  defw &0000 ; QBERT BLACK
  defw &01f2 ; QBERT RED ef1021
  defw &06f0 ; QBERT ORANGE ef5600
  defw &07f0 ; QBERT BRIGHT ORANGE ff7700
  defw &0700 ; GREEN 006600
;  defw &0800 ; BRIGHT GREEN 008800 NOT AVAILABLE?
  
  ; THESE COLOURS ARE CYCLED TO CREATE ROTATION EFFECT FOR THE DISK
  sprite_colours_disk:
  defw &045f ; DISK 1 PURPLE 5646ef
  defw &0dd0 ; DISK 2 YELLOW dede00
  defw &0800 ; DISK 3 BRIGHT GREEN 008800
  defw &01f2 ; DISK 4 RED ef1021
  ; CYCLE PATTERN COLOURS
  defw &045f ; DISK 1 PURPLE 5646ef
  defw &0dd0 ; DISK 2 YELLOW dede00
  defw &0800 ; DISK 3 BRIGHT GREEN 008800

cyclediskpalette:
  ld a,0:cyclediskpalettecounter
  inc a
  inc a
  cp 8
  jr nz,skipresetdiskpalettecounter
  xor a
  skipresetdiskpalettecounter:
  ld (cyclediskpalettecounter-1),a
  
  ld de,&6422+22
  ld hl,sprite_colours_disk
  ld b,0
  ld c,a
  add hl,bc
  ld bc,8
  ldir
ret  

amsfont:
t1:
db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
; !
t2:
db %00011110,%10000111
db %00011110,%10000111
db %00011110,%10000111
db %00011110,%10000111
db %00011110,%10000111
db %00001111,%00001111
db %00011110,%10000111
db %00001111,%00001111
;db #1e,#0f,#1e,#0f,#1e,#0f,#1e,#0f
;db #1e,#0f,#0f,#0f,#1e,#0f,#0f,#0f
t3:
;db #2d,#4b,#2d,#4b,#0f,#0f,#0f,#0f
;db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
t4:
;db #2d,#4b,#2d,#4b,#78,#e1,#2d,#4b
;db #2d,#4b,#78,#e1,#2d,#4b,#2d,#4b
t5:
;db #3c,#c3,#4b,#a5,#4b,#87,#3c,#c3
;db #0f,#a5,#4b,#a5,#3c,#c3,#0f,#0f
t6:
;db #0f,#0f,#69,#2d,#69,#4b,#0f,#87
;db #1e,#0f,#2d,#69,#4b,#69,#0f,#0f
t7:
;db #3c,#87,#4b,#4b,#2d,#87,#1e,#0f
;db #2d,#a5,#4b,#4b,#3c,#a5,#0f,#0f
t8:
db #0f,#4b,#0f,#87,#1e,#0f,#0f,#0f
db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
t9
;db #0f,#4b,#0f,#87,#1e,#0f,#1e,#0f
;db #1e,#0f,#0f,#87,#0f,#4b,#0f,#0f
t10: ;")"
db %01001011,%00001111
db %00101101,%00001111
db %00111100,%00001111
db %00111100,%00001111
db %00111100,%00001111
db %00111100,%00001111
db %00101101,%00001111
db %01001011,%00001111
;db #1e,#0f,#0f,#87,#0f,#4b,#0f,#4b
;db #0f,#4b,#0f,#87,#1e,#0f,#0f,#0f
t11:
;db #0f,#0f,#4b,#2d,#2d,#4b,#1e,#87
;db #2d,#4b,#4b,#2d,#0f,#0f,#0f,#0f
t12:
;db #0f,#0f,#0f,#87,#0f,#87,#3c,#e1
;db #0f,#87,#0f,#87,#0f,#0f,#0f,#0f
t13:
;db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
;db #0f,#0f,#0f,#4b,#0f,#87,#1e,#0f
t14: ; "-"
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%00001111
db %11110000,%11110000
db %11110000,%11110000
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%00001111
;db #0f,#0f,#0f,#0f,#0f,#0f,#78,#e1
;db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
; FULL STOP
t15:
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%00001111
db %01101001,%00001111
db %01101001,%00001111
db %00001111,%00001111
;db #0f,#0f,#0f,#0f,#0f,#0f,#0f,#0f
;db #0f,#0f,#0f,#0f,#0f,#87,#0f,#0f
t16:
;db #0f,#2d,#0f,#4b,#0f,#87,#1e,#0f
;db #2d,#0f,#4b,#0f,#87,#0f,#0f,#0f
; 0
t17:
db %00001111,%00001111
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %00111100,%11000011
;db #78,#c3,#87,#69,#87,#a5,#96,#2d
;db #a5,#2d,#c3,#2d,#78,#c3,#0f,#0f
; 1
t18:
db %00001111,%00001111
db %00001111,%00001111
db %00011110,%00001111
db %00111100,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %01111000,%11000011
;db #0f,#87,#1e,#87,#2d,#87,#0f,#87
;db #0f,#87,#0f,#87,#0f,#87,#0f,#0f
; 2
t19:
db %00001111,%00001111
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %00001111,%00101101
db %00011110,%11000011
db %00101101,%00001111
db %01111000,%11100001
;db #3c,#c3,#4b,#2d,#0f,#2d,#3c,#c3
;db #4b,#0f,#4b,#0f,#78,#e1,#0f,#0f
; 3
t20:
db %00001111,%00001111
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %00001111,%11000011
db %00001111,%00101101
db %01001011,%00101101
db %00111100,%11000011
;db #3c,#c3,#4b,#2d,#0f,#2d,#1e,#c3
;db #0f,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; 4
t21:
db %00001111,%00001111
db %00001111,%00001111
db %00001111,%11000011
db %00011110,%01001011
db %00101101,%01001011
db %01111000,%11100001
db %00001111,%01001011
db %00001111,%01001011
;db #1e,#87,#2d,#87,#4b,#87,#87,#87
;db #f0,#e1,#0f,#87,#0f,#87,#0f,#0f
; 5
t22:
db %00001111,%00001111
db %00001111,%00001111
db %01111000,%11100001
db %01001011,%00001111
db %01111000,%11000011
db %00001111,%00101101
db %01001011,%00101101
db %00111100,%11000011
;db #78,#e1,#4b,#0f,#4b,#0f,#3c,#c3
;db #0f,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; 6
t23:
db %00001111,%00001111
db %00001111,%00001111
db %00011110,%11000011
db %00101101,%00001111
db %01111000,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %00111100,%11000011
;db #3c,#c3,#4b,#0f,#4b,#0f,#78,#c3
;db #4b,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; 7
t24:
db %00001111,%00001111
db %00001111,%00001111
db %01111000,%11100001
db %01001011,%00101101
db %00001111,%01001011
db %00001111,%10000111
db %00001111,%10000111
db %00001111,%10000111
;db #78,#e1,#0f,#2d,#0f,#4b,#0f,#87
;db #1e,#0f,#2d,#0f,#4b,#0f,#0f,#0f
; 8
t25:
db %00001111,%00001111
db %00001111,%00001111
db %00011110,%10000111
db %00101101,%01001011
db %00011110,%10000111
db %00101101,%01001011
db %01001011,%00101101
db %00111100,%11000011
;db #3c,#c3,#4b,#2d,#4b,#2d,#3c,#c3
;db #4b,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; 9
t26:
db %00001111,%00001111
db %00001111,%00001111
db %00011110,%11000011
db %00101101,%00101101
db %00101101,%00101101
db %00011110,%11100001
db %00001111,%00101101
db %00011111,%11000011

;db #3c,#c3,#4b,#2d,#4b,#2d,#3c,#e1
;db #0f,#2d,#0f,#2d,#3c,#c3,#0f,#0f
t27:
;db #0f,#0f,#0f,#0f,#0f,#87,#0f,#87
;db #0f,#0f,#0f,#87,#0f,#87,#0f,#0f
t28:
;db #0f,#0f,#0f,#0f,#0f,#87,#0f,#87
;db #0f,#0f,#0f,#87,#1e,#0f,#0f,#0f
t29:
;db #0f,#4b,#0f,#87,#1e,#0f,#2d,#0f
;db #1e,#0f,#0f,#87,#0f,#4b,#0f,#0f
t30:
db #0f,#0f,#0f,#0f,#78,#e1,#0f,#0f
db #0f,#0f,#78,#e1,#0f,#0f,#0f,#0f
t31:
;db #2d,#0f,#1e,#0f,#0f,#87,#0f,#4b
;db #0f,#87,#1e,#0f,#2d,#0f,#0f,#0f
t32:
;db #3c,#c3,#4b,#2d,#0f,#2d,#0f,#4b
;db #0f,#87,#0f,#0f,#0f,#87,#0f,#0f
t33:
;db #3c,#c3,#4b,#2d,#5a,#e1,#5a,#2d
;db #5a,#e1,#4b,#0f,#3c,#c3,#0f,#0f
; A
t34:
db %00001111,%00001111
db %00011110,%10000111
db %00101101,%01001011
db %01001011,%00101101
db %01111000,%11100001
db %01001011,%00101101
db %01001011,%00101101
db %00001111,%00001111
;db #1e,#87,#2d,#4b,#4b,#2d,#4b,#2d
;db #78,#e1,#4b,#2d,#4b,#2d,#0f,#0f
; B
t35:
db %00001111,%00001111
db %01111000,%11000011
db %01001011,%00101101
db %01111000,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %01111000,%11000011
db %00001111,%00001111
;db #78,#c3,#4b,#2d,#4b,#2d,#78,#c3
;db #4b,#2d,#4b,#2d,#78,#c3,#0f,#0f
; C
t36:
db %00001111,%00001111
db %00111100,%11100001
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %00111100,%11100001
db %00001111,%00001111
;db #3c,#c3,#4b,#2d,#87,#0f,#87,#0f
;db #87,#0f,#4b,#2d,#3c,#c3,#0f,#0f
; D
t37:
db %00001111,%00001111
db %01111000,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01111000,%11000011
db %00001111,%00001111
;db #78,#87,#4b,#4b,#4b,#2d,#4b,#2d
;db #4b,#2d,#4b,#4b,#78,#87,#0f,#0f
; E
t38:
db %00001111,%00001111
db %01111000,%11100001
db %01001011,%00001111
db %01111000,%10000111
db %01001011,%00001111
db %01001011,%00001111
db %01111000,%11100001
db %00001111,%00001111
;db #78,#e1,#4b,#0f,#4b,#0f,#78,#87
;db #4b,#0f,#4b,#0f,#78,#e1,#0f,#0f
; F
t39:
db %00001111,%00001111
db %01111000,%11100001
db %01001011,%00001111
db %01111000,%10000111
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %00001111,%00001111
;db #78,#e1,#4b,#0f,#4b,#0f,#78,#87
;db #4b,#0f,#4b,#0f,#4b,#0f,#0f,#0f
; G
t40:
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %01001011,%00001111
db %01001011,%11100001
db %01001011,%00101101
db %00111100,%11000011
db %00001111,%00001111
;db #1e,#c3,#2d,#2d,#4b,#0f,#4b,#0f
;db #4b,#69,#2d,#2d,#1e,#c3,#0f,#0f
; H
t41:
db %00001111,%00001111
db %01001011,%00101101
db %01001011,%00101101
db %01111000,%11100001
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %00001111,%00001111
;db #4b,#2d,#4b,#2d,#4b,#2d,#78,#e1
;db #4b,#2d,#4b,#2d,#4b,#2d,#0f,#0f
; I
t43:
db %00001111,%00001111
db %00111100,%10000111
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00111100,%10000111
db %00001111,%00001111
;db #78,#c3,#1e,#0f,#1e,#0f,#1e,#0f
;db #1e,#0f,#1e,#0f,#78,#c3,#0f,#0f
; J
t44:
db %00001111,%00001111
db %00001111,%11100001
db %00001111,%01001011
db %00001111,%01001011
db %00001111,%01001011
db %01001011,%01001011
db %00111100,%10000111
db %00001111,%00001111
;db #1e,#e1,#0f,#4b,#0f,#4b,#0f,#4b
;db #0f,#4b,#87,#4b,#78,#87,#0f,#0f
; K
t45:
db %00001111,%00001111
db %01001011,%01001011
db %01001011,%10000111
db %01111000,%00001111
db %01001011,%10000111
db %01001011,%01001011
db %01001011,%00101101
db %00001111,%00001111
;db #4b,#2d,#4b,#4b,#4b,#87,#78,#0f
;db #4b,#87,#4b,#4b,#4b,#2d,#0f,#0f
; L
t46:
db %00001111,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %01111000,%11100001
db %00001111,%00001111
;db #4b,#0f,#4b,#0f,#4b,#0f,#4b,#0f
;db #4b,#0f,#4b,#0f,#78,#e1,#0f,#0f
; M
t47:
db %00001111,%00001111
db %01001011,%00101101
db %01101001,%01101001
db %01011010,%10100101
db %01011010,%10100101
db %01001011,%00101101
db %01001011,%00101101
db %00001111,%00001111

;db #c3,#69,#a5,#a5,#96,#2d,#87,#2d
;db #87,#2d,#87,#2d,#87,#2d,#0f,#0f
; N
t48:
db %00001111,%00001111
db %01001011,%00101101
db %01101001,%00101101
db %01011010,%00101101
db %01001011,%10100101
db %01001011,%01101001
db %01001011,%00101101
db %00001111,%00001111
;db #87,#2d,#c3,#2d,#a5,#2d,#96,#2d
;db #87,#a5,#87,#69,#87,#2d,#0f,#0f
; O
t49:
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %00111100,%11000011
db %00001111,%00001111
;db #3c,#87,#4b,#4b,#87,#2d,#87,#2d
;db #87,#2d,#4b,#4b,#3c,#87,#0f,#0f
; P
t50:
db %00001111,%00001111
db %01111000,%11000011
db %01001011,%00101101
db %01111000,%11000011
db %01001011,%00001111
db %01001011,%00001111
db %01001011,%00001111
db %00001111,%00001111
;db #78,#c3,#4b,#2d,#4b,#2d,#78,#c3
;db #4b,#0f,#4b,#0f,#4b,#0f,#0f,#0f
; Q
t51:
db %00001111,%00001111
db %00111100,%11000011
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%10100101
db %01001011,%01001011
db %00111100,%10100101
db %00001111,%00001111
;db #3c,#87,#4b,#4b,#87,#2d,#87,#2d
;db #87,#a5,#4b,#4b,#3c,#a5,#0f,#0f
; R
t52:
db %00001111,%00001111
db %01111000,%11000011
db %01001011,%00101101
db %01111000,%11000011
db %01001011,%10000111
db %01001011,%01001011
db %01001011,%00101101
db %00001111,%00001111
;db #78,#c3,#4b,#2d,#4b,#2d,#78,#c3
;db #4b,#4b,#4b,#2d,#4b,#2d,#0f,#0f
; S
t53:
db %00001111,%00001111
db %00111100,%11100001
db %01001011,%00001111
db %00111100,%11000011
db %00001111,%00101101
db %00001111,%00101101
db %01111000,%11000011
db %00001111,%00001111
;db #3c,#c3,#4b,#2d,#4b,#0f,#3c,#c3
;db #0f,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; T
t54:
db %00001111,%00001111
db %01111000,%11000011
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00011110,%00001111
db %00001111,%00001111
;db #78,#c3,#1e,#0f,#1e,#0f,#1e,#0f
;db #1e,#0f,#1e,#0f,#1e,#0f,#0f,#0f
; U
t55:
db %00001111,%00001111
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %00111100,%11000011
db %00001111,%00001111
;db #4b,#2d,#4b,#2d,#4b,#2d,#4b,#2d
;db #4b,#2d,#4b,#2d,#3c,#c3,#0f,#0f
; V
t56:
db %00001111,%00001111
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %00101101,%00101101
db %00011110,%01001011
db %00001111,%10000111
db %00001111,%00001111
;db #4b,#2d,#4b,#2d,#4b,#2d,#4b,#2d
;db #4b,#2d,#2d,#4b,#1e,#87,#0f,#0f
; W
t57:
db %00001111,%00001111
db %01001011,%00101101
db %01001011,%00101101
db %01001011,%00101101
db %01011010,%10100101
db %01101001,%01101001
db %01001011,%00101101
db %00001111,%00001111

;db #87,#2d,#87,#2d,#87,#2d,#87,#2d
;db #96,#2d,#a5,#a5,#c3,#69,#0f,#0f
; X
t58:
db %00001111,%00001111
db %01001011,%00101101
db %00101101,%01001011
db %00011110,%10000111
db %00011110,%10000111
db %00101101,%01001011
db %01001011,%00101101
db %00001111,%00001111
;db #87,#2d,#4b,#4b,#2d,#87,#1e,#0f
;db #2d,#87,#4b,#4b,#87,#2d,#0f,#0f
; Y
t59:
db %00001111,%00001111
db %01001011,%00101101
db %01001011,%00101101
db %00101101,%01001011
db %00011110,%10000111
db %00011110,%10000111
db %00011110,%10000111
db %00001111,%00001111
;db #4b,#4b,#4b,#4b,#4b,#4b,#2d,#87
;db #1e,#0f,#1e,#0f,#1e,#0f,#0f,#0f
; Z
t60:
db %00001111,%00001111
db %01111000,%11100001
db %00001111,%01001011
db %00001111,%10000111
db %00011110,%00001111
db %00101101,%00001111
db %01111000,%11100001
db %00001111,%00001111

read "CPSoundEffectGenerator2.asm"

; ANIMATE CHANGE TO TEXT ARROWS
; WE RECOPY SPRITE INTO ASIC

cyclechangetotext:
  ld a,0:changetocyclecount
  inc a
  cp 3
  jr nz,skipcyclechangetotextreset
  xor a
  skipcyclechangetotextreset
  ld (changetocyclecount-1),a
  or a
  jr z,loadlogotosprites1update1
  cp 1
  jr z,loadlogotosprites1update2
  jr loadlogotosprites1update3
  
copyhalfblankrow:
  xor a
  ld b,8
  jr copyblankrowloop
copyblankrow:
  xor a
  ld b,16
  copyblankrowloop:
    ld (de),a
    inc e
  djnz copyblankrowloop
jr continueuncompresssprite

loadlogotosprites:
  ld hl,change2text
  ld de,&4200
  call copyspritetoasicuncompress
  ld de,&4300
  ld hl,change2text2
  call copyspritetoasicuncompress
  ld de,&4400
  ld hl,change2text3
  jp copyspritetoasicuncompress

loadlogotosprites1update1:
  ld hl,change2textarrows
  ld de,&4200+144
  call copyspritetoasicuncompress
  ld hl,change2text3arrows
  ld de,&4400+144
  jp copyspritetoasicuncompress
loadlogotosprites1update2:
  ld hl,change2textb
  ld de,&4200+144
  call copyspritetoasicuncompress
  ld hl,change2text3b
  ld de,&4400+144
  jp copyspritetoasicuncompress
loadlogotosprites1update3:
  ld hl,change2textc
  ld de,&4200+144
  call copyspritetoasicuncompress
  ld hl,change2text3c
  ld de,&4400+144
  ; HL = IMAGE ADDRESS
  ; DE = SPRITE ADDRESS
  copyspritetoasicuncompress:
  ld a,(hl)
  cp 255
  ret z
  cp 254 ; BLANK ROW
  jr z,copyblankrow
  cp 253 ; HALF BLANK ROW
  jr z,copyhalfblankrow
  ld (de),a
  inc e
  continueuncompresssprite:
  inc hl
  jr copyspritetoasicuncompress

; HL =  LOCATION
drawchange2text:
  ld h,53
  ld l,0
  ld a,2
  call moveplussprite2
  ld l,0+8
  ld a,3
  call moveplussprite2
  ld l,0+8+8
  ld a,4
  jp moveplussprite2

  ; 48x5
change2text:
  defb 8,8,8,8,0,8,0,0,8,0,0,8,8,0,0,8
  defb 8,0,0,0,0,8,0,0,8,0,8,0,0,8,0,8
  defb 8,0,0,0,0,8,8,8,8,0,8,8,8,8,0,8
  defb 8,0,0,0,0,8,0,0,8,0,8,0,0,8,0,8
  defb 8,8,8,8,0,8,0,0,8,0,8,0,0,8,0,8
  defb 254
  defb 254
  defb 254
  defb 254
  change2textarrows:
  defb 0,0,0,3,0,0,0,0,253
  defb 0,0,0,3,3,0,0,0,253
  defb 3,3,3,3,3,3,0,0,253
  defb 3,3,3,3,3,3,3,0,253
  defb 3,3,3,3,3,3,0,0,253
  defb 0,0,0,3,3,0,0,0,253
  defb 0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,255
change2text2:
  defb 0,0,8,0,0,8,8,8,0,8,8,8,8,0,0,0
  defb 8,0,8,0,8,0,0,0,0,8,0,0,0,0,0,0
  defb 0,8,8,0,8,0,8,8,0,8,8,8,0,0,0,0
  defb 0,0,8,0,8,0,0,8,0,8,0,0,0,0,0,0
  defb 0,0,8,0,0,8,8,0,0,8,8,8,8,0,0,0
  defb 254
  defb 254
  defb 254
  defb 254
change2textc:
change2text3c:
  defb 254
  defb 254
  defb 254
  defb 254
  defb 254
  defb 254
  defb 254,255
change2text3:
  defb 0,0,8,8,8,8,8,0,0,8,8,0,0,0,0,0
  defb 0,0,0,0,8,0,0,0,8,0,0,8,0,0,8,0
  defb 0,0,0,0,8,0,0,0,8,0,0,8,0,0,0,0
  defb 0,0,0,0,8,0,0,0,8,0,0,8,0,0,8,0
  defb 0,0,0,0,8,0,0,0,0,8,8,0,0,0,0,0
  defb 254
  defb 254
  defb 254
  defb 254
  change2text3arrows:
  defb 253,0,0,0,0,3,0,0,0
  defb 253,0,0,0,3,3,0,0,0
  defb 253,0,0,3,3,3,3,3,3
  defb 253,0,3,3,3,3,3,3,3
  defb 253,0,0,3,3,3,3,3,3
  defb 253,0,0,0,3,3,0,0,0
  defb 253,0,0,0,0,3,0,0,0,255
  
  ; 48x5
change2textb:
  defb 0,0,0,3,0,0,0,0,0,0,0,3,0,0,0,0
  defb 0,0,0,3,3,0,0,0,0,0,0,3,3,0,0,0
  defb 3,3,3,3,3,3,0,0,3,3,3,3,3,3,0,0
  defb 3,3,3,3,3,3,3,0,3,3,3,3,3,3,3,0
  defb 3,3,3,3,3,3,0,0,3,3,3,3,3,3,0,0
  defb 0,0,0,3,3,0,0,0,0,0,0,3,3,0,0,0
  defb 0,0,0,3,0,0,0,0,0,0,0,3,0,0,0,0,255
change2text3b:
  defb 0,0,0,0,3,0,0,0,0,0,0,0,3,0,0,0
  defb 0,0,0,3,3,0,0,0,0,0,0,3,3,0,0,0
  defb 0,0,3,3,3,3,3,3,0,0,3,3,3,3,3,3
  defb 0,3,3,3,3,3,3,3,0,3,3,3,3,3,3,3
  defb 0,0,3,3,3,3,3,3,0,0,3,3,3,3,3,3
  defb 0,0,0,3,3,0,0,0,0,0,0,3,3,0,0,0
  defb 0,0,0,0,3,0,0,0,0,0,0,0,3,0,0,0,255
  
setlevellogopalette:
  ld hl,palette_levellogo
  jr dosetlevelpalette
setlevellogopalette2:
  ld hl,palette_levellogo2:levelscreenpaletteflash
  dosetlevelpalette:
  ld de,&6400
  ld bc,8
  ldir
ret

levelscreenpalettestart: defw flashlevelscreenpalettetable
levelscreenpaletteptr:   defw flashlevelscreenpalettetable

; AT END OF LEVEL, FLASH CUBES BETWEEN UNSELECTED, INTERMEDIATE AND SELECTED COLOURS
cyclecubecolourpalette:
  ; CYCLE SELECTED CUBE COLOURS
  ld bc,(palette_cubecolours+4)
  ld hl,(palette_cubecolours+2)
  ld (palette_cubecolours+4),hl
  ld hl,(palette_cubecolours)
  ld (palette_cubecolours+2),hl
  ld (palette_cubecolours),bc

  ; COPY TO ASIC
  ld hl,palette_cubecolours+8
  ld de,&6400+8
  ldi 
  ldi 
  ldi 
  ldi 
  ldi 
  ldi
ret

startflashlevelscreenpalette:
  ld a,6                             ; NUMBER OF TIMES TO CYCLE
  ld hl,flashlevelscreenpalettetable ; PALETTE TABLE TO CYCLE
  docyclescreenpalette:
  ld (levelscreenpaletteflashcounter-1),a
  ld (levelscreenpalettestart),hl ; STORE COPY OF START ADDRESS FOR LOOPING FUNCTION
  ld (levelscreenpaletteptr),hl
ret

; PALETTE LIST TO FLASH FOR LEVEL SCREEN NUMBER
flashlevelscreenpalettetable:
  defw palette_levellogo2_flash
  defw palette_levellogo2
  defw 0 ; END OF PALETE CYCLE
  
flashlevelscreenpalette:
  ld a,0:levelscreenpaletteflashcounter
  or a
  ret z
  dec a
  ld (levelscreenpaletteflashcounter-1),a

  ld hl,(levelscreenpaletteptr)
  inc hl
  inc hl
  ; CHECK IF END OF PALETTE LIST REACHED, IF SO, LOOP TO START
  ld a,(hl)
  or a 
  jr nz,skipresetpalettecycle  
  ld hl,(levelscreenpalettestart)
  skipresetpalettecycle:
  ld (levelscreenpaletteptr),hl
  
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
  ld (levelscreenpaletteflash-2),hl
ret  

; 20 = INSERT 16 EMPTY PIXELS
; 21 = LINES THAT DON'T CHANGE BEWEEN FRAMES FOR SAM
image_sam_3:
  defb 21;0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,0,9,9,11,9,0,0,0,0,0,0
  defb 0,0,0,0,0,9,11,9,9,11,9,0,0,0,0,0
  defb 0,0,0,0,9,11,9,9,11,11,11,9,0,0,0,0
  defb 0,0,0,0,11,9,11,11,11,1,11,11,1,0,0,0
  defb 0,0,0,11,11,11,11,11,1,1,7,1,7,0,0,0
  defb 0,0,0,11,11,11,11,11,1,1,7,1,7,11,0,0
  defb 21;0,0,0,11,11,11,11,11,1,1,1,1,1,11,0,0
  defb 21;0,0,0,11,11,11,11,11,11,1,11,11,1,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,7,7,11,0,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  defb 21;0,0,0,0,0,11,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,11,11,11,0,11,11,11,0,0,0,0
image_sam_2:
  defb 21;0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,0,9,9,9,9,0,0,0,0,0,0
  defb 0,0,0,0,0,9,11,9,11,9,9,0,0,0,0,0
  defb 0,0,0,0,9,11,9,11,11,11,11,9,0,0,0,0
  defb 0,0,0,0,11,9,11,11,11,1,11,11,1,0,0,0
  defb 0,0,0,11,11,11,11,11,1,7,1,7,1,0,0,0
  defb 0,0,0,11,11,11,11,11,1,7,1,7,1,11,0,0
  defb 21;0,0,0,11,11,11,11,11,1,1,1,1,1,11,0,0
  defb 21;0,0,0,11,11,11,11,11,11,1,11,11,1,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,0,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  defb 21;0,0,0,0,0,11,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,11,11,11,0,11,11,11,0,0,0,0
image_sam_1:
  defb 0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,0,9,9,9,9,0,0,0,0,0,0
  defb 0,0,0,0,0,9,11,9,11,9,9,0,0,0,0,0
  defb 0,0,0,0,9,11,9,11,9,11,11,9,0,0,0,0
  defb 0,0,0,0,11,9,11,9,11,1,11,11,1,0,0,0
  defb 0,0,0,11,11,11,11,11,7,1,7,1,1,0,0,0
  defb 0,0,0,11,11,11,11,11,7,1,7,1,1,11,0,0
  defb 0,0,0,11,11,11,11,11,1,1,1,1,1,11,0,0
  defb 0,0,0,11,11,11,11,11,11,1,11,11,1,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,7,7,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,7,7,11,0,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  defb 0,0,0,0,0,11,11,0,0,0,11,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 0,0,0,0,0,11,11,11,0,11,11,11,0,0,0,0
image_sam_crouch:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,0,9,9,9,9,0,0,0,0,0,0
  defb 0,0,0,0,0,9,9,11,9,11,9,0,0,0,0,0
  defb 0,0,0,0,9,9,11,9,11,9,11,9,0,0,0,0
  defb 0,0,0,0,11,11,9,11,11,1,11,11,1,0,0,0
  defb 0,0,0,11,11,11,11,11,1,7,1,7,1,0,0,0
  defb 0,0,0,11,11,11,11,11,1,7,1,7,1,11,0,0
  defb 0,0,0,11,11,11,11,11,1,1,1,1,1,11,0,0
  defb 0,0,0,11,11,11,11,11,11,1,11,1,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,0,11,11,11,11,11,7,7,11,0,0,0
  defb 0,0,0,0,0,11,11,11,11,11,11,11,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,0,11,11,11,0,0,0

; ONLY GLASSES PIXELS ARE CHANGED FOR SLICK
image_slick_3:
  defb 21;0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 21;0,0,0,0,9,9,9,9,11,9,0,0,0,0,0,0
  defb 21;0,0,9,0,0,9,11,9,9,9,9,0,0,0,0,0
  defb 21;0,0,0,9,9,11,9,11,9,11,11,9,0,0,0,0
  defb 21;0,0,0,0,11,9,11,11,11,11,11,11,11,0,0,0
  defb 0,0,0,7,7,7,7,7,1,7,7,1,7,7,0,0
  defb 0,0,0,11,11,11,11,11,1,7,7,1,7,11,0,0
  defb 0,0,0,11,11,11,11,11,7,7,11,7,7,11,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 21;0,0,0,0,0,11,11,11,11,11,7,7,11,0,0,0
  defb 21;0,0,0,0,0,11,11,11,11,11,11,11,11,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,11,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,11,11,0,11,11,11,0,0,0

image_slick_2:
  defb 21;0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 21;0,0,0,0,9,9,9,9,11,9,0,0,0,0,0,0
  defb 21;0,0,9,0,0,9,11,9,9,9,9,0,0,0,0,0
  defb 21;0,0,0,9,9,11,9,11,9,11,11,9,0,0,0,0
  defb 21;0,0,0,0,11,9,11,11,11,11,11,11,11,0,0,0
  defb 0,0,0,7,7,7,7,7,7,7,7,7,7,7,0,0
  defb 0,0,0,11,11,11,11,11,7,1,7,7,1,11,0,0
  defb 0,0,0,11,11,11,11,11,7,1,11,7,1,11,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 21;0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 21;0,0,0,0,0,11,11,11,11,11,7,7,11,0,0,0
  defb 21;0,0,0,0,0,11,11,11,11,11,11,11,11,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,11,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 21;0,0,0,0,0,0,11,11,11,0,11,11,11,0,0,0

image_slick_1:
  defb 0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,9,9,9,11,9,0,0,0,0,0,0
  defb 0,0,9,0,0,9,11,9,9,9,9,0,0,0,0,0
  defb 0,0,0,9,9,11,9,11,9,11,11,9,0,0,0,0
  defb 0,0,0,0,11,9,11,11,11,11,11,11,11,0,0,0
  defb 0,0,0,7,7,7,7,7,7,7,7,7,7,7,0,0
  defb 0,0,0,11,11,11,11,11,1,7,7,1,7,11,0,0
  defb 0,0,0,11,11,11,11,11,1,7,11,1,7,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,0,11,11,11,11,11,7,7,11,0,0,0
  defb 0,0,0,0,0,11,11,11,11,11,11,11,11,0,0,0
  defb 0,0,0,0,0,0,11,0,0,0,11,11,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 0,0,0,0,0,0,11,0,0,0,11,0,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,0,11,11,11,0,0,0

image_slick_crouch:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,9,0,0,9,0,9,0,0,0,0,0,0,0
  defb 0,0,0,0,9,9,9,9,11,9,0,0,0,0,0,0
  defb 0,0,9,0,0,9,11,9,9,9,9,0,0,0,0,0
  defb 0,0,0,9,9,11,9,11,9,11,11,9,0,0,0,0
  defb 0,0,0,0,11,9,11,11,11,11,11,11,11,0,0,0
  defb 0,0,0,7,7,7,7,7,1,7,7,1,7,7,0,0
  defb 0,0,0,11,11,11,11,11,1,7,7,1,7,11,0,0
  defb 0,0,0,11,11,11,11,11,7,7,11,7,7,11,0,0
  defb 0,0,0,11,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,11,11,0,0
  defb 0,0,0,0,0,11,11,11,11,11,7,7,11,0,0,0
  defb 0,0,0,0,0,11,11,11,11,11,11,11,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,0,11,11,11,0,0,0


; COLOURS 14,13,12,15

;setqbertswearwordsprites:
;  ld hl,image_qbert_swearword1
;  ld de,&4600
;  ld bc,256+256+256+256+256+256
;  ldir 
;ret

image_red_underline:
  defb 0,0,0,0,8,8,8,8,8,8,8,8,0,0,0,0
  defb 0,0,0,0,8,8,8,8,8,8,8,8,0,0,0,0

image_redball:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0
  defb 0,0,0,0,8,8,8,8,8,8,8,8,0,0,0,0
  defb 0,0,0,8,8,8,1,8,8,8,8,8,8,0,0,0
  defb 0,0,8,8,8,1,8,8,8,8,8,8,8,8,0,0
  defb 0,0,8,8,8,8,8,8,8,8,8,8,8,8,0,0
  defb 0,0,8,8,8,8,8,8,8,8,8,7,8,8,0,0
  defb 0,0,8,8,8,8,8,8,8,8,7,8,8,8,0,0
  defb 0,0,0,8,8,8,8,8,7,7,8,8,8,0,0,0
  defb 0,0,0,0,8,8,8,8,8,8,8,8,0,0,0,0
  defb 0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0

image_redball_squash:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0
  defb 0,0,0,0,8,8,8,8,8,8,8,8,0,0,0,0
  defb 0,0,0,8,8,8,1,8,8,8,8,8,8,0,0,0
  defb 0,0,8,8,8,1,8,8,8,8,8,8,8,8,0,0
  defb 0,0,8,8,8,8,8,8,8,8,8,7,8,8,0,0
  defb 0,0,8,8,8,8,8,8,8,8,7,8,8,8,0,0
  defb 0,0,0,8,8,8,8,8,8,8,8,8,8,0,0,0
  defb 0,0,0,0,0,8,8,8,8,8,8,0,0,0,0,0

image_qbert_backright:
  defb 0,0,0,0,10,10,9,9,0,0,0,0,10,9,9,0
  defb 0,0,0,10,10,9,9,8,8,8,0,10,10,9,9,8
  defb 0,0,10,10,10,9,9,8,1,7,10,10,9,9,9,8
  defb 0,0,10,10,9,9,9,8,1,7,9,9,9,9,8,0
  defb 0,10,10,10,9,9,9,8,1,1,9,9,9,8,0,0
  defb 0,10,10,9,9,9,8,9,8,8,9,9,8,0,0,0
  defb 0,10,10,9,9,9,9,9,8,9,8,8,0,0,0,0
  defb 0,10,10,9,9,9,9,9,9,8,8,8,0,0,0,0
  defb 0,0,9,9,9,9,9,8,9,9,8,8,0,0,0,0
  defb 0,0,0,9,9,8,9,9,8,8,8,0,0,0,0,0
  defb 0,0,0,0,9,9,9,8,8,8,0,0,0,0,0,0
  defb 0,0,0,0,0,9,0,0,8,0,0,0,0,0,0,0
  defb 0,0,0,0,0,9,0,0,8,8,0,0,0,0,0,0
  defb 0,0,0,0,0,9,9,9,9,0,0,9,8,0,0,0
  defb 0,0,0,0,9,8,8,0,8,9,8,8,0,0,0,0
  defb 0,0,0,9,8,0,0,0,8,8,0,0,0,0,0,0
  
image_qbert_backright_clip1:
  defb 21
  defb 21
  defb 21
  defb 21
  defb 21
  defb 21
  defb 21
  defb 21
  defb 0,0,9,9,9,9,9,8,9,9,8,8,0,0,0,0
  defb 0,0,0,9,9,8,9,9,8,8,8,0,0,0,0,0
  defb 0,0,0,0,9,9,9,8,8,8,0,0,0,0,0,0
  defb 0,0,0,0,0,9,0,0,8,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,8,8,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,9,8,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_qbert_backright_clip2:
  defb 21;0,0,0,0,10,10,9,9,0,0,0,0,10,9,9,0
  defb 21;0,0,0,10,10,9,9,8,8,8,0,10,10,9,9,8
  defb 21;0,0,10,10,10,9,9,8,1,7,10,10,9,9,9,8
  defb 21;0,0,10,10,9,9,9,8,1,7,9,9,9,9,8,0
  defb 0,0,10,10,9,9,9,8,1,1,9,9,9,8,0,0
  defb 0,0,0,0,9,9,8,9,8,8,9,9,8,0,0,0
  defb 0,0,0,0,0,0,9,9,8,9,8,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,9,8,8,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_qbert_backright_clip3:
  defb 0,0,0,0,0,0,0,9,0,0,0,0,10,9,9,0
  defb 0,0,0,0,0,0,0,0,0,8,0,10,10,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,0,10,9,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,0,9,9,9,8,0
  defb 0,0,0,0,0,0,0,0,0,0,0,9,9,8,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,9,8,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,9,8,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_qbert_backright_clip4:
  defb 0,0,0,0,0,0,0,0,0,0,0,0,10,9,9,0
  defb 0,0,0,0,0,0,0,0,0,0,0,10,10,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,10,10,9,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,9,9,9,9,8,0
  defb 0,0,0,0,0,0,0,0,0,0,9,9,9,8,0,0
  defb 0,0,0,0,0,0,0,0,0,0,9,9,8,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0
image_disk:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
; END CLIP 4
  defb 0,0,0,0,0,0,14,14,13,13,0,0,0,0,0,0
  defb 0,0,0,14,14,14,14,14,14,14,13,13,13,0,0,0
  defb 0,14,14,14,14,14,14,14,14,14,13,13,13,13,13,0
  defb 14,14,14,15,15,15,15,14,13,13,13,13,13,13,13,12
  defb 14,15,15,15,15,15,15,15,12,13,13,13,13,12,12,12
  defb 2,15,15,15,15,15,12,12,12,12,12,12,12,12,12,4
  defb 2,2,2,15,15,15,12,12,12,12,12,12,12,4,4,4
  defb 0,2,2,2,2,2,15,15,12,12,4,2,4,4,4,0
  defb 0,0,0,2,2,2,2,2,4,2,4,2,4,0,0,0
  defb 0,0,0,0,0,0,2,2,4,2,0,0,0,0,0,0
  
  
image_qbert_backright_clip5:
  defb 0,0,0,0,0,0,0,0,0,0,0,0,10,9,9,0
  defb 0,0,0,0,0,0,0,0,0,0,0,10,10,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,0,10,9,9,9,8
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,9,8,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_greenball:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,11,0,0,0,0,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  defb 0,0,0,11,11,11,1,11,11,11,11,11,11,0,0,0
  defb 0,0,0,11,11,1,11,11,11,11,11,7,11,0,0,0
  defb 0,0,0,11,11,11,11,11,11,11,11,7,11,0,0,0
  defb 0,0,0,11,11,11,11,11,11,7,7,11,11,0,0,0
  defb 0,0,0,0,11,11,11,7,7,11,11,11,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,11,0,0,0,0,0,0
image_greenball_squash:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,11,11,11,11,0,0,0,0,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  defb 0,0,0,11,11,11,1,11,11,11,11,7,11,0,0,0
  defb 0,0,0,11,11,1,11,11,11,11,11,7,11,0,0,0
  defb 0,0,0,11,11,11,11,11,11,11,7,11,11,0,0,0
  defb 0,0,0,0,11,11,11,11,11,11,11,11,0,0,0,0
  
clearcoilytail:
  ; CLEAR COILY TAIL SPRITE
  ld a,b;de,&4100
  add &40
  ld d,a
  ld e,0
  jr clearasicsprite
qbert_right_clip13:
  ; CLEAR PLAYER SPRITE
  ld de,&4000
clearasicsprite:
  ld h,d
  ld l,e
  inc de
  ld (hl),0
  ld bc,255
  ldir
ret

; INPUT
; A = DIRECTION OF JUMP
coily_right_clip14:
  ld de,&4100        ; CLEAR COILY HEAD
  jr clearasicsprite
coily_right_clip13:
  push af
  call clearcoilytail
  pop af
  ld hl,image_coilysnake_backright_top_clip13
  jr doupdatespriteright_coilyhead
coily_right_clip12:
  push af ; PRESERVE DIRECTION VARIABLE
  ld hl,image_coilysnake_backright_bottom_clip12
  call doupdatespriteright_coilytail
  pop af
  ; ERASE BOTTOM CORNER OF HEAD SPRITE
  ld hl,image_coilysnake_backright_top_clip12
  jr doupdatespriteright_coilyhead
coily_right_clip11:
  push af ; PRESERVE DIRECTION VARIABLE
  ld hl,image_coilysnake_backright_bottom_clip11
  call doupdatespriteright_coilytail
  pop af
  ; ERASE BOTTOM CORNER OF HEAD SPRITE
  ld hl,image_coilysnake_backright_top_clip11
  jr doupdatespriteright_coilyhead
coily_right_clip10:
  push af ; PRESERVE DIRECTION VARIABLE
  ld hl,image_coilysnake_backright_bottom_clip10
  call doupdatespriteright_coilytail
  pop af
  ; ERASE BOTTOM CORNER OF HEAD SPRITE
  ld hl,image_coilysnake_backright_top_clip10
  jr doupdatespriteright_coilyhead
coily_right_clip9:
  ld hl,image_coilysnake_backright_bottom_clip9
  jr doupdatespriteright_coilytail
coily_right_clip8:
  ld hl,image_coilysnake_backright_bottom_clip8
  jr doupdatespriteright_coilytail
  doupdatespriteright_coilytail:
  ; SET COILY SPRITE ID
  ; A = DIRECTION
  ; B = SPRITE ID
  or a
  jr z,dodrawflipimage_fixedid_compressed
  ld a,b ; SET SPRITE ID
  jp drawnormalimage_fixedid_compressed

  dodrawflipimage_fixedid_compressed:
  ld a,b ; SET SPRITE ID
  jp drawflipimage_fixedid_compressed
  
  doupdatespriteright_coilyhead:
  ; SET COILY SPRITE ID
  ; A = DIRECTION
  ; B = SPRITE ID
  or a
  jr z,dodrawflipimage_fixedid_compressed_coilyhead
  ld a,1 ; SET SPRITE ID
  jp drawnormalimage_fixedid_compressed

  dodrawflipimage_fixedid_compressed_coilyhead:
  ld a,1 ; SET SPRITE ID
  jp drawflipimage_fixedid_compressed

; INPUT
; A = DIRECTION OF JUMP
qbert_right_clip8:
  ld hl,image_qbert_backright_clip1
  jr doupdatespriteright
qbert_right_clip12:
  ld hl,image_qbert_backright_clip5
  jr doupdatespriteright
qbert_right_clip11:
  ld hl,image_qbert_backright_clip4
  jr doupdatespriteright
qbert_right_clip10:
  ld hl,image_qbert_backright_clip3
  jr doupdatespriteright
qbert_right_clip9:
  ld hl,image_qbert_backright_clip2
  doupdatespriteright:
  or a
  jp z,drawflipimage_fixedid_compressed
  xor a ; SPRITE ID
  jp drawnormalimage_fixedid_compressed

image_qbert_backright_landed:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,10,10,9,9,0,0,0,0,10,9,9,0
  defb 0,0,0,10,10,9,9,8,8,8,0,10,10,9,9,8
  defb 0,0,10,10,10,9,9,8,1,1,10,10,9,9,9,8
  defb 0,0,10,10,9,9,9,8,1,7,9,9,9,9,8,0
  defb 0,10,10,10,9,9,9,8,1,7,9,9,9,8,0,0
  defb 0,10,10,9,9,9,8,9,8,8,9,9,8,0,0,0
  defb 0,10,10,9,9,9,9,9,8,9,8,8,0,0,0,0
  defb 0,10,10,9,9,9,9,9,9,8,8,8,0,0,0,0
  defb 0,0,9,9,9,9,9,8,9,9,8,8,0,0,0,0
  defb 0,0,0,9,9,8,9,9,8,8,8,0,0,0,0,0
  defb 0,0,0,0,9,9,9,8,8,8,0,0,0,0,0,0
  defb 0,0,0,0,0,9,8,0,8,8,8,0,0,0,0,0
  defb 0,0,0,0,9,8,8,9,8,9,0,8,8,0,0,0
  defb 0,0,0,9,8,8,0,0,8,8,8,0,0,0,0,0

image_qbert_frontright:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,9,9,9,9,0,0,0,0,0,0,0
  defb 0,0,0,9,9,9,8,8,8,8,8,0,0,0,0,0
  defb 0,0,8,8,9,8,1,1,8,1,1,0,0,0,0,0
  defb 0,0,8,9,9,8,7,7,8,7,7,0,0,0,0,0
  defb 0,8,8,8,9,8,7,7,8,7,7,10,0,0,0,0
  defb 0,8,8,9,9,9,8,8,9,9,9,9,10,10,0,0
  defb 0,8,8,8,9,9,9,9,9,9,9,9,9,9,10,0
  defb 0,8,8,9,8,9,8,9,8,9,8,8,8,9,9,10
  defb 0,0,8,8,8,8,8,9,8,8,0,8,8,7,7,9
  defb 0,0,0,8,8,8,8,8,8,0,0,0,8,7,7,8
  defb 0,0,0,0,8,0,0,0,8,0,0,0,0,8,8,0
  defb 0,0,0,0,8,0,0,0,8,0,0,0,0,0,0,0
  defb 0,0,0,0,8,0,0,0,8,0,0,0,0,0,0,0
  defb 0,0,0,9,9,9,0,0,8,9,9,0,0,0,0,0
  defb 0,0,0,0,8,9,10,10,0,0,8,9,10,0,0,0
  
image_qbert_frontright_landed:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,9,9,9,9,0,0,0,0,0,0,0
  defb 0,0,0,9,9,9,8,8,8,8,8,0,0,0,0,0
  defb 0,0,8,8,9,8,7,7,8,7,7,0,0,0,0,0
  defb 0,8,8,9,9,8,1,7,8,1,7,0,0,0,0,0
  defb 0,8,8,8,9,8,8,8,8,8,8,10,0,0,0,0
  defb 0,8,8,9,9,9,8,8,9,9,9,9,10,10,0,0
  defb 0,8,8,8,9,9,9,9,9,9,9,9,9,9,10,0
  defb 0,8,8,9,8,9,8,9,8,9,8,8,8,9,9,10
  defb 0,0,8,8,8,8,8,9,8,8,0,8,8,7,7,9
  defb 0,0,0,8,8,8,8,8,8,0,0,0,8,7,7,8
  defb 0,0,0,0,8,8,8,8,8,0,0,0,0,8,8,0
  defb 0,0,0,0,0,8,0,0,8,0,0,0,0,0,0,0
  defb 0,0,0,9,9,9,0,0,8,9,9,0,0,0,0,0
  defb 0,0,0,0,8,9,10,10,0,0,8,9,10,0,0,0
    
image_coilyegg:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,6,6,6,6,6,6,0,0,0,0,0
  defb 0,0,0,6,6,6,6,6,6,6,6,6,6,0,0,0
  defb 0,0,6,6,6,6,3,3,3,3,6,6,6,6,0,0
  defb 0,6,6,6,3,1,6,6,6,6,6,6,6,6,6,0
  defb 6,6,6,3,1,1,6,6,6,6,6,6,6,6,6,6
  defb 6,6,3,6,6,6,6,6,6,6,6,6,6,6,6,6
  defb 6,6,6,6,6,6,6,6,6,6,6,6,5,6,5,6
  defb 6,6,6,6,6,6,6,6,6,6,6,5,6,5,5,6
  defb 6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,6
  defb 0,6,6,6,6,6,6,5,5,6,5,5,5,5,6,0
  defb 0,0,6,6,6,6,6,6,6,5,5,5,5,6,0,0
  defb 0,0,0,6,6,6,5,5,5,5,5,6,6,0,0,0
  defb 0,0,0,0,0,6,6,6,6,6,6,0,0,0,0,0

image_coilyegg_squash:
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,6,6,6,6,6,6,0,0,0,0,0
  defb 0,0,0,6,6,6,6,6,6,6,6,6,6,0,0,0
  defb 0,0,6,6,6,6,3,3,3,3,6,6,6,6,0,0
  defb 0,6,6,6,3,1,6,6,6,6,6,6,6,6,6,0
  defb 6,6,6,3,1,1,6,6,6,6,6,6,6,6,6,6
  defb 6,6,3,6,6,6,6,6,6,6,6,6,6,6,6,6
  defb 6,6,6,6,6,6,6,6,6,6,6,6,5,6,5,6
  defb 0,6,6,6,6,6,6,6,6,6,6,5,6,5,5,0
  defb 0,0,6,6,6,6,6,6,6,5,5,5,5,5,0,0
  defb 0,0,0,0,6,6,6,5,5,6,5,5,0,0,0,0

image_coilysnake_frontright_landed:
  defb 0,0,0,0,0,0,3,6,3,3,0,3,3,0,0,0
  defb 0,0,0,0,0,3,6,6,3,3,3,3,3,3,0,0
  defb 0,0,0,0,3,6,6,6,6,1,7,1,7,1,0,0
  defb 0,0,0,3,6,6,6,6,6,6,1,1,1,6,0,0
  defb 0,0,3,6,6,6,5,6,6,6,6,6,6,6,6,0
  defb 0,0,3,6,6,5,7,7,6,6,6,6,6,6,6,0
  defb 0,0,3,6,6,5,5,7,7,6,6,6,6,6,0,0
  defb 0,0,0,6,6,6,5,5,5,5,1,5,5,1,0,0
  defb 0,0,3,5,6,6,6,6,6,6,6,6,5,0,0,0
  defb 0,0,3,6,5,5,6,6,6,6,6,5,5,0,0,0
  defb 0,0,3,6,6,3,5,5,5,5,5,5,5,0,0,0
  defb 0,0,0,6,6,6,3,7,7,7,5,6,5,0,0,0
  defb 0,0,3,6,6,6,3,3,3,3,6,5,0,0,0,0
  defb 0,3,6,5,6,6,6,6,6,5,5,0,0,0,0,0
  defb 0,3,6,0,0,0,5,5,5,5,0,0,0,0,0,0
  defb 0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0

image_coilysnake_backright_landed:
  defb 0,0,0,0,0,0,3,3,3,3,0,3,3,0,0,0
  defb 0,0,0,0,0,6,6,6,6,6,6,6,6,3,0,0
  defb 0,0,0,0,6,6,6,6,6,6,6,6,6,3,0,0
  defb 0,0,0,6,6,6,6,6,6,6,6,6,6,3,0,0
  defb 0,0,5,6,6,6,6,6,6,6,6,6,6,6,3,0
  defb 0,0,5,6,6,6,5,5,5,5,5,6,6,6,3,0
  defb 0,0,5,6,6,6,6,7,7,6,6,5,5,1,0,0
  defb 0,0,0,5,6,6,6,6,6,6,6,6,6,3,0,0
  defb 0,0,5,5,6,6,6,6,6,6,6,6,3,0,0,0
  defb 0,0,5,5,5,5,6,6,6,6,6,6,6,0,0,0
  defb 0,0,5,6,5,5,5,5,5,5,5,6,3,0,0,0
  defb 0,0,0,5,6,6,5,7,7,7,6,6,3,0,0,0
  defb 0,0,6,5,6,6,6,6,6,6,6,3,0,0,0,0
  defb 0,5,6,6,5,5,6,6,6,6,3,0,0,0,0,0
  defb 0,5,6,0,0,0,5,5,5,5,0,0,0,0,0,0
  defb 0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0
  
image_coilysnake_frontright_top:
  defb 0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 0,0,0,0,0,0,0,0,6,3,3,3,3,3,3,0
  defb 0,0,0,0,0,3,3,3,6,6,1,7,1,7,1,0
  defb 0,0,0,0,3,6,6,6,6,6,6,1,1,1,6,0
  defb 0,0,3,3,6,6,6,6,6,6,6,6,6,6,6,6
  defb 0,0,3,6,6,6,5,5,5,5,6,6,6,6,6,6
  defb 0,3,6,6,6,5,0,0,0,0,6,6,6,6,6,0
  defb 0,3,6,6,5,0,0,0,0,0,0,1,0,0,1,0
  defb 3,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0
  defb 3,6,6,5,0,0,0,0,3,3,3,6,0,0,0,0
  defb 3,6,6,5,0,0,3,6,6,6,6,6,6,6,0,0
  defb 0,3,6,6,6,3,6,6,6,5,5,6,6,6,6,0
  defb 0,3,6,6,6,6,5,5,5,0,0,3,6,6,6,6
  defb 0,0,3,6,6,6,6,5,0,0,0,3,6,5,6,5
  defb 0,0,5,6,6,6,6,6,3,3,3,6,5,6,5,0
  defb 0,0,3,5,5,6,6,6,6,6,6,5,6,5,0,0
image_coilysnake_frontright_bottom:
  defb 0,3,6,6,5,5,5,5,6,6,6,5,5,0,0,0
  defb 0,3,6,6,5,0,0,0,5,5,5,0,0,0,0,0
  defb 3,6,6,5,0,0,0,0,0,0,0,0,0,0,0,0
  defb 3,6,6,5,0,0,0,3,3,3,3,3,3,6,0,0
  defb 3,6,6,5,0,0,3,6,6,6,6,6,6,6,6,0
  defb 3,6,6,6,6,3,6,5,5,5,5,6,6,6,6,0
  defb 0,3,6,6,6,6,5,5,1,1,1,5,6,6,6,0
  defb 0,0,3,6,6,6,6,6,6,6,6,6,6,6,6,0
  defb 0,0,0,5,5,5,6,6,6,6,6,5,5,5,0,0
  defb 0,0,3,3,3,5,5,5,5,5,5,5,0,0,0,0
  defb 0,0,3,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,3,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,6,6,6,6,0,0,0,0,0,0,3,0,0,0
  defb 0,0,0,6,6,6,3,0,0,0,0,3,6,0,0,0
  defb 0,0,0,0,5,6,6,3,3,3,6,6,0,0,0,0
  defb 0,0,0,0,0,5,5,5,6,6,0,0,0,0,0,0
image_coilysnake_backright_top:
  defb 0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 0,0,0,0,0,3,3,3,6,6,6,6,6,6,3,0
  defb 0,0,0,0,3,6,6,6,6,6,6,6,6,6,3,0
  defb 0,0,5,5,6,6,6,6,6,6,6,6,6,6,6,3
  defb 0,0,5,6,6,6,5,5,5,5,6,6,6,6,6,3
  defb 0,5,6,6,6,5,0,0,0,0,5,5,5,6,6,0
  defb 0,5,6,6,5,0,0,0,0,0,0,1,0,0,1,0
  defb 5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 5,6,6,3,0,0,0,0,3,3,3,6,0,0,0,0
  defb 5,6,6,3,0,0,3,6,6,6,6,6,6,3,0,0
  defb 0,5,6,6,5,5,6,6,6,5,5,6,6,6,3,0
  defb 0,5,6,5,6,6,6,6,5,0,0,3,6,6,6,6
  defb 0,0,5,6,6,6,6,5,0,0,0,3,6,5,6,3
  defb 0,0,5,6,6,6,5,6,3,3,3,6,5,6,3,0
  defb 0,0,5,6,6,5,6,6,6,6,6,5,6,3,0,0
image_coilysnake_backright_bottom:
  defb 0,5,6,6,6,5,5,6,6,6,6,5,5,0,0,0
  defb 0,5,6,6,5,0,0,6,5,5,5,0,0,0,0,0
  defb 5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 5,6,6,3,0,0,0,3,3,3,3,3,3,3,0,0
  defb 5,6,6,3,0,0,6,6,6,6,6,6,6,6,3,0
  defb 5,6,6,6,5,6,6,6,5,5,5,6,6,6,3,0
  defb 0,5,6,5,6,6,6,3,0,0,0,5,6,6,3,0
  defb 0,0,5,6,6,6,6,5,6,6,6,6,6,6,3,0
  defb 0,0,0,6,6,6,6,5,5,6,6,5,5,5,0,0
  defb 0,0,5,6,6,5,5,5,5,5,5,5,0,0,0,0
  defb 0,0,5,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,5,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,5,6,6,6,0,0,0,0,0,0,3,0,0,0
  defb 0,0,0,5,6,6,3,0,0,0,0,3,6,0,0,0
  defb 0,0,0,0,5,6,6,3,3,3,6,6,0,0,0,0
  defb 0,0,0,0,0,5,5,5,6,6,0,0,0,0,0,0
image_coilysnake_backright_bottom_clip8:
  defb 21;0,5,6,6,5,0,0,0,0,0,0,0,0,0,0,0
  defb 21;0,5,6,6,5,0,0,0,0,0,0,0,0,0,0,0
  defb 21;5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 21;5,6,6,3,0,0,0,3,3,3,3,3,3,3,0,0
  defb 21;5,6,6,3,0,0,6,6,6,6,6,6,6,6,3,0
  defb 21;5,6,6,6,5,6,6,6,5,5,5,6,6,6,3,0
  defb 21;0,5,6,5,6,6,6,3,0,0,0,5,6,6,3,0
  defb 21;0,0,5,6,6,6,6,5,6,6,6,6,6,6,3,0
  defb 21;0,0,0,6,6,6,6,5,5,6,6,5,5,5,0,0
  defb 21;0,0,5,6,6,5,5,5,5,5,5,5,0,0,0,0
  defb 0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_coilysnake_backright_bottom_clip9:
  defb 21;0,5,6,6,5,0,0,0,0,0,0,0,0,0,0,0
  defb 21;0,5,6,6,5,0,0,0,0,0,0,0,0,0,0,0
  defb 21;5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 21;5,6,6,3,0,0,0,3,3,3,3,3,3,3,0,0
  defb 0,0,6,3,0,0,6,6,6,6,6,6,6,6,3,0
  defb 0,0,0,0,5,6,6,6,5,5,5,6,6,6,3,0
  defb 0,0,0,0,0,0,6,3,0,0,0,5,6,6,3,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,6,5,5,5,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 21;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_coilysnake_backright_bottom_clip10:
  defb 0,0,0,0,0,0,0,6,6,6,6,5,5,0,0,0
  defb 0,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0
  defb 20;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,5,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,5,5,5,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0
  defb 21;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_coilysnake_backright_top_clip10:
  defb 21;0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 21;0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 21;0,0,0,0,0,3,3,3,6,6,6,6,6,6,3,0
  defb 21;0,0,0,0,3,6,6,6,6,6,6,6,6,6,3,0
  defb 21;0,0,5,5,6,6,6,6,6,6,6,6,6,6,6,3
  defb 21;0,0,5,6,6,6,5,5,5,5,6,6,6,6,6,3
  defb 21;0,5,6,6,6,5,0,0,0,0,5,5,5,6,6,0
  defb 21;0,5,6,6,5,0,0,0,0,0,0,1,0,0,1,0
  defb 21;5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 21;5,6,6,3,0,0,0,0,3,3,3,6,0,0,0,0
  defb 21;5,6,6,3,0,0,3,6,6,6,6,6,6,3,0,0
  defb 21;0,5,6,6,5,5,6,6,6,5,5,6,6,6,3,0
  defb 21;0,5,6,5,6,6,6,6,5,0,0,3,6,6,6,6
  defb 21;0,0,5,6,6,6,6,5,0,0,0,3,6,5,6,3
  defb 0,0,0,6,6,6,5,6,3,3,3,6,5,6,3,0
  defb 0,0,0,0,0,5,6,6,6,6,6,5,6,3,0,0

image_coilysnake_backright_top_clip11:
  defb 21;0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 21;0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 21;0,0,0,0,0,3,3,3,6,6,6,6,6,6,3,0
  defb 21;0,0,0,0,3,6,6,6,6,6,6,6,6,6,3,0
  defb 21;0,0,5,5,6,6,6,6,6,6,6,6,6,6,6,3
  defb 21;0,0,5,6,6,6,5,5,5,5,6,6,6,6,6,3
  defb 0,0,6,6,6,5,0,0,0,0,5,5,5,6,6,0
  defb 0,0,0,0,5,0,0,0,0,0,0,1,0,0,1,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,3,3,3,6,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,6,6,6,3,0,0
  defb 0,0,0,0,0,0,0,0,0,0,5,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,6,6,6
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,5,6,3
  defb 0,0,0,0,0,0,0,0,0,0,3,6,5,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,6,5,6,3,0,0
image_coilysnake_backright_bottom_clip11:
  defb 0,0,0,0,0,0,0,0,0,0,6,5,5,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0
  defb 21;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,3,3,3,3,0,0
  defb 0,0,0,0,0,0,0,0,0,0,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,5,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,5,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,6,5,5,5,0,0
  defb 0,0,0,0,0,0,0,0,0,0,5,5,0,0,0,0
  defb 21;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 21;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,3,6,0,0,0
  defb 20;,0,0,0,0,0,0,0,0,0,6,6,0,0,0,0
  defb 21;0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
image_coilysnake_backright_top_clip12:
  defb 0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 0,0,0,0,0,0,0,0,0,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,6,6,6,6,6,6,3
  defb 0,0,0,0,0,0,0,0,0,5,6,6,6,6,6,3
  defb 0,0,0,0,0,0,0,0,0,0,5,5,5,6,6,0
  defb 0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0
  defb 20;,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,3,3,6,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,6,6,6,6,3,0,0
  defb 0,0,0,0,0,0,0,0,0,5,5,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,6,6,6
  defb 0,0,0,0,0,0,0,0,0,0,0,3,6,5,6,3
  defb 0,0,0,0,0,0,0,0,0,3,3,6,5,6,3,0
  defb 0,0,0,0,0,0,0,0,0,6,6,5,6,3,0,0
image_coilysnake_backright_bottom_clip12:
  defb 0,0,0,0,0,0,0,0,0,6,6,5,5,0,0,0
  defb 0,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0
  defb 20;5,6,6,3,0,0,6,6,6,6,6,6,6,6,3,0
  defb 20;5,6,6,6,5,6,6,6,5,5,5,6,6,6,3,0
  defb 20;0,5,6,5,6,6,6,3,0,0,0,5,6,6,3,0
  defb 20;0,0,5,6,6,6,6,5,6,6,6,6,6,6,3,0
  defb 20;0,0,0,6,6,6,6,5,5,6,6,5,5,5,0,0
  defb 20;0,0,5,6,6,5,5,5,5,5,5,5,0,0,0,0
  defb 21;0,0,5,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 21;0,0,5,6,6,6,0,0,0,0,0,0,0,0,0,0
  defb 21;0,0,5,6,6,6,0,0,0,0,0,0,3,0,0,0
  defb 21;0,0,0,5,6,6,3,0,0,0,0,3,6,0,0,0
  defb 21;0,0,0,0,5,6,6,3,3,3,6,6,0,0,0,0
  defb 21;0,0,0,0,0,5,5,5,6,6,0,0,0,0,0,0
image_coilysnake_backright_top_clip13:
  defb 0,0,0,0,0,0,0,0,0,3,3,0,3,3,0,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,3,0
  defb 0,0,0,0,0,0,0,0,6,6,6,6,6,6,6,3
  defb 0,0,0,0,0,0,0,0,5,5,6,6,6,6,6,3
  defb 0,0,0,0,0,0,0,0,0,0,5,5,5,6,6,0
  defb 0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0
  defb 21;5,6,6,3,0,0,0,0,0,0,0,0,0,0,0,0
  defb 20;5,6,6,3,0,0,0,0,3,3,3,6,0,0,0,0
  defb 20;5,6,6,3,0,0,3,6,6,6,6,6,6,3,0,0
  defb 20;0,5,6,6,5,5,6,6,6,5,5,6,6,6,3,0
  defb 20;0,5,6,5,6,6,6,6,5,0,0,3,6,6,6,6
  defb 20;0,0,5,6,6,6,6,5,0,0,0,3,6,5,6,3
  defb 20;0,0,5,6,6,6,5,6,3,3,3,6,5,6,3,0
  defb 20;0,0,5,6,6,5,6,6,6,6,6,5,6,3,0,0
  
; UGG GOES FROM RIGHT TO LEFT
; WRONGWAY GOES FROM LEFT TO RIGHT
; 256 ALIGNED SO WE CAN QUICKLY ROTATE THEM
align 256
image_ww_backright4:
  defb 0,0,0,0,0,0,0,0,6,6,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,6,6,0,6,0,0,0
  defb 6,0,6,0,0,0,0,0,0,0,6,6,0,6,0,0
  defb 3,0,6,0,0,0,0,0,0,6,6,0,0,6,0,0
  defb 0,3,6,0,0,0,0,0,6,6,0,0,0,0,6,0
  defb 0,0,3,3,0,0,0,3,6,0,0,0,6,6,0,6
  defb 0,0,0,3,6,0,0,3,6,6,0,6,6,0,0,0
  defb 0,0,0,1,6,6,1,7,1,6,6,6,0,0,0,0
  defb 0,0,7,7,6,6,6,1,7,1,6,6,6,0,0,0
  defb 0,1,1,7,1,1,6,6,1,7,6,6,6,0,0,0
  defb 0,1,1,1,7,7,1,6,7,1,6,6,0,0,0,0
  defb 3,6,6,1,1,7,1,1,6,7,6,6,0,0,0,6
  defb 3,3,3,1,1,1,1,1,6,6,6,0,3,0,6,6
  defb 3,3,3,6,1,1,1,6,6,3,6,0,0,3,6,0
  defb 0,3,3,3,3,3,3,3,3,0,3,3,0,3,0,0
  defb 0,3,0,3,3,3,0,3,0,0,0,3,3,3,0,0
image_ww_backright3:
  defb 0,0,0,0,0,0,0,0,6,6,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,6,6,0,6,0,0,0
  defb 6,0,6,0,0,0,0,0,0,0,6,6,0,6,0,0
  defb 3,0,6,0,0,0,0,0,0,6,6,0,0,6,0,0
  defb 0,3,6,0,0,0,0,0,6,6,0,0,0,0,6,0
  defb 0,0,3,3,0,0,0,3,6,0,0,0,6,6,0,6
  defb 0,0,0,3,6,0,0,3,6,6,0,6,6,0,0,0
  defb 0,0,0,1,6,6,1,7,7,1,6,6,0,0,0,0
  defb 0,0,1,1,6,6,6,1,7,7,1,6,6,0,0,0
  defb 0,1,7,7,1,1,6,6,1,7,7,6,6,0,0,0
  defb 0,1,1,7,1,1,1,6,7,7,1,6,0,0,0,0
  defb 3,6,6,1,7,7,1,1,6,7,6,6,0,0,0,6
  defb 3,3,3,1,1,7,1,1,6,6,6,0,3,0,6,6
  defb 3,3,3,6,1,1,1,6,6,3,6,0,0,3,6,0
  defb 0,3,3,3,3,3,3,3,3,0,3,3,0,3,0,0
  defb 0,3,0,3,3,3,0,3,0,0,0,3,3,3,0,0
image_ww_backright2:
  defb 0,0,0,0,0,0,0,0,6,6,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,6,6,0,6,0,0,0
  defb 0,6,0,6,0,0,0,0,0,0,6,6,0,6,0,0
  defb 0,3,0,6,0,0,0,0,0,6,6,0,0,6,0,0
  defb 0,0,3,3,0,0,0,0,6,6,0,0,0,0,6,0
  defb 0,0,0,3,3,0,0,3,6,0,0,0,6,6,0,6
  defb 0,0,0,0,3,6,0,3,6,0,0,6,6,0,0,0
  defb 0,0,0,1,6,6,1,6,6,6,6,6,0,0,0,0
  defb 0,0,1,1,6,6,6,1,6,6,6,6,6,0,0,0
  defb 0,1,7,7,1,1,6,6,1,6,6,6,6,0,0,0
  defb 0,1,1,7,1,1,1,6,6,1,6,6,0,0,0,0
  defb 3,6,6,7,7,1,1,1,6,6,6,6,0,3,0,6
  defb 3,3,3,1,7,1,1,1,6,6,6,0,0,3,6,6
  defb 3,3,3,6,1,1,1,6,6,3,6,0,0,0,3,6
  defb 0,3,3,3,3,3,3,3,3,0,3,3,0,3,3,0
  defb 0,3,0,3,3,3,0,3,0,0,0,3,3,3,3,0
image_ww_backright:
  defb 0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0
  defb 0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0
  defb 0,0,0,0,6,0,0,0,0,6,0,6,0,0,0,0
  defb 0,0,6,0,6,0,0,6,6,6,6,0,6,0,0,0
  defb 0,0,3,3,3,0,0,0,6,0,0,0,0,6,0,0
  defb 0,0,0,0,3,0,0,0,6,0,6,6,6,6,6,0
  defb 0,0,0,0,3,0,0,6,6,6,6,6,0,0,0,0
  defb 0,0,0,1,6,6,1,7,1,6,6,6,0,0,0,0
  defb 0,0,7,7,6,6,6,1,7,1,6,6,6,0,0,0
  defb 0,1,1,7,1,1,6,6,1,7,6,6,6,0,0,0
  defb 0,1,1,1,7,7,1,6,7,1,6,6,0,0,0,0
  defb 3,6,6,1,1,7,1,1,6,7,6,6,0,0,6,0
  defb 3,3,3,1,1,1,1,1,6,6,6,0,3,0,6,0
  defb 3,3,3,6,1,1,1,6,6,3,6,0,0,3,6,0
  defb 0,3,3,3,3,3,3,3,3,0,3,6,0,3,0,0
  defb 0,3,0,3,3,3,0,3,0,0,0,3,3,0,0,0
image_ugg_backright:
  defb 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
  defb 0,0,0,0,1,0,6,0,0,0,0,0,0,0,0,0
  defb 0,0,1,0,0,3,6,0,0,0,0,0,0,0,0,0
  defb 0,0,0,6,0,3,6,6,0,3,3,0,0,6,6,0
  defb 0,0,0,6,0,3,0,6,3,3,6,0,0,6,6,0
  defb 0,0,3,6,0,0,3,6,6,3,6,6,0,6,7,6
  defb 0,0,3,6,6,3,3,6,3,6,1,0,6,6,6,6
  defb 0,0,3,0,6,6,6,3,6,1,7,7,6,6,6,0
  defb 0,0,0,0,6,6,6,6,1,7,7,1,6,0,0,0
  defb 0,0,3,3,6,6,6,6,6,1,6,6,6,6,0,0
  defb 0,6,6,6,6,6,6,6,6,6,6,1,7,6,0,0
  defb 6,0,6,6,6,6,6,6,6,3,1,1,6,0,0,0
  defb 6,0,0,6,6,6,6,6,6,3,1,3,3,6,0,0
  defb 0,6,0,0,6,6,6,6,6,3,3,3,0,6,6,6
  defb 0,0,6,0,0,6,0,6,6,6,6,6,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,6,6,0,0
image_ugg_backright2:
  defb 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,1,0,6,0,0,0,0,0,0,0,0,0,0
  defb 0,1,0,0,3,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,6,0,3,6,6,6,0,3,3,0,0,6,6,0
  defb 1,0,6,0,3,0,0,6,3,3,6,0,0,6,6,0
  defb 0,3,6,0,0,0,3,6,6,6,6,6,0,6,7,6
  defb 0,3,6,6,6,3,3,6,6,3,6,0,6,6,6,0
  defb 0,3,0,0,6,6,6,6,3,6,7,6,6,6,0,0
  defb 0,0,0,0,6,6,6,3,6,7,6,6,6,0,0,0
  defb 0,0,3,3,6,6,6,6,6,6,6,6,6,6,0,0
  defb 0,6,6,6,6,6,6,6,6,6,6,1,1,6,0,0
  defb 6,0,6,6,6,6,6,6,6,3,1,1,6,0,0,0
  defb 6,0,0,6,6,6,6,6,6,3,7,3,3,6,0,0
  defb 0,6,0,0,6,6,6,6,6,3,3,3,0,6,6,6
  defb 0,0,6,0,0,6,0,6,6,6,6,6,0,0,0,0
  defb 0,0,0,0,0,0,0,0,0,0,0,6,6,6,0,0
image_ugg_backright3:
  defb 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,1,0,6,0,0,0,0,0,0,0,0,0,0
  defb 0,1,0,0,3,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,6,0,3,6,6,6,0,3,3,0,0,6,6,0
  defb 1,0,6,0,3,0,0,6,3,3,6,0,0,6,6,0
  defb 0,3,6,0,0,0,3,6,6,3,6,6,0,6,7,6
  defb 0,3,6,6,6,3,3,6,3,6,1,0,6,6,6,6
  defb 0,3,0,0,6,6,6,3,6,1,7,1,6,6,0,0
  defb 0,0,0,0,6,6,6,6,1,7,1,6,6,0,0,0
  defb 0,6,3,3,6,6,6,6,7,1,6,6,6,6,0,0
  defb 6,0,6,6,6,6,6,6,6,6,6,1,1,6,0,0
  defb 6,0,6,6,6,6,6,6,6,3,1,7,6,0,0,0
  defb 0,6,0,6,6,6,6,6,6,3,1,3,3,6,0,0
  defb 0,6,0,0,6,6,6,6,6,3,3,3,0,6,6,6
  defb 0,0,6,0,0,6,0,6,6,6,6,6,0,0,0,0
  defb 0,0,0,6,0,0,0,0,0,0,0,6,6,6,0,0
image_ugg_backright4:
  defb 0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
  defb 0,0,0,1,0,6,0,0,0,0,0,0,0,0,0,0
  defb 0,1,0,0,3,6,0,0,0,0,0,0,0,0,0,0
  defb 0,0,6,0,3,6,6,6,0,3,3,0,0,6,6,0
  defb 1,0,6,0,3,0,0,6,3,3,6,0,0,6,6,0
  defb 0,3,6,0,0,0,3,6,6,3,6,6,0,6,7,6
  defb 0,3,6,6,6,3,3,6,3,6,1,0,6,6,6,6
  defb 0,3,0,0,6,6,6,3,6,1,7,7,6,6,0,0
  defb 0,0,0,0,6,6,6,6,1,7,7,6,6,0,0,0
  defb 0,6,3,3,6,6,6,6,7,1,6,6,6,6,0,0
  defb 6,0,6,6,6,6,6,6,6,6,6,1,7,6,0,0
  defb 6,0,6,6,6,6,6,6,6,3,1,1,6,0,0,0
  defb 0,6,0,6,6,6,6,6,6,3,1,3,3,6,0,0
  defb 0,6,0,0,6,6,6,6,6,3,3,3,0,6,6,6
  defb 0,0,6,0,0,6,0,6,6,6,6,6,0,0,0,0
  defb 0,0,0,6,0,0,0,0,0,0,0,6,6,6,0,0

dodrawnormalimage2_compressed:
  push af;ld (spriteid2-1),a
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
; INPUT
; IX = SPRITE DATA LOCATION
; A = IMAGE NUMBER IN TABLE TO UPDATE PLAYER PLUS SPRITE WITH
drawnormalimage_compressed:
  ; UPDATE ASIC IMAGE
  ;ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE

  pop af;ld a,0:spriteid2
  drawnormalimage_fixedid_compressed:
  add &40
  ld d,a
  ld e,&00

; EACH ROW CAN START WITH CONTROL BYTE
; 20 = REPLACED BY 16 EMPTY PIXELS
; 21 = IGNORE ROW UPDATING SPRITE (ROW KEPT SAME AS CURRENT ASIC) 

  ld b,16
  drawnormalimage_compressed_looped:
    ld a,(hl)
	cp 20  ; ROW OF EMPTY PIXELS
	jr z,insert16emptypixels
	cp 21  ; IGNORE ROW ( KEEP PIXELS SAME IN ASIC )
	jr z,ignorerow
	
	; COPY ROW AS NORMAL
	push bc
	ld b,4
	insert16emptypixelsloop:
	   ld a,(hl)
	   ld (de),a
       inc hl
	   inc e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   inc e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   inc e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   inc e
	djnz insert16emptypixelsloop
	jr continuedrawnormalimage_compressed_looped
	
	; INSERT 16 EMPTY PIXELS
	insert16emptypixels:
	  inc hl
	
	  xor a
	  push bc
	  ld b,4
	  insert16emptypixelsloop2:
	     ld (de),a
         inc e
	     ld (de),a
         inc e
	     ld (de),a
         inc e
	     ld (de),a
         inc e
	  djnz insert16emptypixelsloop2
	  jr continuedrawnormalimage_compressed_looped
	
	; IGNORE ROW
	ignorerow:
	  inc hl
	  
	  push bc
	  
	  ld a,e
	  add 16
	  ld e,a
	  
    continuedrawnormalimage_compressed_looped:
	pop bc 
  djnz drawnormalimage_compressed_looped
ret

dodrawflippedimage2_compressed:
  push af;ld (spriteid-1),a
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a
; INPUT
; IX = SPRITE DATA LOCATION
; A = IMAGE NUMBER IN TABLE TO UPDATE PLAYER PLUS SPRITE WITH
drawflippedimage_compressed:
  ; UPDATE ASIC IMAGE
  ;ld a,(ix+ix_spriteid) ; NUMBER OF SPRITE TO UPDATE
  
  pop af
  drawflipimage_fixedid_compressed:
;  ld a,0:spriteid
  add &40
  ld d,a
  ld e,&0f

; EACH ROW CAN START WITH CONTROL BYTE
; 20 = REPLACED BY 16 EMPTY PIXELS
; 21 = IGNORE ROW UPDATING SPRITE (ROW KEPT SAME AS CURRENT ASIC) 

  ld b,16
  drawflippedimage_compressed_looped:
    ld a,(hl)
	cp 20  ; ROW OF EMPTY PIXELS
	jr z,insert16emptypixels3
	cp 21  ; IGNORE ROW ( KEEP PIXELS SAME IN ASIC )
	jr z,ignorerow4
	
	; COPY ROW AS NORMAL
	push bc
	ld b,4
	insert16emptypixelsloop3:
	   ld a,(hl)
	   ld (de),a
       inc hl
	   dec e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   dec e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   dec e
	   
	   ld a,(hl)
	   ld (de),a
       inc hl
	   dec e
	djnz insert16emptypixelsloop3
	jr movenextrowworkingbackwards
	
	; INSERT 16 EMPTY PIXELS
	insert16emptypixels3:
	  inc hl
	
	  xor a
	  push bc
	  ld b,4
	  insert16emptypixelsloop2a:
	     ld (de),a
         dec e
	     ld (de),a
         dec e
	     ld (de),a
         dec e
	     ld (de),a
         dec e
	  djnz insert16emptypixelsloop2a
	  jr movenextrowworkingbackwards
	
	; IGNORE ROW - KEEP SAME AS EXISTING ASIC
	ignorerow4:
	  inc hl
	  
	  push bc
	  
	  ld a,e
	  add 16
	  ld e,a
	  
	  jr continuedrawflippedimage_compressed_looped
	  
	  movenextrowworkingbackwards:
	  ld a,e
	  add 32
	  ld e,a
	  
    continuedrawflippedimage_compressed_looped:
	pop bc 
  djnz drawflippedimage_compressed_looped
ret



; FOR UGG AND WRONGWAY, WE NEED TO FLIP THE SPRITE VERTICALLY
; AND ALSO ROTATE 90 DEGREES CLOCKWISE.

image_cube0:
; TOP OF QUBE
        DB      #00, #00, #00, 1, 3, #00, #00, #00
        DB      #00, #00, #00, 2, 2, #00, #00, #00
        DB      #00, #00, 1, 2, 2, 3, #00, #00
        DB      #00, #00, 2, 2, 2, 2, #00, #00
        DB      #00, 1, 2, 2, 2, 2, 3, #00
        DB      #00, 2, 2, 2, 2, 2, 2, #00
        DB      1, 2, 2, 2, 2, 2, 2, 3	
        DB      2, 2, 2, 2, 2, 2, 2, 2
        DB      4, 2, 2, 2, 2, 2, 2, 5
        DB      #3f, 2, 2, 2, 2, 2, 2, #ff
        DB      #3f, 4, 2, 2, 2, 2, 5, #ff
        DB      #3f, #3f, 2, 2, 2, 2, #ff, #ff
        DB      #3f, #3f, 4, 2, 2, 5, #ff, #ff
        DB      #3f, #3f, #3f, 2, 2, #ff, #ff, #ff	
        DB      #3f, #3f, #3f, 4, 5, #ff, #ff, #ff
; SIDES OF QUBE
        DB      #3f, #3f, #3f, #3f, #ff, #ff, #ff, #ff
; BOTTOM OF QUBE
        DB      #15, #3f, #3f, #3f, #ff, #ff, #ff, #aa
        DB      #00, #3f, #3f, #3f, #ff, #ff, #ff, #00
        DB      #00, #15, #3f, #3f, #ff, #ff, #aa, #00
        DB      #00, #00, #3f, #3f, #ff, #ff, #00, #00
        DB      #00, #00, #15, #3f, #ff, #aa, #00, #00
        DB      #00, #00, #00, #3f, #ff, #00, #00, #00
        DB      #00, #00, #00, #15, #aa, #00, #00, #00

; BYTES OF EACH PEN TO USE TO COLOUR PIXELS ON TOP OF CUBES
; TOP LEFT ANGLE, MIDDLE, TOP RIGHT ANGLE, BOTTOM LEFT ANGLE, BOTTOM RIGHT ANGLE
qubecolourswitchtable:
  defb #10,#30,#20,#3a,#75 ; 0 - UNSELECTED PURPLE
  defb #50,#f0,#a0,#7a,#f5 ; 1 - PEN 6      YELLOW
  defb #14,#3c,#28,#3e,#7d ; 2 - PEN 7      PINK
  


; NEED TO REDO COLOUR TABLE
  ;defb #10, #30, #20, #90, #64  ; SELECTED - PEN 4
  

  
  ;defb #04, #0C, #08, #84, #4C  ; STANDARD - PEN 2

  ;defb #50, #F0, #A0, #D0, #E4  ; SELECTED - PEN 5
  ;defb #14, #3C, #28, #94, #6C  ; SELECTED - PEN 6
  ;defb #54, #FC, #A8, #D4, #EC  ; SELECTED - PEN 7
  ;defb #01, #03, #02, #81, #46  ; SELECTED - PEN 8
  ;defb #41, #C3, #82, #C1, #C6  ; SELECTED - PEN 9
  ;defb #05, #0F, #0A, #85, #4E  ; SELECTED - PEN 10
  ;defb #45, #CF, #8A, #C5, #CE  ; SELECTED - PEN 11
  ;defb #11, #33, #22, #91, #66  ; SELECTED - PEN 12
  ;defb #51, #F3, #A2, #D1, #E6  ; SELECTED - PEN 13
  ;defb #15, #3F, #2A, #95, #6E  ; SELECTED - PEN 14
  ;defb #55, #FF, #AA, #D5, #EE  ; SELECTED - PEN 15
  

; INPUT
; A = COLOUR OF CUBE IN TABLE TO DRAW
setcolourcube:
  push hl
  ld hl,qubecolourswitchtable
  ld b,0
  ld c,a
  add hl,bc
  add hl,bc
  add hl,bc
  add hl,bc
  add hl,bc
  ld a,(hl)
  ld (topleftboxshade-1),a
  inc hl
  ld a,(hl)
  ld (centreboxshade-1),a
  inc hl
  ld a,(hl)
  ld (toprightboxshade-1),a
  inc hl
  ld a,(hl)
  ld (bottomleftboxshade-1),a
  inc hl
  ld a,(hl)
  ld (bottomrightboxshade-1),a
  pop hl
ret


; INPUT
; A = BLOCK COLOUR
; C = BLOCK ID TO COLOUR
setblockcolour_levelscreen:
  ; GET LOCATION OF CUBE TO DRAW
  ld hl,qubelocationtable_levelscreen
  jr dosetblockcolour
setblockcolour:
  ld hl,qubelocationtable
  dosetblockcolour:

  ; SET COLOUR OF CUBE TO DRAW
  push bc
  call setcolourcube
  pop bc

  ;ld c,6
  dec c ; LOCATION TABLE STARTS AT 0, NOT 1

  ; GET LOCATION OF CUBE TO DRAW
  ld b,0
  add hl,bc
  add hl,bc
  ld a,(hl)
  inc hl
  ld h,(hl)
  ld l,a

  ; DRAW CUBE  
  jp drawtopofqube

drawlevelscreenpyramid:
  xor a;ld a,1 ; EMPTY COLOUR
  call setcolourcube
  
  ld hl,(qubelocationtable_levelscreen)
  call drawqube
  ld hl,(qubelocationtable_levelscreen+2)
  call drawqube
  ld hl,(qubelocationtable_levelscreen+4)
  call drawqube
  ld hl,(qubelocationtable_levelscreen+8)
  jp drawqube

; INPUT
; DE = Grid Properties table
drawpyramid: 
  ld hl,qubelocationtable
  ld b,28
  dodrawpyramid:
	push bc
    push hl

    ; READ COLOUR OF CUBE FROM GRID PROPERTIES TABLE
	; THIS ALLOWS US TO RESTORE TWO PLAYER GRID
	inc de
	ld a,(de)
	call setcolourcube	

    ; GET CUBE LOCATION IN HL
    ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	
	push de
	call drawqube
	pop de
	
	pop hl
	inc hl
	inc hl
	pop bc
  djnz dodrawpyramid
ret

drawtopofqube:
  ld de,image_cube0
  ld b,15 ; 24 PIXELS HIGH
  drawpixelrowloop2c:
    push bc
	
	push hl
    ld b,&FF         ; MASK TABLE OFFSET
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	pop hl
	
	call scr_next_line_hl_ptr
	
	pop bc
  djnz drawpixelrowloop2c
ret

; INPUT
; HL = SCREEN POS
drawqube:
  call drawtopofqube

  ld b,9 ; 24 PIXELS HIGH
  drawpixelrowloop2a:
    push bc
	
	push hl
	push de
	ex de,hl
	ld bc,8
	ldir
	pop de
    pop hl
	
	call scr_next_line_hl_ptr
	
	pop bc
  djnz drawpixelrowloop2a
  
  ; MOVE ON FROM LAST LINE PRINTED FOR SIDES
  ex de,hl
  ld bc,8
  add hl,bc
  ex de,hl
  
  ld b,7 ; 24 PIXELS HIGH
  drawpixelrowloop2b:
    push bc
	
	push hl
    ld b,&FE         ; MASK TABLE OFFSET
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	call maketransparent
	pop hl
	
	call scr_next_line_hl_ptr
	
	pop bc
  djnz drawpixelrowloop2b
ret

; INPUT
; A = CUBE COLOUR
drawminiqube:
  call setcolourcube

  call loadlogotosprites

  call drawchange2text

  ld hl,&8000+64+64+64+64+64+64+64+4+&0800+&0800+&0800+&0800;&98F0+4;+80

  ld de,image_cube0
  ld b,12 ; 24 PIXELS HIGH
  drawpixelrowloop2aaa:
    push bc
	
	push hl
	ld b,&FE        ; MASK TABLE OFFSET
	inc de
	call maketransparent
	inc de
	call maketransparent
	;inc de
	call maketransparent
	inc de
	call maketransparent
    inc de
	pop hl
	
	call scr_next_line_hl_ptr
	
	; SKIP A LINE
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	inc de
	
	pop bc
  djnz drawpixelrowloop2aaa
ret

substitute1col:  ; LEFT PIXEL REMAINS SAME
  ld a,#10:topleftboxshade;01010101
  jr continuetransp
substitute2col:  
  ld a,#30:centreboxshade;11111111
  jr continuetransp
substitute3col:  ; RIGHT PIXEL REMAINS SAME
  ld a,#20:toprightboxshade;10101010
  jr continuetransp
substitute4col:  ; LEFT PIXEL REMAINS SAME
  ld a,#3a:bottomleftboxshade;01010101
  jr continuetransp
substitute5col:  ; RIGHT PIXEL REMAINS SAME
  ld a,#75:bottomrightboxshade;10101010
  jr continuetransp
  
maketransparent:
  ; MAKE TRANSPARENT
  ld a,(de)
  or a ; EMPTY PIXEL JUST SKIP
  jr z,skipemptypixel2
  
  dec a;cp #10;04  ; 01000100
  jr z,substitute1col
  dec a;cp #30;0C  ; 11001100
  jr z,substitute2col
  dec a;cp #20;08  ; 10001000
  jr z,substitute3col
  dec a;cp #3a;2e;5d;84  ; 01001100
  jr z,substitute4col
  dec a;cp #75;5d;2e;4C  ; 11001000
  jr z,substitute5col
  add 5
  
  continuetransp:
  ;ld b,&F9         ; MASK TABLE OFFSET
  ld c,a           ;; C = byte of sprite pixel data/look-up table value
                     ;; BC = address (in look-up table) of mask corresponding to this sprite pixel data
  ld a,(bc)        ;; lookup mask from table
  and (hl)         ;; mask pixels on screen (remove pixels which will be replaced)
  or c             ;; combine with sprite pixel data
  ld (hl),a
    
  skipemptypixel2:
  inc de
  inc l
ret


; ABOUT f300

;ifdef ISCART
;screenptrtable equ &EF00

defb "CHRIS6"

endofdataqbert3:
