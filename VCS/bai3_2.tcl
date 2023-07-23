set s1 "Hello"
set s2 "World"
set s3 "World"
puts [string compare s2 s2]
if {[string compare s2 s3]==0} {
puts "String\'s1\'and\'s2\'are same.";
}
if {[string compare s1 s2]==-1} {
puts "String\'s1\'comes before\'s2\'.";
}
if {[string compare s2 s1]==1} {
puts "String\'s2\'comes before\'s1\'.";
}

