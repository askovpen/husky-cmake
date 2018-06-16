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
if (NOT hptzip_VERSION)
  include(hptzip)
endif()

ADD_EXECUTABLE(pktinfo
  hpt/src/pktinfo.c
  hpt/src/dupe.c
  hpt/src/pktread.c
  hpt/src/fcommon.c
  hpt/src/global.c
)
ADD_EXECUTABLE(tpkt
  hpt/src/tpkt.c
  hpt/src/dupe.c
  hpt/src/pktread.c
  hpt/src/fcommon.c
  hpt/src/global.c
  hpt/src/pktwrite.c
)
ADD_EXECUTABLE(txt2pkt
  hpt/src/txt2pkt.c
  hpt/src/dupe.c
  hpt/src/pktread.c
  hpt/src/fcommon.c
  hpt/src/global.c
  hpt/src/pktwrite.c
)
ADD_EXECUTABLE(hptlink
  hpt/src/hptlink.c
  hpt/src/global.c
)
ADD_EXECUTABLE(hpttree
  hpt/src/hpttree.c
)
ADD_EXECUTABLE(hpt
  hpt/src/hpt.c
  hpt/src/dupe.c
  hpt/src/pktread.c
  hpt/src/fcommon.c
  hpt/src/global.c
  hpt/src/pktwrite.c
  hpt/src/toss.c
  hpt/src/scan.c
  hpt/src/scanarea.c
  hpt/src/post.c
  hpt/src/hptafix.c
  hpt/src/seenby.c
  hpt/src/link.c
  hpt/src/carbon.c
  ${perl_SRC}
)

target_link_libraries(pktinfo husky fidoconfig smapi)
target_link_libraries(tpkt husky fidoconfig smapi)
target_link_libraries(txt2pkt husky fidoconfig smapi)
target_link_libraries(hptlink husky fidoconfig smapi)
target_link_libraries(hpttree husky fidoconfig smapi)
target_link_libraries(hpt husky fidoconfig smapi areafix ${PERL_LIBRARY})
target_include_directories(pktinfo PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(tpkt PRIVATE hpt/h fidoconf huskylib areafix smapi)
target_include_directories(txt2pkt PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(hptlink PRIVATE hpt/h huskylib fidoconf smapi areafix)
target_include_directories(hpttree PRIVATE hpt/h huskylib smapi fidoconf)
target_include_directories(hpt PRIVATE hpt/h huskylib fidoconf smapi areafix ${PERL_INCLUDE_PATH})
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
