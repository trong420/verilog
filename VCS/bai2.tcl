#!/usr/bin/tclsh
set line {welch:*:3116:100:BrentWelch:/usr/welch:/bincsh/}
set lis [split $line :]
set len [llength $lis]
for {set i 0} {$i < $len} {incr i} {
	set element [lindex $lis $i]
	puts stdout "$element \n"
}
