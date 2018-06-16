if (NOT husky_VERSION)
  include(husky)
endif()

set(smapi_VERSION 1.9.0)

SET(smapi_SOURCES
  smapi/src/api_jam.c
  smapi/src/api_sdm.c
  smapi/src/msgapi.c
  smapi/src/sq_area.c
  smapi/src/sq_hash.c
  smapi/src/sq_help.c
  smapi/src/sq_idx.c
  smapi/src/sq_kill.c
  smapi/src/sq_lock.c
  smapi/src/sq_misc.c
  smapi/src/sq_msg.c
  smapi/src/sq_read.c
  smapi/src/sq_uid.c
  smapi/src/sq_write.c
  smapi/src/structrw.c
)

SET(smapi_HEADERS 
  smapi/smapi/api_brow.h
  smapi/smapi/apidebug.h
  smapi/smapi/api_jam.h
  smapi/smapi/api_jamp.h
  smapi/smapi/api_sdm.h
  smapi/smapi/api_sdmp.h
  smapi/smapi/api_sq.h
  smapi/smapi/api_sqp.h
  smapi/smapi/msgapi.h
  smapi/smapi/old_msg.h
)

ADD_LIBRARY(smapi SHARED ${smapi_SOURCES})
set_target_properties(smapi PROPERTIES VERSION ${smapi_VERSION})
set_target_properties(smapi PROPERTIES PUBLIC_HEADER "${smapi_HEADERS}")
target_link_libraries(smapi husky)
target_include_directories(smapi PRIVATE smapi/smapi huskylib)

if (NOT MSVC)
  INSTALL(TARGETS smapi
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include/smapi
  )
endif (NOT MSVC)
