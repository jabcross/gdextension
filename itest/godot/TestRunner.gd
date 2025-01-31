# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

extends Node

func _ready():
	var rust_tests := IntegrationTests.new()

	var rust = rust_tests.run()
	var manual = $ManualFfiTests.run()
	var generated = $GenFfiTests.run()

	var status: bool = rust && manual && generated

	print()
	var exit_code: int
	if status:
		print(" All tests PASSED.")
		exit_code = 0
	else:
		print(" Tests FAILED.")
		exit_code = 1

	print(" -- exiting.")
	rust_tests.free()
	get_tree().quit(exit_code)
