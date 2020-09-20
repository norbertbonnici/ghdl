#! /bin/sh

. ../../testenv.sh

analyze_failure --force-analysis inst1.vhdl
analyze_failure --force-analysis notype1.vhdl
analyze_failure --force-analysis notype2.vhdl
analyze_failure --force-analysis nochoice1.vhdl
analyze_failure --force-analysis nochoice2.vhdl
analyze_failure --force-analysis choicelen.vhdl
analyze_failure --force-analysis noexpr.vhdl
analyze_failure --force-analysis str.vhdl
analyze_failure --force-analysis procinter.vhdl
analyze_failure --force-analysis emptyquote2.vhdl
analyze_failure --force-analysis bitstr.vhdl
analyze_failure usrattr.vhdl
analyze_failure forloop.vhdl 
analyze_failure emptyquote.vhdl
analyze_failure qual.vhdl
analyze_failure proctarg.vhdl
analyze_failure libparen.vhdl
analyze_failure --force-analysis badrng.vhdl

if analyze_failure --force-analysis notype1.vhdl 2>&1 | grep -q "indexed name"; then
  :
else
  echo "FAIL: missing error message from semantic analysis"
fi

clean

echo "Test successful"
