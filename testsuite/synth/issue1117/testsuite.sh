#! /bin/sh

. ../../testenv.sh

for t in ent; do
    analyze $t.vhdl tb_$t.vhdl
    elab_simulate tb_$t
    clean

    synth '-gg=x"ff_ff_00_01"' $t.vhdl -e $t > syn_$t.vhdl
    analyze syn_$t.vhdl tb_$t.vhdl
    elab_simulate tb_$t --ieee-asserts=disable-at-0
    clean
done

echo "Test successful"
