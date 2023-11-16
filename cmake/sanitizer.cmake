# You need to build both libc++ and libc++abi with MSan:
# https://github.com/google/sanitizers/wiki/MemorySanitizerLibcxxHowTo
# https://gist.github.com/alepez/ed917c2c884fb5352753e2077be799cd

option(ENABLE_UNDEFINED_BEHAVIOR_SANITIZER "Enable undefined behavior sanitizer support" OFF)
option(ENABLE_ADDRESS_SANITIZER "Enable address sanitizer support" OFF)
option(ENABLE_MEMORY_SANITIZER "Enable memory sanitizer support" OFF)

function(enable_sanitizer)
    if (ENABLE_UNDEFINED_BEHAVIOR_SANITIZER)
        message("ENABLE_UNDEFINED_BEHAVIOR_SANITIZER")
        set(SANITIZER_FLAGS
                -fsanitize=undefined
                -fsanitize=nullability
                -fsanitize=float-divide-by-zero
                -fsanitize=implicit-conversion
                -fsanitize=local-bounds
                )
    elseif (ENABLE_ADDRESS_SANITIZER)
        message("ENABLE_ADDRESS_SANITIZER")

        set(SANITIZER_FLAGS
                -fsanitize=address
                )
    elseif (ENABLE_MEMORY_SANITIZER)
        message("ENABLE_MEMORY_SANITIZER")

        set(SANITIZER_FLAGS
                -fsanitize=memory
                -fsanitize-memory-track-origins
                -fsanitize-ignorelist=${CMAKE_SOURCE_DIR}/.ignorelist.txt
                -fPIE
                -fno-omit-frame-pointer
                -stdlib=libc++
                -I$ENV{LLVM_MSAN}/include
                -I$ENV{LLVM_MSAN}/include/c++/v1
                )

        set(SANITIZER_COMPILE_OPTIONS
                )

        set(SANITIZER_LINK_OPTIONS
                -fuse-ld=lld
                -L$ENV{LLVM_MSAN}/lib
                -lc++abi
                LINKER:-rpath,$ENV{LLVM_MSAN}/lib
                )
    endif ()

    if (SANITIZER_FLAGS)
        if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            add_link_options(${SANITIZER_FLAGS} ${SANITIZER_LINK_OPTIONS})
            add_compile_options(${SANITIZER_FLAGS} ${SANITIZER_COMPILE_OPTIONS})
            message("${CMAKE_EXE_LINKER_FLAGS}")
        else ()
            message(WARNING "clang is not available (compiler: ${CMAKE_CXX_COMPILER_ID})")
        endif ()
    endif ()
endfunction()

enable_sanitizer()