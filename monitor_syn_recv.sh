#!/usr/bin/perl
$CNT_SYN_RECV = 'netstat -na|grep -ic syn_recv';

if ($CNT_SYN_RECV > 40) {
        print "<Result>False</Result>\n";
} else {
        print "<Result>True</Result>\n";
