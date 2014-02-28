On OS X commands are different.
This is on Linux

   cd c-tmp
   tar xvzf ../myctest.tgz 
   rm libmy.* *.o
   for i in *.c ; do gcc -c -fPIC -Wall $i ; done
   gcc -shared -Wl,-soname,libmy.so.1 -o libmy.so.1.0.1 hello.o bye.o -lc
   ls -al
   ln -s libmy.so.1.0.1 libmy.so.1
   ln -s libmy.so.1 libmy.so
   ar rcs libmy.a bye.o hello.o
   gcc -static main.o -L. -lmy -o statically_linked
   ./statically_linked 
   gcc main.o -L. -lmy -o dynamically_linked
   LD_LIBRARY_PATH=. ./dynamically_linked 
   ./dynamically_linked 

