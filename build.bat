@echo off
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1vt.gen, sonic1.sym, sonic1.lst
convsym sonic1.sym sonic1.symcmp
copy /B s1vt.gen+sonic1.symcmp s1vt.gen /Y
del sonic1.symcmp
pause