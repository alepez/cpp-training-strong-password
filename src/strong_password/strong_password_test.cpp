#include <catch2/catch_test_macros.hpp>
#include <catch2/matchers/catch_matchers_all.hpp>
#include <strong_password/strong_password.hpp>

using Catch::Matchers::EndsWith;

TEST_CASE("strong password") {
  REQUIRE(example() == 42);
  REQUIRE(0.99999 == Catch::Approx(1));
  REQUIRE_THAT("C++ is magic", EndsWith("magic"));
}
