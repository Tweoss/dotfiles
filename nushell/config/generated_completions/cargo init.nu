extern "cargo init" [
	--quiet(-q)		# Do not print cargo log messages
	--registry		# Registry to use
	--vcs		# Initialize a new repository for the given version control system
	--bin		# Use a binary (application) template [default]
	--verbose(-v)		# Use verbose output (-vv very verbose/build.rs output)
	--lib		# Use a library template
	--color		# Coloring: auto, always, never
	--edition		# Edition to set for the crate generated [possible values: 2015,
	--frozen		# Require Cargo.lock and cache are up to date
	--name		# Set the resulting package name, defaults to the directory name
	--locked		# Require Cargo.lock is up to date
	--offline		# Run without accessing the network
	--config		# Override a configuration value (unstable)
	--help(-h)		# Print help information
	...args
]

