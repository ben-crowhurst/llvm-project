; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64-unknown-linux-gnu | FileCheck %s

; This used to generate incorrect code because we sign extended
; the undef to undef instead of to 0.

define i1 @test14(i8 %X) {
; CHECK-LABEL: test14:
; CHECK:       // %bb.0:
; CHECK-NEXT:    mov w0, wzr
; CHECK-NEXT:    ret
  %1 = shl i8 -113, %X
  %cmp = icmp slt i8 undef, %1
  ret i1 %cmp
}
