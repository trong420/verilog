set fh [open "student.txt"];
while {[gets $fh line] >= 0} {
if {[lindex $line 3] > [lindex $line 4]} {
 puts [lindex $line 1]}
}
