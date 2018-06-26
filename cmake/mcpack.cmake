  set(CPACK_PACKAGE_VERSION_MAJOR "1")
  set(CPACK_PACKAGE_VERSION_MINOR "9")
  execute_process(COMMAND git log -1 --format=%cd --date=format:%Y%m%d
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE CPACK_PACKAGE_VERSION_PATCH
    ERROR_QUIET)
  string(REGEX REPLACE "\n" "" CPACK_PACKAGE_VERSION_PATCH
    ${CPACK_PACKAGE_VERSION_PATCH})

if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  set(CPACK_GENERATOR ${CPACK_GENERATOR} RPM DEB TGZ)
  set(CPACK_DEBIAN_PACKAGE_MAINTAINER askovpen)
endif()

if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
  set(CPACK_GENERATOR ${CPACK_GENERATOR} 7Z)
endif()