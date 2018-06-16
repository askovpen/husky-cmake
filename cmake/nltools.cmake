if (NOT fidoconf_VERSION)
  include(fidoconf)
endif()
if (NOT smapi_VERSION)
  include(smapi)
endif()
if (NOT husky_VERSION)
  include(husky)
endif()

ADD_EXECUTABLE(nldiff
  nltools/src/nldiff.c
  nltools/src/crc16.c
)
ADD_EXECUTABLE(nlcrc
  nltools/src/nlcrc.c
  nltools/src/crc16.c
)
ADD_EXECUTABLE(ulc
  nltools/src/ulcsort.c
  nltools/src/ulcomp.c
  nltools/src/ulc.c
  nltools/src/string.c
  nltools/src/nldate.c
  nltools/src/julian.c
  nltools/src/nlfind.c
)
ADD_EXECUTABLE(nlupd
  nltools/src/nlupdate.c
  nltools/src/string.c
  nltools/src/nldate.c
  nltools/src/julian.c
  nltools/src/nlfind.c
)

target_link_libraries(nldiff fidoconfig smapi husky)
target_include_directories(nldiff PRIVATE nltools/h huskylib)
target_link_libraries(nlcrc fidoconfig smapi husky)
target_include_directories(nlcrc PRIVATE nltools/h huskylib)
target_link_libraries(ulc fidoconfig smapi husky)
target_include_directories(ulc PRIVATE nltools/h huskylib fidoconf)
target_link_libraries(nlupd fidoconfig smapi husky)
target_include_directories(nlupd PRIVATE nltools/h huskylib fidoconf hptzip)

if (HPTZIP)
  target_link_libraries(nlupd hptzip ${ZLIB_LIBRARIES})
endif()

if (NOT MSVC)
  INSTALL(TARGETS nldiff nlcrc ulc nlupd
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
endif (NOT MSVC)
