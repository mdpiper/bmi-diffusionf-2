# bmi-diffusionf-2

A [Basic Model Interface](https://bmi-spec.readthedocs.io/en/latest/) (BMI)
for the [diffusionf model](https://github.com/mdpiper/diffusionf).

This implementation assumes that the BMI specification
has been installed separately as a shared library.
See [bmi-diffusionf-1](https://github.com/mdpiper/bmi-diffusionf-1)
for an alternate implementation.

**Prerequisites:**

1. The `diffusionf` model must be installed.  Directions are given in
a [README](https://github.com/mdpiper/diffusionf/blob/master/README.md).

1. The Fortran BMI bindings must be installed.  Directions are given in
a [README](https://github.com/csdms/bmi-fortran/blob/master/README.md).
You can choose to build the bindings from source or install them
through a conda binary.

To build this BMI,
change to the root directory of this repository and execute:

```bash
mkdir _build && cd _build
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/path/to/diffusionf/install
make
make install
```

where **/path/to/diffusionf/install** is the location
of the installed `diffusionf` model
and Fortran BMI bindings.

The installed files are organized as follows:
```
.
|-- bin
|   |-- run_bmidiffusionf
|   `-- run_diffusionf
|-- include
|   |-- bmidiffusionf.mod
|   |-- bmif.mod
|   `-- diffusion.mod
`-- lib
    |-- libbmidiffusionf.so
    |-- libbmif.so
    `-- libdiffusionf.so
```

After installing,
run the model through its BMI with the `run_bmidiffusionf` program,
which takes a model configuration file
(see the [example](./example) directory for a sample)
as a required parameter.

    run_bmidiffusionf test.cfg

Output from the model run is written to the file **bmidiffusionf.out**
in the current directory.
