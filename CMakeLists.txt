cmake_minimum_required(VERSION 3.12)

project(training_strong_password)

set(CMAKE_CXX_STANDARD 17)

# Needed by clang-tidy
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

enable_testing()

add_subdirectory(cmake)
add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(examples)