#************parameter input*************
#※prepare the source list file  and then make add the soucefile name 
#for example ,the Verilog source file's name is vlog_list.f then :make norsim rtl_list=file_list
rtl_list =  rtl_list
sim_list =  sim_list
simv_name = simv
vpdpluse_name = vcdpluse
cov_file_name = coverage
vdb_name = $(simv_name)
#************constant command************
#compile
NOR_VCS = vcs -full64 -sverilog +v2k -timescale=1ns/1ns            \
      -debug_all                               \
      +notimingcheck                                   \
      +nospecify                                       \
      +vcs+flush+all                                   \
      -o $(simv_name)   \
      -l compile.log	\
	  -f $(rtl_list).f  \
		-f $(sim_list).f
 
#coverage compile switch 
COV_SW = -cm line+cond+fsm+branch+tgl
 
#verdi dump wave compile option 
VERDI_SW = -P \
${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab  \
${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a
 
#run option
RUN_GUI = -R -gui -l run.log
RUN_VPD = -R +vpdfile+$(vpdpluse_name).vpd -l run.log
RUN_COV = -R $(COV_SW) -cm_name $(vdb_name) -cm_dir ./$(cov_file_name) -l run.log
RUN_VER = -R +fsdb+autoflush -l run.log
#************command************
#verdi
srtsim:srtfl run_vcs 
fpsim:fpfl run_vcs 
versim: run_vcs vd
fl:
	find ../rtl -name "*v" > rtl_list.f;find ../tc -name "*v" > sim_list.f;
srtfl:
	find ../rtl -maxdepth 1 -type f -name "*v" > rtl_list.f;find ../tb -name "srt2_tb.v" > sim_list.f;
fpfl:
	find ../rtl -maxdepth 1 -type f -name "*v" > rtl_list.f;find ../tb -name "fp_tb.v" > sim_list.f;
run_vcs:
	$(NOR_VCS) $(VERDI_SW) $(RUN_VER)
vd:
	verdi -sv -f $(rtl_list).f -f $(sim_list).f -ssf *.fsdb -nologo &
#normally sim
norsim: 
	$(NOR_VCS) $(RUN_GUI) 
 
#post-process
postsim:
	$(NOR_VCS)  $(RUN_VPD) 
	dve -vpd $(vpdpluse_name).vpd
 
#coverage
covsim:
	$(NOR_VCS) $(COV_SW) $(RUN_COV) 
	dve -covdir $(cov_file_name).vdb
  
#rm 
clr:
	rm -rf *csrc ./*.daidir $(simv_name) *simv* DVE* ucli* *.vpd *.vdb *.log *.fsdb *novas* *.dat *Log *rc *conf
 
dir:
	cd ../;mkdir rtl;mkdir sg;mkdir dc;mkdir tc;cd sim;

gitp4:
	git add ../;git commit -m "$(nm)";git push origin master;

gitpl:
	git fetch origin;git merge  master origin/master
