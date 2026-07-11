# CREATE BLANK DSK WITH LOADER AND SCREEN ALREADY ON
rm build/QBert.dsk -f
rm build/QBert.dsk.zip -f
cp build/QBert_Blank.dsk build/QBert.dsk 

# BUILD BINARIES

./rasm.exe -DQBERT=1 -amper ../qbert21.asm

# MAKE ARCHIVE

zip -j build/QBert.dsk.zip build/QBert.dsk
