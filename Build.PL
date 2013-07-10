use Modern::Perl;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Run::Parts',
    license             => 'Perl_5',
    dist_author         => q{Axel Beckert <abe@deuxchevaux.org>},
    dist_version_from   => 'lib/Run/Parts.pm',
    release_status      => 'stable',
    meta_merge => {
        resources => {
            repository => 'https://github.com/xtaran/run-parts',
            bugtracker => "https://rt.cpan.org/Dist/Display.html?Name=Run-Parts",
        }
    },
    configure_requires => {
        'Module::Build' => '0.37',
        'Modern::Perl' => 0,
    },
    test_requires => {
        'Test::More' => 0,
        'Test::Differences' => 0,
        'Test::NoWarnings' => 0,
        'File::Slurp' => 9999.06,
    },
    requires => {
        perl => '5.10.0',
        autodie => 0,
        'Taint::Util' => 0,
        'File::Slurp' => 0,
        'Exporter::Easy' => 0,
        'Scalar::Util' => 0,
    },
    add_to_cleanup     => [ 'Run-Parts-*' ],
);

$builder->create_build_script();
