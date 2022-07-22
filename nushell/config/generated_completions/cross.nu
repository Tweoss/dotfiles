extern "cross" [
	--version(-V)		# Print version info and exit
	--list		# List installed commands
	--explain		# Run `rustc --explain CODE`
	--verbose(-v)		# Use verbose output (-vv very verbose/build.rs output)
	--quiet(-q)		# Do not print cargo log messages
	--color		# Coloring: auto, always, never
	--frozen		# Require Cargo.lock and cache are up to date
	--locked		# Require Cargo.lock is up to date
	--offline		# Run without accessing the network
	--config		# Override a configuration value (unstable)
	--help(-h)		# Print help information
	...args
]

