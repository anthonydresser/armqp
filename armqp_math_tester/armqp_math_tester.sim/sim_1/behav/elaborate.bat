@echo off
set xv_path=C:\\XilinxVivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 5aa0a778f6a840c080f5e8d83b527d5b -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0 -L c_reg_fd_v12_0 -L xbip_dsp48_wrapper_v3_0 -L xbip_pipe_v3_0 -L xbip_dsp48_addsub_v3_0 -L xbip_addsub_v3_0 -L c_addsub_v12_0 -L xbip_bram18k_v3_0 -L mult_gen_v12_0 -L axi_utils_v2_0 -L cordic_v6_0 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot math_tester_behav xil_defaultlib.math_tester xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
