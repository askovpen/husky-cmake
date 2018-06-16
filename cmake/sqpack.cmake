if (NOT fidoconf_VERSION)
  include(fidoconf)
endif()
if (NOT smapi_VERSION)
  include(smapi)
endif()

ADD_EXECUTABLE(sqpack
  sqpack/sqpack.c
)
target_link_libraries(sqpack fidoconfig smapi)
target_include_directories(sqpack PRIVATE sqpack huskylib smapi fidoconf)

if (NOT MSVC)
  INSTALL(TARGETS sqpack
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
endif (NOT MSVC)
