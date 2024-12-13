#include <stdint.h>
#include <stddef.h>

void group_min_i16(int16_t*restrict dest, int16_t*restrict inds, int16_t*restrict vals, size_t count) {
  for (size_t i = 0; i < count; i++) {
    int16_t ind = inds[i];
    int16_t val0 = dest[ind];
    int16_t val1 = vals[i];
    dest[ind] = val0<val1? val0 : val1;
  }
}

void group_sum_i8_i16(int16_t*restrict dest, int16_t*restrict inds, int8_t*restrict vals, size_t count) {
  for (size_t i = 0; i < count; i++) {
    dest[inds[i]]+= vals[i];
  }
}