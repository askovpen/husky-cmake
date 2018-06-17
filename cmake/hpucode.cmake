if (NOT fidoconf_VERSION)
  include(fidoconf)
endif()
if (NOT smapi_VERSION)
  include(smapi)
endif()

ADD_EXECUTABLE(hpucode
  hpucode/src/dupe.c
  hpucode/src/scanmsg.c
  hpucode/src/uuecode.c
  hpucode/src/uuefile.c
)
target_link_libraries(hpucode fidoconfig smapi husky)
target_include_directories(hpucode PRIVATE hpucode/h huskylib smapi fidoconf)

if (NOT MSVC)
  INSTALL(TARGETS hpucode
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
endif (NOT MSVC)
