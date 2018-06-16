if (NOT husky_VERSION)
  include(husky)
endif()
if (NOT fidoconf_VERSION)
  include(fidoconf)
endif()
if (NOT smapi_VERSION)
  include(smapi)
endif()

set(areafix_VERSION 1.9.0)

SET(areafix_SOURCES
  areafix/src/afglobal.c
  areafix/src/areafix.c
  areafix/src/callback.c
  areafix/src/query.c
  areafix/src/version.c
)
SET(areafix_HEADERS
  areafix/areafix/afglobal.h
  areafix/areafix/areafix.h
  areafix/areafix/callback.h
  areafix/areafix/query.h
  areafix/areafix/version.h
)

ADD_LIBRARY(areafix SHARED ${areafix_SOURCES})
set_target_properties(areafix PROPERTIES VERSION ${areafix_VERSION})
set_target_properties(areafix PROPERTIES PUBLIC_HEADER "${areafix_HEADERS}")
target_link_libraries(areafix husky fidoconfig smapi)
target_include_directories(areafix PRIVATE areafix/areafix fidoconf huskylib smapi)

if (NOT MSVC)
INSTALL(TARGETS areafix
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  PUBLIC_HEADER DESTINATION include/areafix
)
endif (NOT MSVC)
