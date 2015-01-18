## What's this?
A simple [SWIG][swig]-to-Java testbed, to test our your SWIG interface files outside of the context of your project.

## Using it
We have the following inputs,
- `c` contains your C source code, in a single header, and a single implementation file. Just drop all your implementation in there.
- `java` contains your Java code, which can assume the existince of our SWIG bridge code.
- `alive.i` is your interface file.

Then, run the setup using `run.sh`.

### I'm not sure my issue is because of SWIG
There's a `main` in `alive.c`, which will be activated when you run `run-c.sh`.

## Known issues
- Only works on Mac OS for now.

-- [@_angelos](https://twitter.com/_angelos), 2015-01

[swig]:http://www.swig.org/