# C_Plus_Plus Project

This repository is a template I made and personally use to bootstrap my C and C++ projects.  

Feel free to use it. It's licenced under [Unlicence](https://unlicense.org).  
You will probably want to change the [licence](./LICENCE.MD) after you clone this, though.

## Setting up your workspace

This project has a [.editorconfig file](https://editorconfig.org/) to enforce project level coding standards.  
CLion has built-in support,
VSCode requires [a plugin](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig).

## How to run

This project requires [CMake](https://cmake.org/) to build.
Your IDE (VSCode or CLion) should automatically detect the CMakeLists.txt file and build the project.
Install extensions for CMake support if prompted.  
If you are using the command line, you can run the following commands:

```bash
cmake -S src -B build
```

Then execute the following command to run the program:

```bash
cd build
.\executable
```

## Generating Documentation

This project uses [Doxygen](https://www.doxygen.nl/index.html) to generate documentation.  
If Doxygen is available on your system,  
You can generate the documentation by running the following command:

```bash
doxygen Doxyfile
```
