add_gtest_test(integration_test integration_test.cpp)

target_link_libraries(integration_test
        PRIVATE strong_password
        )

target_valgrind_setup(integration_test)