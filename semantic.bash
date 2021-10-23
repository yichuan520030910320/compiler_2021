set ff=UNIX
set -e
cat | java -cp /ulib/java/antlr-4.9.2-complete.jar:./bin Main -semantic