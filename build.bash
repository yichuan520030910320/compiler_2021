# this script is called when the judge is building your compiler.
# no argument will be passed in.
# shellcheck disable=SC2121
set ff=UNIX
mkdir runContain
find ./src -name "*.java" -print0|xargs -0 javac -d runContain -cp ./src/antlr-4.9.2-complete.jar