set(hptzip_VERSION 0.1.0)

set(hptzip_SOURCES
  hptzip/src/hptzip.c
  hptzip/src/ioapi.c
#  hptzip/src/iowin32.c
#  hptzip/src/test.c
  hptzip/src/unzip.c
#  hptzip/src/version.c
  hptzip/src/zip.c
)
if (WIN32)
  list(APPEND hptzip_SOURCES hptzip/src/iowin32.c)
endif()

set(hptzip_HEADERS
  hptzip/hptzip/crypt.h
  hptzip/hptzip/hptzipdl.h
  hptzip/hptzip/hptzip.h
  hptzip/hptzip/ioapi.h
  hptzip/hptzip/iowin32.h
  hptzip/hptzip/unzip.h
  hptzip/hptzip/version.h
  hptzip/hptzip/zip.h
)

ADD_LIBRARY(hptzip SHARED ${hptzip_SOURCES})
set_target_properties(hptzip PROPERTIES VERSION ${hptzip_VERSION})
set_target_properties(hptzip PROPERTIES PUBLIC_HEADER "${hptzip_HEADERS}")
target_include_directories(hptzip PRIVATE huskylib)
if (UNIX)
set_target_properties(hptzip PROPERTIES CMAKE_C_FLAGS "${CMAKE_C_FLAGS_DEBUG} -O0")
endif()


if (HPTZIP)
  target_include_directories(hptzip PRIVATE ${ZLIB_INCLUDE_DIRS})
  target_link_libraries(hptzip ${ZLIB_LIBRARIES})
endif()

target_include_directories(hptzip PRIVATE hptzip/hptzip)
if (NOT MSVC)
  INSTALL(TARGETS hptzip
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include/hptzip
  )
endif (NOT MSVC)
