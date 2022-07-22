extern "rargs" [
	--dry-run(-e)		# Print the commands to be executed without actually execute
	--help(-h)		# Prints help information
	--read0(-0)		# Read input delimited by ASCII NUL(\0) characters
	--version(-V)		# Prints version information
	--delimiter(-d)		# regex pattern used as delimiter (conflict with pattern)
	--pattern(-p)		# regex pattern that captures the input
	--separator(-s)		# separator for ranged fields [default:  ]
	--startnum(-n)		# start value for line number [default: 1]
	--threads(-j)		# Number of threads to be used [default: 1]
	--worker(-w)		# Deprecated. Number of threads to be used (same as --threads) [default: 1]
	...args
]

