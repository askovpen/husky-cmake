if (NOT husky_VERSION)
  include(husky)
endif()
if (NOT fidoconf_VERSION)
  include(fidoconf)
endif()
if (NOT smapi_VERSION)
  include(smapi)
endif()
if (NOT areafix_VERSION)
  include(areafix)
endif()

if (NOT hptzip_VERSION AND HPTZIP)
  include(hptzip)
endif()

ADD_EXECUTABLE(htick
  htick/src/add_desc.c
  htick/src/clean.c
  htick/src/fcommon.c
  htick/src/filecase.c
  htick/src/filelist.c
  htick/src/global.c
  htick/src/hatch.c
  htick/src/htickafix.c
  htick/src/htick.c
  htick/src/report.c
  htick/src/scan.c
  htick/src/seenby.c
  htick/src/toss.c
)
target_link_libraries(htick husky fidoconfig smapi areafix)
target_include_directories(htick PRIVATE htick/h huskylib fidoconf areafix smapi)

if (HPTZIP)
  target_include_directories(htick PRIVATE hptzip)
  target_link_libraries(htick hptzip ${ZLIB_LIBRARIES})
endif()

if (NOT MSVC)
  INSTALL(TARGETS htick
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
endif (NOT MSVC)
