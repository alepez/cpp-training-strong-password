#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_all.hpp>
#include <fmt/format.h>
#include <strong_password/strong_password.hpp>

using Catch::Matchers::EndsWith;

TEST_CASE("strong password") {
  REQUIRE(example() == 42);
  REQUIRE(0.99999 == Catch::Approx(1));
  REQUIRE_THAT("C++ is magic", EndsWith("magic"));
}

TEST_CASE("strong password, 2") {
  uint32_t n = 42;

  SECTION("this is a section") {
    REQUIRE(fmt::format("{}", n) == "42");
  }

  SECTION("this is another section") {
    REQUIRE(n == Catch::Approx(41.999999));
  }
}
