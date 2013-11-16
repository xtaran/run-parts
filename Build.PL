use Modern::Perl;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Run::Parts',
    license             => 'Perl_5',
    dist_author         => q{Axel Beckert <abe@deuxchevaux.org>},
    dist_version_from   => 'lib/Run/Parts.pm',
    release_status      => 'stable',
    create_readme       => 1,
    meta_merge => {
        resources => {
            repository => 'https://github.com/xtaran/run-parts',
            bugtracker => "https://rt.cpan.org/Dist/Display.html?Name=Run-Parts",
        }
    },
    configure_requires => {
        'Module::Build' => '0.4004',
        'Modern::Perl' => 0,
    },
    test_requires => {
        'Test::More' => 0,
        'Test::Differences' => 0,
        'Test::NoWarnings' => 0,
        'Test::CPAN::Changes' => 0.23,
    },
    requires => {
        perl => '5.10.1',
        autodie => 0,
        'Taint::Util' => 0,
        'File::Slurp' => 9999.17,
        'Exporter::Easy' => 0,
        'Scalar::Util' => 0,
    },
    develop_requires => {
        'Pod::Readme' => 0,
    },
    add_to_cleanup     => [
        'Run-Parts-*',
        'README',
    ],
);

$builder->create_build_script();
