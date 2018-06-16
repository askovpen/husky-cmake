if (NOT husky_VERSION)
  include(husky)
endif()

set(fidoconf_VERSION 1.9.0)

SET(fidoconf_SOURCES
  fidoconf/src/afixcmd.c
  fidoconf/src/afixcmn.c
  fidoconf/src/arealist.c
  fidoconf/src/areatree.c
  fidoconf/src/cfg.c
  fidoconf/src/common.c
#src/fc2aed.c
#src/fc2binkd.c
#src/fc2fgate.c
#src/fc2ged.c
#src/fc2msged.c
#src/fc2sq.c
#src/fc2tor.c
#src/fc2tor_g.c
#src/fecfg146.c
#src/fecfg2fc.c
  fidoconf/src/fidoconf.c
  fidoconf/src/findtok.c
  fidoconf/src/grptree.c
  fidoconf/src/line.c
#  src/linked.c
  fidoconf/src/stat.c
#  src/tparser.c
  fidoconf/src/version.c
)
SET(fidoconf_HEADERS
  fidoconf/fidoconf/afixcmd.h
  fidoconf/fidoconf/arealist.h
  fidoconf/fidoconf/areatree.h
  fidoconf/fidoconf/common.h
  fidoconf/fidoconf/fc2tor_g.h
  fidoconf/fidoconf/fecfg146.h
  fidoconf/fidoconf/fidoconf.h
  fidoconf/fidoconf/findtok.h
  fidoconf/fidoconf/grptree.h
  fidoconf/fidoconf/stat.h
  fidoconf/fidoconf/tokens.h
  fidoconf/fidoconf/version.h
)
ADD_LIBRARY(fidoconfig SHARED ${fidoconf_SOURCES})
ADD_EXECUTABLE(fc2binkd fidoconf/src/fc2binkd.c)
ADD_EXECUTABLE(tparser fidoconf/src/tparser.c)
ADD_EXECUTABLE(linked fidoconf/src/linked.c)
ADD_EXECUTABLE(fc2ged fidoconf/src/fc2ged.c)
set_target_properties(fidoconfig PROPERTIES VERSION ${fidoconf_VERSION})
set_target_properties(fidoconfig PROPERTIES PUBLIC_HEADER "${fidoconf_HEADERS}")
target_link_libraries(fidoconfig husky)
target_link_libraries(linked fidoconfig husky)
target_link_libraries(fc2binkd fidoconfig husky)
target_link_libraries(fc2ged fidoconfig husky)
target_link_libraries(tparser fidoconfig husky)
target_include_directories(fidoconfig PRIVATE fidoconf/fidoconf huskylib smapi)
target_include_directories(fc2binkd PRIVATE fidoconf/fidoconf huskylib)
target_include_directories(tparser PRIVATE fidoconf/fidoconf huskylib smapi)
target_include_directories(linked PRIVATE fidoconf/fidoconf huskylib)
target_include_directories(fc2ged PRIVATE fidoconf/fidoconf huskylib)
if (NOT MSVC)
  INSTALL(TARGETS fidoconfig fc2binkd tparser linked fc2ged
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include/fidoconf
  )
endif (NOT MSVC)
