set fh [open "student.txt"];
while {[gets $fh line] >=0} {
if {[regexp "o\[hrb\]" $line]} { puts $line }
}
