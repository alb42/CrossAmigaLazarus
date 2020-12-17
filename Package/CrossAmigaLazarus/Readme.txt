Lazarus docker for cross Amiga compilation
------------------------------------------

What you need:
- a x86_64-Linux computer with installed docker (tested with ubuntu)
- vnc client for your desktop (Linux/Windows/Amiga)

How to use:
- Create a new directory on your linux box
- copy these files into it
- start the docker: (needs root access, via sudo)
    ./CrossAmigaLazarusDocker.sh
- you get the shell inside the docker looks like:
    root@6521be2a3f16:/sources#
- now start the vnc server (you can edit it before to change the resolution default 720p)
    ./startvnc
- it will ask for a password you need to connect (must input twice)
- we do not need a view only password, so answer the next question with no (press "n")
- open your vncclient and connect to your linuxbox port 5901
- usually you get an empty black screen with a taskbar on the lower border
- right click to open the application choose "Development -> IDE -> Lazarus" to start Lazarus

- Create a new Application (LCL GUI program) or Simple program (console or Amiga GUI/MUI/MUIClass program)
- Compilation modes for 
    AROS i386  (ABIv0)
    Amiga 68k  (AmigaOS 3.x, 68020, NoFPU)
    MorphOS    (PowerPC MorphOS 3.x)
  are preinstalled, choose them to compile for one special target, or 'Compile many Mode...' to compile all at once
- First compilation of LCL program needs long time because first the whole LCL have to be compiled (even only a little bit is used)
- save your sources to the folder "/sources" which is connected to the directory you started the docker on
- you can find the executables in the lib/<cpu>-<os>/
- for Amiga 68k - LCL programs do not for get to copy the <exename>.fpcres file along the executable, it contains the GUI description

Have fun!
