set fh [open "student.txt"];
while {[gets $fh line] >= 0} {
puts [lindex $line 1]
}
