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

ADD_EXECUTABLE(pktinfo
  ${PROJECT_SOURCE_DIR}/hpt/src/pktinfo.c
  ${PROJECT_SOURCE_DIR}/hpt/src/dupe.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktread.c
  ${PROJECT_SOURCE_DIR}/hpt/src/fcommon.c
  ${PROJECT_SOURCE_DIR}/hpt/src/global.c
)
ADD_EXECUTABLE(tpkt
  ${PROJECT_SOURCE_DIR}/hpt/src/tpkt.c
  ${PROJECT_SOURCE_DIR}/hpt/src/dupe.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktread.c
  ${PROJECT_SOURCE_DIR}/hpt/src/fcommon.c
  ${PROJECT_SOURCE_DIR}/hpt/src/global.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktwrite.c
)
ADD_EXECUTABLE(txt2pkt
  ${PROJECT_SOURCE_DIR}/hpt/src/txt2pkt.c
  ${PROJECT_SOURCE_DIR}/hpt/src/dupe.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktread.c
  ${PROJECT_SOURCE_DIR}/hpt/src/fcommon.c
  ${PROJECT_SOURCE_DIR}/hpt/src/global.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktwrite.c
)
ADD_EXECUTABLE(hptlink
  ${PROJECT_SOURCE_DIR}/hpt/src/hptlink.c
  ${PROJECT_SOURCE_DIR}/hpt/src/global.c
)
ADD_EXECUTABLE(hpttree
  ${PROJECT_SOURCE_DIR}/hpt/src/hpttree.c
)
if (${PERLLIBS_FOUND})
  set(per_SRC ${PROJECT_SOURCE_DIR}/hpt/src/perl.c)
endif()
ADD_EXECUTABLE(hpt
  ${PROJECT_SOURCE_DIR}/hpt/src/hpt.c
  ${PROJECT_SOURCE_DIR}/hpt/src/dupe.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktread.c
  ${PROJECT_SOURCE_DIR}/hpt/src/fcommon.c
  ${PROJECT_SOURCE_DIR}/hpt/src/global.c
  ${PROJECT_SOURCE_DIR}/hpt/src/pktwrite.c
  ${PROJECT_SOURCE_DIR}/hpt/src/toss.c
  ${PROJECT_SOURCE_DIR}/hpt/src/scan.c
  ${PROJECT_SOURCE_DIR}/hpt/src/scanarea.c
  ${PROJECT_SOURCE_DIR}/hpt/src/post.c
  ${PROJECT_SOURCE_DIR}/hpt/src/hptafix.c
  ${PROJECT_SOURCE_DIR}/hpt/src/seenby.c
  ${PROJECT_SOURCE_DIR}/hpt/src/link.c
  ${PROJECT_SOURCE_DIR}/hpt/src/carbon.c
  ${perl_SRC}
)

target_link_libraries(pktinfo husky fidoconfig smapi)
target_link_libraries(tpkt husky fidoconfig smapi)
target_link_libraries(txt2pkt husky fidoconfig smapi)
target_link_libraries(hptlink husky fidoconfig smapi)
target_link_libraries(hpttree husky fidoconfig smapi)
target_link_libraries(hpt husky fidoconfig smapi areafix)
target_include_directories(pktinfo PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(tpkt PRIVATE hpt/h fidoconf huskylib areafix smapi)
target_include_directories(txt2pkt PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(hptlink PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(hpttree PRIVATE hpt/h huskylib smapi fidoconf)
target_include_directories(hpt PRIVATE hpt/h huskylib fidoconf smapi areafix)
if (${PERLLIBS_FOUND})
  target_link_libraries(hpt ${PERL_LIBRARY})
  target_include_directories(hpt PRIVATE ${PERL_INCLUDE_PATH})
endif()
if (HPTZIP) 
  target_include_directories(hpt PRIVATE hptzip)
  target_link_libraries(hpt hptzip ${ZLIB_LIBRARIES})
endif()
if (NOT MSVC)
  INSTALL(TARGETS pktinfo hpt tpkt txt2pkt hptlink hpttree
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
  )
endif (NOT MSVC)
