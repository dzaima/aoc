#include <stdint.h>
uint8_t table16[] = {
#include "gen/table16.c"
};
#include "gen/1.c"
#include <stdio.h>
#include <time.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

static inline uint64_t nsTime() {
  struct timespec t;
  // timespec_get(&t, TIME_UTC); // doesn't seem to exist on Android
  clock_gettime(CLOCK_REALTIME, &t);
  return (uint64_t)(t.tv_sec*1000000000ll + t.tv_nsec);
}


__attribute__((noinline)) uint64_t part1w(uint8_t* a, uint64_t l) { return part1(a, l); }
__attribute__((noinline)) uint64_t part2w(uint8_t* a, uint64_t l) { return part2(a, l); }

typedef uint64_t (*const Fn)(uint8_t*,uint64_t);

Fn fns[] = {part1w, part2w};

int main(int argc, char* argv[]) {
  int fd = open(argv[1], 0);
  if (fd==-1) { printf("Bad file path\n"); exit(1); }
  uint64_t len = lseek(fd, 0, SEEK_END);
  void* buf = mmap(0, len, 1, 2, fd, 0);
  printf("part 1: %lld\n", (long long) part1w(buf, len));
  printf("part 2: %lld\n", (long long) part2w(buf, len));
  
  uint64_t target_ns = 1e9; // time to spend timing
  
  for (int i = 0; i < 2; i++) {
    Fn f = fns[i];
    uint64_t rep0 = 10;
    
    uint64_t sum = 0;
    uint64_t rep = 0;
    uint64_t sns = nsTime();
    uint64_t pns = sns;
    while (sum < target_ns) {
      // printf("rep0 %ld\n", rep0);
      for (uint64_t j = 0; j < rep0; j++) f(buf, len);
      uint64_t ens = nsTime();
      sum = ens-sns;
      rep+= rep0;
      
      if (ens-pns < target_ns/20) rep0*= 2;
      pns = ens;
    }
    
    printf("part %d: %.1fns\n", i+1, sum*1.0/rep);
  }
}