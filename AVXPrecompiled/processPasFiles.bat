rem ##########################################
rem #### Process the precompiled object files

mkdir oFiles

echo Copy all object files

copy ..\Test\lib\i386-win32\AVX*.o .\oFiles\
copy ..\Test\lib\x86_64-win64\AVX*x64.o .\oFiles\


echo 
echo Convert to asm files

cd oFiles
for %%i in (dir *.o) do ..\objconv.exe -fasm %%i
cd ..
	
echo Process pas files
AvxPortToDelphi.exe

echo fin