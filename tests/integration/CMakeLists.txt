add_catch2_test(integration_test integration_test.cpp)

target_link_libraries(integration_test
        PRIVATE strong_password
        PRIVATE ringbuf
        )

target_valgrind_setup(integration_test)