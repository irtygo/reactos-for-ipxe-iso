all:
  $(CC) $(wildcard *.c) -o tmp_exe
  chmod +x run_stuff.sh
  ./tmp_exe
  ./run_stuff.sh
