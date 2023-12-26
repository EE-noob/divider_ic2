debImport "-sv" "-f" "rtl_list.f" "-f" "sim_list.f"
debLoadSimResult /home/ICer/ic_prjs/ic2/sim/testname.fsdb
wvCreateWindow
srcDeselectAll -win $_nTrace1
srcSelect -signal "pull_out" -line 22 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "srt2_tb.top_dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "srt2_tb.top_dut" -delim "."
srcHBSelect "srt2_tb.top_dut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {8 19 3 1 1 1}
wvAddSignal -win $_nWave2 "/srt2_tb/top_dut/clk" "/srt2_tb/top_dut/rst_n" \
           "/srt2_tb/top_dut/sign" "/srt2_tb/top_dut/push_in" \
           "/srt2_tb/top_dut/data_in_in\[7:0\]" "/srt2_tb/top_dut/select" \
           "/srt2_tb/top_dut/data_out_out\[7:0\]" "/srt2_tb/top_dut/sign_out" \
           "/srt2_tb/top_dut/pull_out"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 9)}
wvSetPosition -win $_nWave2 {("G1" 9)}
srcHBSelect "srt2_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "srt2_tb" -delim "."
srcHBSelect "srt2_tb" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk2" -line 443 -pos 1 -win $_nTrace1
srcAction -pos 442 2 1 -win $_nTrace1 -name "clk2" -ctrlKey off
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 1)}
wvAddSignal -win $_nWave2 "/srt2_tb/clk2"
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 236325.945755 -snap {("G1" 2)}
