use v5.40;
use Test2::V0;

use experimental 'defer';

use File::Temp ();
use JSON::PP ();

sub read_file ($file) {
    open my $fh, "<", $file or die;
    join "", <$fh>;
}

sub write_file ($file, $content) {
    open my $fh, ">", $file or die;
    print {$fh} $content;
}

my $tempdir = File::Temp->newdir;
chdir $tempdir or die;
defer { chdir "/" }

mkdir "lib";

write_file "lib/Foo.pm", <<'EOF';
package Foo;
1;
EOF

write_file "dist.ini", <<'EOF';
abstract = test
author = Shoichi Kaji
copyright_holder = Shoichi Kaji
license = Perl_5
name = Foo
version = v0.0.1
[GatherDir]
[Prereqs::From::cpmfile]
[MetaJSON]
EOF

write_file "cpm.yml", <<'EOF';
prereqs:
  runtime:
    requires:
      P1: { version: '1' }
  develop:
    requires:
      P3: { version: '3' }
features:
  hoge:
    description: This is a description
    prereqs:
      runtime:
        requires:
          P2: { version: '2' }
EOF

!system "env", "-u", "HOME", "dzil", "build" or die;

my $meta = JSON::PP->new->decode( read_file "Foo-v0.0.1/META.json" );

is $meta->{prereqs}, {
    runtime => {
        requires => {
            P1 => '1',
        },
    },
};

is $meta->{optional_features}, {
    hoge => {
        description => "This is a description",
        prereqs => {
            runtime => {
                requires => {
                    P2 => '2',
                },
            },
        },
    },
};

done_testing;
