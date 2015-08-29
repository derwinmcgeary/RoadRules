use strict;
use warnings;

my %ids;
while ( <> ) {
    while ( /id="([^"]+)"/g ) {
        ++$ids{$1};
    }
}

while ( my ($id,$count) = each %ids ) {
    print "$id shows up $count times\n" if $count > 1;
}
