option(ENABLE_COVERAGE "Enable code coverage support" OFF)

function(target_enable_coverage target)
    if (ENABLE_COVERAGE)
        target_compile_options(${target} PUBLIC --coverage)
        target_link_options(${target} PUBLIC --coverage)
    endif ()
endfunction()