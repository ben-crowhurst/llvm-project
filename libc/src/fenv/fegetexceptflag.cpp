//===-- Implementation of fegetexceptflag function ------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "src/fenv/fegetexceptflag.h"
#include "src/__support/FPUtil/FEnvImpl.h"
#include "src/__support/common.h"

#include <fenv.h>

namespace LIBC_NAMESPACE {

LLVM_LIBC_FUNCTION(int, fegetexceptflag, (fexcept_t * flagp, int excepts)) {
  // TODO: Add a compile time check to see if the excepts actually fit in flagp.
  *flagp = static_cast<fexcept_t>(fputil::test_except(FE_ALL_EXCEPT) & excepts);
  return 0;
}

} // namespace LIBC_NAMESPACE
