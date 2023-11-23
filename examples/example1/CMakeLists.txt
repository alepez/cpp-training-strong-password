add_executable(example1
        main.cpp
        )

target_link_libraries(example1
        PRIVATE fmt::fmt
        PRIVATE spdlog::spdlog
        )
