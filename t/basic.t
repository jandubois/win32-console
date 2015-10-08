#!perl

use Test::More;

use_ok("Win32::Console");

my $CONSOLE = Win32::Console->new();

ok $CONSOLE, "Constructor returns something";

# Not completely sure this is always true
ok $CONSOLE->Attr() > 0, "Attribute retrieved with success";

@cursor = $CONSOLE->Cursor();

is scalar(@cursor), 4, "Cursor returns coordinates, size and visibility";

ok $cursor[0] >= 0, "Cursor X is a positive integer";
ok $cursor[1] >= 0, "Cursor Y is a positive integer";

is $CONSOLE->FillChar("X", 80*25, 0, 0), 80*25, "Fill returns correct value";

@info = $CONSOLE->Info();

is scalar(@info), 11, "Info returns 11 elements";

ok $info[0] > 0, "Number of rows is positive";
ok $info[1] > 0, "Number of cols is positive";

ok $info[2] < $info[0], "row position in on screen";
ok $info[3] < $info[1], "col position is on screen";

done_testing();