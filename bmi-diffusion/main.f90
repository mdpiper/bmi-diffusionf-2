! Run the diffusion model through its BMI.
program bmi_main

  use bmidiffusionf
  implicit none

  character (len=*), parameter :: output_file = "bmidiffusionf.out"
  integer, parameter :: file_unit = 0
  character (len=*), parameter :: var_name = "plate_surface__density"
  integer, parameter :: ndims = 2

  type (bmi_diffusion) :: model
  integer :: arg_count = 0
  character (len=80) :: arg
  integer :: i, j, s, grid_id, grid_size, grid_shape(ndims)
  double precision :: current_time, end_time
  real, allocatable :: density(:)

  do while (arg_count <= 1)
    call get_command_argument(arg_count, arg)
    arg_count = arg_count + 1
  end do

  if (len_trim(arg) == 0) then
     write(*,"(a)") "Usage: run_bmidiffusionf CONFIGURATION_FILE"
     write(*,"(a)")
     write(*,"(a)") "Run the diffusionf model through its BMI with a configuration file."
     write(*,"(a)") "Output is written to the file `bmidiffusionf.out`."
     stop
  end if

  open(file_unit,file=output_file)

  write(file_unit,"(a)") "Initialize model."
  s = model%initialize(arg)

  write(file_unit,"(a)") "Model info..."
  call model%print_model_info(file_unit)

  s = model%get_current_time(current_time)
  s = model%get_end_time(end_time)
  s = model%get_var_grid(var_name, grid_id)
  s = model%get_grid_size(grid_id, grid_size)
  s = model%get_grid_shape(grid_id, grid_shape)

  allocate(density(grid_size))

  do while (current_time <= end_time)
     write(file_unit,"(a, f6.1)") "Model values at time = ", current_time
     s = model%get_value(var_name, density)
     do j = 1, grid_shape(1)
        do i = 1, grid_shape(2)
           write (file_unit,"(f6.1)", advance="no") density(j + grid_shape(1)*(i-1))
        end do
        write (file_unit,*)
     end do
     s = model%update()
     s = model%get_current_time(current_time)
  end do

  deallocate(density)
  s = model%finalize()
  write(file_unit,"(a)") "Finalize model."

  close(file_unit)

end program bmi_main
