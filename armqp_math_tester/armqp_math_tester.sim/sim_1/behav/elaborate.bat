@echo off
set xv_path=C:\\XilinxVivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 5aa0a778f6a840c080f5e8d83b527d5b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot math_tester_behav xil_defaultlib.math_tester xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
