# `method_missing` Regression Test

This is a simple test that uses a Hash with its attributes wrapped
in method accessors (a la Hashie).

The tests all pass in older versions of Ruby, but have stopped passing
in versions >= ruby-2.2.0.

The Travis test should produce the error, while the description of the
simple Widget class explains the expected behavior.
