
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Parse mime-types, match against media ranges",
  "AUTHOR" => "Aristotle Pagaltzis <pagaltzis\@gmx.de>",
  "BUILD_REQUIRES" => {
    "File::Basename" => 0,
    "JSON::XS" => 0,
    "List::Util" => 0,
    "Test::More" => 0,
    "TestParseMIME" => 0,
    "constant" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Parse-MIME",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Parse::MIME",
  "PREREQ_PM" => {
    "Exporter" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.000",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



