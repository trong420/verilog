set fh [open myfile.txt];
while {[gets $fh line]>=0} {
if {[regexp "hello|bye" $line]} {puts $line}
}
