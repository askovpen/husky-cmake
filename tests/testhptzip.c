#include <hptzip/hptzip.h>

int main(int argc, char * argv[]) {
  if(argc <= 1) {
    return 128;
  }
#ifdef WIN32
    if(!strcmp(argv[1], "pack")) {
      return PackWithZlib("test_zip\\arx.zip", "test_zip\\test.txt");
    } else if(!strcmp(argv[1], "unpack")) {
      return UnPackWithZlib("test_zip\\arx.zip", NULL, "test_zip\\unp");
    }
#else
    if(!strcmp(argv[1], "pack")) {
      return PackWithZlib("test_zip/arx.zip", "test_zip/test.txt");
    } else if(!strcmp(argv[1], "unpack")) {
      return UnPackWithZlib("test_zip/arx.zip", NULL, "test_zip/unp");
    }
#endif
  return 0;
}