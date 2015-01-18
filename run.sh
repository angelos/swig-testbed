# Complain when we can't find a JAVA_HOME
if [ -z "$JAVA_HOME" ];
then
    echo "JAVA_HOME not set; needs to point to a Java Home directory."
    exit
fi

# Some initialization
echo "* Initializing"
rm -rf java_generated
rm -rf jni
mkdir java_generated
mkdir jni

echo "* Running SWGI"
# Build our bridge code
swig -java -outdir java_generated -o jni/alive_wrap.c alive.i

echo "* Build C code into library"
# Build a library for Java to use
gcc -c c/alive.c jni/alive_wrap.c -I. -I${JAVA_HOME}/include -I${JAVA_HOME}/include/darwin
gcc -shared alive.o alive_wrap.o -Wl  -o libalive.jnilib
# Cleanup up our mess
rm *.o

echo "* Compile Java code"
# Build our Java code
javac java_generated/*.java
javac -classpath java_generated java/*.java

echo "* Run result"
java -Djava.library.path=. -cp java:java_generated AliveTest