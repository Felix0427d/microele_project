if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2025.2} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec"
if {![file exists {C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec/impl_1}]} {
  file mkdir {C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec/impl_1}
}
cd {C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec/impl_1}
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- FPGA_microelec_impl_1.vm FPGA_microelec_impl_1.ldc
if {[file normalize "C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec/impl_1/FPGA_microelec_impl_1_synplify.tcl"] != [file normalize "./FPGA_microelec_impl_1_synplify.tcl"]} {
  file copy -force "C:/Users/felix/Documents/Master_1ECAM/microelec/projet_microelec/FPGA_microelec/impl_1/FPGA_microelec_impl_1_synplify.tcl" "./FPGA_microelec_impl_1_synplify.tcl"
}
if {[ catch {::radiant::runengine::run_engine synpwrap -prj "FPGA_microelec_impl_1_synplify.tcl" -log "FPGA_microelec_impl_1.srf"} result options ]} {
    file delete -force -- FPGA_microelec_impl_1.vm FPGA_microelec_impl_1.ldc
    return -options $options $result
}
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o FPGA_microelec_impl_1_syn.udb FPGA_microelec_impl_1.vm] [list FPGA_microelec_impl_1.ldc]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
