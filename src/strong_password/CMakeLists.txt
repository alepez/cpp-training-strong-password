add_library(strong_password
        strong_password.cpp
        strong_password.hpp
        )

# Be super-pedantic on compiler warnings
target_compile_options(strong_password
        PRIVATE -Wall
        PRIVATE -Wpedantic
        PRIVATE -Wextra
        PRIVATE -Werror
        PRIVATE -Wno-unused-parameter
        )

target_include_directories(strong_password
        PUBLIC ${CMAKE_SOURCE_DIR}/src
        )

target_analysis_setup(strong_password)

add_gtest_test(strong_password_test strong_password_test.cpp)
target_link_libraries(strong_password_test PRIVATE strong_password)

target_valgrind_setup(strong_password_test)