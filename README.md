[![Actions Status](https://github.com/skaji/Dist-Zilla-Plugin-Prereqs-From-cpmfile/actions/workflows/test.yml/badge.svg)](https://github.com/skaji/Dist-Zilla-Plugin-Prereqs-From-cpmfile/actions)

# NAME

Dist::Zilla::Plugin::Prereqs::From::cpmfile - Register prereqs from cpmfile

# SYNOPSIS

In you `dist.ini`:

    [Prereqs::From::cpmfile]

You can optionally specify phases:

    [Prereqs::From::cpmfile]
    phases = configure, build, runtime, test, develop

# DESCRIPTION

Dist::Zilla::Plugin::Prereqs::From::cpmfile registers prereqs from _cpmfile_.

# SEE ALSO

[Dist::Zilla::Plugin::Prereqs::FromCPANfile](https://metacpan.org/pod/Dist%3A%3AZilla%3A%3APlugin%3A%3APrereqs%3A%3AFromCPANfile)

[Module::cpmfile](https://metacpan.org/pod/Module%3A%3Acpmfile)

# AUTHOR

Shoichi Kaji <skaji@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2021 Shoichi Kaji <skaji@cpan.org>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
