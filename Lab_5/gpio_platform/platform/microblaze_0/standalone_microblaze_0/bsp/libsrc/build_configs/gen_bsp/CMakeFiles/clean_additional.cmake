# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "E:\\GPIO\\project_2\\gpio_platform\\platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "E:\\GPIO\\project_2\\gpio_platform\\platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "E:\\GPIO\\project_2\\gpio_platform\\platform\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "E:\\GPIO\\project_2\\gpio_platform\\platform\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
