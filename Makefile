get:
	@ cd ./tool; dart pub get

test: test4

test4:
	dart tool/bin/test.dart chap04_scanning --interpreter=./plox.py
