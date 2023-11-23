#include "ringbuf.hpp"

static size_t fake_size = 0;

ringbuf_Error_t ringbuf_new(ringbuf_t* ringbuf, uint8_t* buf, size_t capacity) {
  return ringbuf_Error_Ok;
}

size_t ringbuf_get_capacity(ringbuf_t* ringbuf) {
  return 32;
}

size_t ringbuf_get_size(ringbuf_t* ringbuf) {
  return fake_size;
}

size_t ringbuf_get_available(ringbuf_t* ringbuf) {
  return 32 - fake_size;
}

ringbuf_Error_t ringbuf_push(ringbuf_t* ringbuf, uint8_t value) {
  if (fake_size == 32) {
    return ringbuf_Error_Full;
  }
  fake_size += 1;
  return ringbuf_Error_Ok;
}

ringbuf_Error_t ringbuf_pop(ringbuf_t* ringbuf, uint8_t* value) {
  if (fake_size == 0) {
    return ringbuf_Error_Empty;
  }

  fake_size -= 1;
  *value = 42;
  return ringbuf_Error_Ok;
}

bool ringbuf_is_full(ringbuf_t* ringbuf) {
  return fake_size == 32;
}

bool ringbuf_is_empty(ringbuf_t* ringbuf) {
  return fake_size == 0;
}
