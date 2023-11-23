add_library(ringbuf
        ringbuf.cpp
        ringbuf.hpp
)

# Be super-pedantic on compiler warnings
target_compile_options(ringbuf
        PRIVATE -Wall
        PRIVATE -Wpedantic
        PRIVATE -Wextra
        PRIVATE -Werror
        PRIVATE -Wno-unused-parameter
)

target_include_directories(ringbuf
        PUBLIC ${CMAKE_SOURCE_DIR}/src
)

target_link_libraries(ringbuf
        PUBLIC fmt::fmt
        PUBLIC spdlog::spdlog
)

target_analysis_setup(ringbuf)

target_enable_coverage(ringbuf)

add_catch2_test(ringbuf_test ringbuf_test.cpp)
target_link_libraries(ringbuf_test PRIVATE ringbuf)

target_valgrind_setup(ringbuf_test)