set origin_dir [file dirname [file normalize [info script]]]
create_project dynamic_7segment "$origin_dir/project" -part xc7z020clg400-1 -force
add_files "$origin_dir/src/dymc_seg.v"
add_files -fileset constrs_1 "$origin_dir/constrs/dymc_seg_cs.xdc"
add_files -fileset sim_1 "$origin_dir/sim/dynamic_7segment_tb_selfcheck.v"
set_property top dymc_seg [current_fileset]
set_property top dynamic_7segment_tb_selfcheck [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
