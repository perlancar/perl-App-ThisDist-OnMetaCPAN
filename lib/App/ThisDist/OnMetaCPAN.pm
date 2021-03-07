package App::ThisDist::OnMetaCPAN;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'this-dist-on-metacpan and some other CLIs',
};

$SPEC{this_dist_on_metacpan} = {
    v => 1.1,
    summary => 'Open MetaCPAN release page for "the current distribution"',
    description => <<'_',

This is a thin wrapper for <prog:this-dist>. See its documentation for details
on how the script determines "the current distribution".

_
    args => {},
    deps => {
        prog => 'this-dist',
    },
};
sub this_dist_on_metacpan {
    require Browser::Open;

    my $dist = `this-dist`;
    return [412, "this-dist failed"] unless length $dist;
    chomp($dist);
    Browser::Open::open_browser("https://metacpan.org/release/$dist");
    [200];
}

$SPEC{this_mod_on_metacpan} = {
    v => 1.1,
    args => {},
    summary => 'Open MetaCPAN module page for "the current module"',
    description => <<'_',

This is a thin wrapper for <prog:this-mod>. See its documentation for details on
how the script determines "the current module".

_
    deps => {
        prog => 'this-mod',
    },
};
sub this_mod_on_metacpan {
    require Browser::Open;

    my $mod = `this-mod`;
    return [412, "this-mod failed"] unless length $mod;
    chomp($mod);
    Browser::Open::open_browser("https://metacpan.org/pod/$mod");
    [200];
}

1;
# ABSTRACT:

=head1 DESCRIPTION

This distribution provides the following CLIs:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<App::ThisDist>

L<lcpan> subcommands: C<lcpan metacpan-mod>, C<lcpan metacpan-dist>
