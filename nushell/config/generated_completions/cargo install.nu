extern "cargo install" [
	--quiet(-q)		# Do not print cargo log messages
	--version		# Specify a version to install
	--git		# Git URL to install the specified crate from
	--branch		# Branch to use when installing from git
	--verbose(-v)		# Use verbose output (-vv very verbose/build.rs output)
	--tag		# Tag to use when installing from git
	--color		# Coloring: auto, always, never
	--rev		# Specific commit to use when installing from git
	--frozen		# Require Cargo.lock and cache are up to date
	--path		# Filesystem path to local crate to install
	--list		# list all installed packages and their versions
	--locked		# Require Cargo.lock is up to date
	--jobs(-j)		# Number of parallel jobs, defaults to # of CPUs
	--offline		# Run without accessing the network
	--config		# Override a configuration value (unstable)
	--keep-going		# Do not abort the build as soon as there is an error (unstable)
	--force(-f)		# Force overwriting existing crates or binaries
	--no-track		# Do not save tracking information
	--features		# Space or comma separated list of features to activate
	--all-features		# Activate all available features
	--no-default-features		# Do not activate the `default` feature
	--profile		# Install artifacts with the specified profile
	--debug		# Build in debug mode instead of release mode
	--bin		# [<NAME>]              Install only the specified binary
	--bins		# Install all binaries
	--example		# [<NAME>]          Install only the specified example
	--examples		# Install all examples
	--target		# Build for the target triple
	--target-dir		# Directory for all generated artifacts
	--root		# Directory to install packages into
	--index		# Registry index to install from
	--registry		# Registry to use
	--message-format		# Error format
	--timings		# [=<FMTS>...]       Timing output formats (unstable) (comma separated): html, json
	--help(-h)		# Print help information
	...args
]

