#!/bin/bash

first="1st"
second="2nd"

func1 () { echo "Func1 ${!1} $2. "; }

func2 () { echo "Func2 $1 ${!2}. "; return 1; }

wrapper () {
 echo "Wrapper start:"
 #$1 $2 $3
 $@
 echo "($?): wrapper end."
}

invoker () {
 echo "Direct"
 func1 "first" "second"
 func2 "first" "second"
 
 echo "\nWrapper invocation"
 wrapper func1 "first" "second"
 wrapper func2 "first" "second"

 echo "\nWrapper in Loop invocation"
 for i in func1 func2; do
   wrapper $i "first" "second"
 done
}

echo "Starting!"
invoker
echo "All done!"
