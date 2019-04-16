# bmi-diffusion

This is a BMI for the `diffusionf` model.
Each file in this directory has a story.

* **bmi_diffusion.f90**: This is the BMI implementation for the
  `diffusionf` model. All of the abstract procedures in the BMI
  specification are implemented as concrete functions here, although
  some may be only skeletons. This file also contains a pair of
  non-BMI helper procedures.

* **main.f90**: A main program to run the `diffusionf` model through
  its BMI. When built, it becomes the `run_bmidiffusionf`
  executable. It requires a model configuration file as input.
