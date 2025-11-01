# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "F:\\AHE_Final_Labs\\hello_demo\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "F:\\AHE_Final_Labs\\hello_demo\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "F:\\AHE_Final_Labs\\hello_demo\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "F:\\AHE_Final_Labs\\hello_demo\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
