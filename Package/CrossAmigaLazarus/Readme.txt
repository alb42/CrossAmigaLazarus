Lazarus docker for cross Amiga compilation
------------------------------------------

What you need:
- a x86_64-Linux computer with installed docker (tested with ubuntu)
- VNC client for your desktop (Linux/Windows/Amiga)

How to use:
- Create a new directory on your linux box
- copy these files into it
- start the docker: (needs root access, via sudo)
    ./CrossAmigaLazarusDocker.sh
- you get the shell inside the docker looks like:
    root@<some number>:/sources#
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
    Amiga OS4  (PowerPC Amiga OS 4.x)
  are preinstalled, choose them to compile for one special target, or 'Compile many Mode...' to compile all at once
- First compilation of LCL program needs long time because first the whole LCL have to be compiled (even only a little bit is used)
- save your sources to the folder "/sources" which is connected to the directory you started the docker on
- you can find the executables in the lib/<cpu>-<os>/
- for Amiga 68k - LCL programs do not for get to copy the <exename>.fpcres file along the executable, it contains the GUI description

Direct compile:
- Copy the CrossFPC* scripts somewher in PATH so that you can directly start them
- go to your Source directory and compile as normal just replace "fpc" by the CrossFPCAmiga, CrossFPCAROS, CrossFPCMorphOS, CrossFPCOS4 script
  e.g.  CrossFPCAmiga hello.pas
- you can supply same parameters as you would supply for FPC
  e.g. CrossFPCAmiga -O2 -Fusrc -FUunits -oNewExe hello.pas
  take care all pathes you give there must be inside the current directory or the compiler in the docker can't find it

Updating docker image:
- To Update the docker image you may start the updater script
  ./CheckForUpdate.sh

Have fun!
