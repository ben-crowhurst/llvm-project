//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <string>

// float stof(const string& str, size_t *idx = 0);
// float stof(const wstring& str, size_t *idx = 0);

#include <string>
#include <cmath>
#include <cassert>
#include <stdexcept>

#include "test_macros.h"

int main(int, char**) {
  assert(std::stof("0") == 0);
  assert(std::stof("-0") == 0);
  assert(std::stof("-10") == -10);
  assert(std::stof(" 10") == 10);
  {
    std::size_t idx = 0;
    assert(std::stof("10g", &idx) == 10);
    assert(idx == 2);
  }
  {
    std::size_t idx = 0;
    assert(std::stof("INF", &idx) == INFINITY);
    assert(idx == 3);
  }
  {
    std::size_t idx = 0;
    assert(std::isnan(std::stof("NAN", &idx)));
    assert(idx == 3);
  }
#ifndef TEST_HAS_NO_EXCEPTIONS
  {
    std::size_t idx = 0;
    try {
      assert(std::stof("1.e60", &idx) == INFINITY);
      assert(false);
    } catch (const std::out_of_range&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      assert(std::stof("1.e360", &idx) == INFINITY);
      assert(false);
    } catch (const std::out_of_range&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof("", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof("  - 8", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof("a1", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
#endif // TEST_HAS_NO_EXCEPTIONS

#ifndef TEST_HAS_NO_WIDE_CHARACTERS
  assert(std::stof(L"0") == 0);
  assert(std::stof(L"-0") == 0);
  assert(std::stof(L"-10.5") == -10.5);
  assert(std::stof(L" 10") == 10);
  {
    std::size_t idx = 0;
    assert(std::stof(L"10g", &idx) == 10);
    assert(idx == 2);
  }
  {
    std::size_t idx = 0;
    assert(std::stof(L"INF", &idx) == INFINITY);
    assert(idx == 3);
  }
  {
    std::size_t idx = 0;
    assert(std::isnan(std::stof(L"NAN", &idx)));
    assert(idx == 3);
  }
#  ifndef TEST_HAS_NO_EXCEPTIONS
  {
    std::size_t idx = 0;
    try {
      assert(std::stof(L"1.e60", &idx) == INFINITY);
      assert(false);
    } catch (const std::out_of_range&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      assert(std::stof(L"1.e360", &idx) == INFINITY);
      assert(false);
    } catch (const std::out_of_range&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof(L"", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof(L"  - 8", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
  {
    std::size_t idx = 0;
    try {
      (void)std::stof(L"a1", &idx);
      assert(false);
    } catch (const std::invalid_argument&) {
      assert(idx == 0);
    }
  }
#  endif // TEST_HAS_NO_EXCEPTIONS
#endif   // TEST_HAS_NO_WIDE_CHARACTERS

  return 0;
}
