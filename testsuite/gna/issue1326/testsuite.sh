#! /bin/sh

. ../../testenv.sh

analyze mytestbench.vhdl
elab mytestbench

simulate mytestbench --wave=dump.ghw | tee mytestbench.out

gcc ../../../src/grt/ghwdump.c ../../../src/grt/ghwlib.c -I../../../src/grt/ -o ghwdump

# We're just checking that ghwdump doesn't crash on a zero length signal.
./ghwdump -ths dump.ghw > dump.txt

rm -f mytestbench.out ghwdump dump.txt dump.ghw
clean

echo "Test passed"
