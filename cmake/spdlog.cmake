Include(FetchContent)

FetchContent_Declare(
        spdlog
        GIT_REPOSITORY git@github.com:gabime/spdlog.git
        GIT_TAG v1.11.0
)

FetchContent_MakeAvailable(spdlog)