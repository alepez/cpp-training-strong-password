#include "strong_password/strong_password.hpp"

#include <fmt/format.h>
#include <spdlog/spdlog.h>

#include <iostream>

int main(int argc, const char* argv[]) {
  std::cout << example() << std::endl;
  fmt::print("{}\n", example());
  SPDLOG_INFO("{}", example());
  return 0;
}
