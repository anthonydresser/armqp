@echo off
set xv_path=C:\\XilinxVivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim math_tester_behav -key {Behavioral:sim_1:Functional:math_tester} -tclbatch math_tester.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
