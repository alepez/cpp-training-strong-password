#include <fmt/format.h>
#include <spdlog/spdlog.h>

#include <iostream>

int main(int argc, const char* argv[]) {
  std::cout << 42 << std::endl;
  fmt::print("{}\n", 42);
  SPDLOG_INFO("{}", 42);
  return 0;
}
