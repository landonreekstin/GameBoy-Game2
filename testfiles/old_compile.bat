:: compile to ./test_builds/rom
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -debug -c -o test_builds\buildfiles\main.o .\src\main.c
c:\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -debug -o test_builds\rom\game.gb test_builds\buildfiles\main.o

:: copy game.gb to ./test_builds/releases with version number incremnted from last release
:: REM Path: testfiles\old_copy.bat
:: copy to ./test_builds/releases
copy /b test_builds\rom\game.gb +,, test_builds\releases\game_1.0.0.gb
