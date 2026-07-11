# BUILD BINARIES

./rasm.exe -DISCART=1 -amper ../qbert21.asm QBERT1
./rasm.exe -DISCART=1 -DQBERT=1 -amper ../AMSTRADFONT9.asm QBERT2
./rasm.exe -DISCART=1 -DQBERT=1 -amper ../spritegraphics.asm QBERT3
./rasm.exe -DISCART=1 -DQBERT=1 -amper ../speakerromsource3.asm QBERT4
./rasm.exe -amper ../loader_scr.asm LOADSCR            # LOADING SCREEN

rm ./boot.bin -f
rm ./QBertROM.bin -f

# CREATE ROM FILE

./rasm.exe -amper ../boot2.asm boot
./rominject -p 0 -o 0 boot.bin ./QBertROM.bin
./rominject -p 1 -o 0 LOADSCR.bin ./QBertROM.bin
./rominject -p 2 -o 0 QBERT1.bin ./QBertROM.bin #0100-3FFF CODE
./rominject -p 3 -o 0 QBERT2.bin ./QBertROM.bin #C100-FF00 CODE
./rominject -p 4 -o 0 QBERT3.bin ./QBertROM.bin #4000-7FFF CODE (WHEN ASIC DISABLED)
./rominject -p 5 -o 0 QBERT4.bin ./QBertROM.bin #C000-FFFF SPEAKER ROM CODE

rm ./build/QBert.cpr -f
rm ./build/QBert.cpr.zip -f
./buildcpr ./QBertROM.bin ./build/QBert.cpr

# MAKE ARCHIVE

zip -j ./build/QBert.cpr.zip ./build/QBert.cpr
zip -j ./build/QBertROM.zip ./QBertROM.bin