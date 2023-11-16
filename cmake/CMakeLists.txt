# This must be first, it must enable compile options for everything
include(sanitizer.cmake)

include(coverage.cmake)

include(analysis.cmake)
include(clang-format.cmake)
include(clang-tidy.cmake)
include(catch2.cmake)
include(fmt.cmake)
include(spdlog.cmake)
include(utils.cmake)
include(valgrind.cmake)