# BUILD BINARIES
#./rasm.exe -DISCASSETTE=1 -amper ../loader6.asm LOADERC        # CAS LOADER
./rasm.exe -DISCASSETTE=1 -amper ../loader6.asm LOADERC        # CAS LOADER
./rasm.exe -amper ../loader_scr_mode1.asm LOADSCR          # LOADING SCREEN
./rasm.exe -DQBERT=1 -DISCASSETTE=1 -amper ../qbert21.asm #QBERT1
#./rasm.exe -DQBERT=1 -DISCASSETTE=1 -amper ../AMSTRADFONT9.asm QBERT2
#./rasm.exe -DQBERT=1 -DISCASSETTE=1 -amper ../spritegraphics.asm QBERT3

# TURBO
# -----

rm build/QBert.cdt -f

# create new CDT and put binary loader

./2cdt -L 2304 -X 2432 -n -r qbert.bin ./LOADERC.bin build/QBert.cdt # 2CDT NOT RECOGNIZING HEADER SO WE PUT 2304 = HEX 0900 START ADDRESS

# add screen to existing CDT data

./2cdt -r loadscr.bin ./LOADSCR.bin build/QBert.cdt

# add code to existing CDT data

./2cdt -r qbert1.bin ./QBERT1.BIN build/QBert.cdt
./2cdt -r qbert2.bin ./QBERT2.BIN build/QBert.cdt
./2cdt -r qbert3.bin ./QBERT3.BIN build/QBert.cdt

# NORMAL BAUD - NEEDED FOR REAL HARDWARE
# --------------------------------------

# create new CDT and put binary loader

rm build/QBertN.cdt -f

./2cdt -L 2304 -X 2432 -t 0 -s 0 -n -r qbert.bin ./LOADERC.bin build/QBertN.cdt

# add screen to existing CDT data

./2cdt -t 0 -s 0 -r loadscr.bin ./LOADSCR.bin build/QBertN.cdt

# add code to existing CDT data

./2cdt -t 0 -s 0 -r qbert1.BIN ./QBERT1.bin build/QBertN.cdt
./2cdt -t 0 -s 0 -r qbert2.BIN ./QBERT2.bin build/QBertN.cdt
./2cdt -t 0 -s 0 -r qbert3.BIN ./QBERT3.bin build/QBertN.cdt

# ZIP ARCHIVE

rm build/QBert.cdt.zip -f
rm build/QBertN.cdt.zip -f
zip -j build/QBert.cdt.zip build/QBert.cdt
zip -j build/QBertN.cdt.zip build/QBertN.cdt
