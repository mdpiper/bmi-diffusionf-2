cmake_minimum_required(VERSION 2.8)

project(bmi-diffusion Fortran)

set(bmidiffusion_lib bmidiffusionf)

# Locate the installed bmif and diffusionf libraries (via CMAKE_PREFIX_PATH).
find_library(diffusion_lib diffusionf)
find_library(bmif_lib bmif)

# Locate the installed bmif and diffusion modules (via CMAKE_PREFIX_PATH).
find_path(diffusion_mod diffusion.mod)
find_path(bmif_mod bmif.mod)
include_directories(${diffusion_mod} ${bmif_mod})

add_subdirectory(bmi-diffusion)
