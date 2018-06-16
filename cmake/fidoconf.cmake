if (NOT husky_VERSION)
  include(husky)
endif()

set(fidoconf_VERSION 1.9.0)

SET(fidoconf_SOURCES
  ${PROJECT_SOURCE_DIR}/fidoconf/src/afixcmd.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/afixcmn.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/arealist.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/areatree.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/cfg.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/common.c
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
  ${PROJECT_SOURCE_DIR}/fidoconf/src/fidoconf.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/findtok.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/grptree.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/line.c
#  src/linked.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/stat.c
#  src/tparser.c
  ${PROJECT_SOURCE_DIR}/fidoconf/src/version.c
)
SET(fidoconf_HEADERS
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/afixcmd.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/arealist.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/areatree.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/common.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/fc2tor_g.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/fecfg146.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/fidoconf.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/findtok.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/grptree.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/stat.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/tokens.h
  ${PROJECT_SOURCE_DIR}/fidoconf/fidoconf/version.h
)
ADD_LIBRARY(fidoconfig SHARED ${fidoconf_SOURCES})
ADD_EXECUTABLE(fc2binkd ${PROJECT_SOURCE_DIR}/fidoconf/src/fc2binkd.c)
ADD_EXECUTABLE(tparser ${PROJECT_SOURCE_DIR}/fidoconf/src/tparser.c)
ADD_EXECUTABLE(linked ${PROJECT_SOURCE_DIR}/fidoconf/src/linked.c)
ADD_EXECUTABLE(fc2ged ${PROJECT_SOURCE_DIR}/fidoconf/src/fc2ged.c)
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
