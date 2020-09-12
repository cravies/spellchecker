compile:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
c:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < dictionary.txt -c "test.txt"
dot: 
	dot -Tpdf < output.dot > output.pdf
	dot -Tpdf < sample.dot > sample.pdf
d:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < dictionary.txt -d
f:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < smalldictionary.txt -r -o -f "output.dot"
	./sample-asgn < smalldictionary.txt -r -o -f "sample.dot"
o:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < smalldictionary.txt -o
r:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < dictionary.txt -r
h:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < dictionary.txt -h
check:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	echo "testing c > f precedence. Should not output test.dot"
	./output < smalldictionary.txt -r -c test.txt -o -f test.dot
	ls | grep test
	echo "testing f needs o, should not output test1.dot"
	./output < smalldictionary.txt -r -f test1.dot
memcheck:
	gcc -W -Wall -O2 -ansi -pedantic -g tree.c mylib.c main.c -o output
	./output < smalldictionary.txt -r -c test.txt
	echo "now running sample program with same settings.."
	./sample-asgn < smalldictionary.txt -c test.txt
clean:
	rm test.dot && rm test1.dot
