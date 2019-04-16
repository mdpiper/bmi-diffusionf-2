# Link against installed bmif and diffusion libraries.
add_library(${bmidiffusion_lib} SHARED bmi_diffusion.f90)
target_link_libraries(${bmidiffusion_lib} ${diffusion_lib} ${bmif_lib})

add_executable(run_${bmidiffusion_lib} main.f90)
target_link_libraries(run_${bmidiffusion_lib} 
  ${bmidiffusion_lib} ${diffusion_lib} ${bmif_lib})

install(
  PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/run_${bmidiffusion_lib}
  DESTINATION bin)
install(
  TARGETS ${bmidiffusion_lib}
  DESTINATION lib)
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/${bmidiffusion_lib}.mod
  DESTINATION include)
