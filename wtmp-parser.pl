use POSIX 'strftime';
open(UTMP, "/var/log/wtmp");
$template = "i i A32 A4 A32 A256 s s L L L I4 A20";
$size = length pack($template, ());
while(read(UTMP, $utmp, $size ) == $size) {
        @d = unpack($template, $utmp);
        printf("%d\t%d\t%s\t%s\t%s\t%s\t%d/%d\t%d\t". strftime("%Y\t%m\t%d\t%H\t%M\t%S",localtime($d[9])). "\n", $d[0], $d[1], $d[2], $d[3], $d[4], $d[5], $d[6], $d[7], $d[8]);
}
close(UTMP);
