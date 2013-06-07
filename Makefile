all: Build
	./Build

Build: Build.PL
	perl Build.PL

build manifest clean manifest_skip code manpages config_data pardist diff ppd dist ppmdist distcheck prereq_data distclean prereq_report distdir pure_install distinstall realclean distmeta retest distsign skipcheck disttest test docs testall fakeinstall testcover help testdb html testpod install testpodcoverage installdeps versioninstall: Build
	./Build $@
