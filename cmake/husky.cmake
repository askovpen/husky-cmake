set(husky_VERSION 1.9.0)

SET(husky_SOURCES
  huskylib/src/adcase.c
  huskylib/src/calendar.c
  huskylib/src/cmpfname.c
  huskylib/src/crc.c
  huskylib/src/cvtdate.c
  huskylib/src/dirlayer.c
  huskylib/src/fexist.c
  huskylib/src/ffind.c
  huskylib/src/flush.c
  huskylib/src/ftnaddr.c
  huskylib/src/genmsgid.c
  huskylib/src/genverst.c
  huskylib/src/getfree.c
  huskylib/src/ioutil.c
  huskylib/src/locking.c
  huskylib/src/log.c
  huskylib/src/mapfile.c
  huskylib/src/memory.c
  huskylib/src/parsenn.c
  huskylib/src/patmat.c
  huskylib/src/qksort.c
  huskylib/src/recode.c
  huskylib/src/setfsize.c
  huskylib/src/strext.c
  huskylib/src/strftime.c
  huskylib/src/tdelay.c
  huskylib/src/temp.c
#  huskylib/src/tlog.c
  huskylib/src/tree.c
  huskylib/src/version.c
  huskylib/src/xstr.c
)
SET(husky_HEADERS 
  huskylib/huskylib/BCD.h
  huskylib/huskylib/BCO.h
  huskylib/huskylib/BCW.h
  huskylib/huskylib/BEOS5.h
  huskylib/huskylib/BORLANDC.h
  huskylib/huskylib/calendar.h
  huskylib/huskylib/compiler.h
  huskylib/huskylib/crc.h
  huskylib/huskylib/cvtdate.h
  huskylib/huskylib/dirlayer.h
  huskylib/huskylib/DJGPP.h
  huskylib/huskylib/EMX.h
  huskylib/huskylib/fexist.h
  huskylib/huskylib/ffind.h
  huskylib/huskylib/ftnaddr.h
  huskylib/huskylib/HIGHC.h
  huskylib/huskylib/huskyext.h
  huskylib/huskylib/huskylib.h
  huskylib/huskylib/IBMC_OS2.h
  huskylib/huskylib/locking.h
  huskylib/huskylib/log.h
  huskylib/huskylib/memory.h
  huskylib/huskylib/MINGW32.h
  huskylib/huskylib/MSC.h
  huskylib/huskylib/MSVC.h
  huskylib/huskylib/parsenn.h
  huskylib/huskylib/pstdint.h
  huskylib/huskylib/recode.h
  huskylib/huskylib/SASC.h
  huskylib/huskylib/strext.h
  huskylib/huskylib/syslogp.h
  huskylib/huskylib/temp.h
  huskylib/huskylib/tree.h
  huskylib/huskylib/typesize.h
  huskylib/huskylib/UNIX.h
  huskylib/huskylib/unused.h
  huskylib/huskylib/vixie.h
  huskylib/huskylib/WATCOMC.h
  huskylib/huskylib/WCD.h
  huskylib/huskylib/WCO.h
  huskylib/huskylib/WCW.h
  huskylib/huskylib/WCX.h
  huskylib/huskylib/xstr.h
)

ADD_LIBRARY(husky SHARED ${husky_SOURCES} ${husky_HEADERS})
set_target_properties(husky PROPERTIES VERSION ${husky_VERSION})
set_target_properties(husky PROPERTIES PUBLIC_HEADER "${husky_HEADERS}")
ADD_EXECUTABLE(gnmsgid huskylib/src/gnmsgid.c)
target_link_libraries(gnmsgid husky)
target_include_directories(husky PRIVATE huskylib/huskylib)
target_include_directories(husky PRIVATE huskylib)
target_include_directories(gnmsgid PRIVATE huskylib/huskylib)

if (NOT MSVC)
  INSTALL(TARGETS husky gnmsgid
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  PUBLIC_HEADER DESTINATION include/huskylib
)
endif (NOT MSVC)
