; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -mtriple=sparcv9-unknown-linux -verify-machineinstrs -stop-after=finalize-isel < %s | FileCheck %s

; Check that the fp128 load/store is correctly split.
; The pointer metadata for the upper/lower halves of the load/store should be in
; sync with the OP address.

define fp128 @testcase(fp128 %0) {
  ; CHECK-LABEL: name: testcase
  ; CHECK: bb.0.Entry:
  ; CHECK:   liveins: $q0
  ; CHECK:   [[COPY:%[0-9]+]]:qfpregs = COPY $q0
  ; CHECK:   [[COPY1:%[0-9]+]]:dfpregs = COPY [[COPY]].sub_odd64
  ; CHECK:   [[ADDri:%[0-9]+]]:i64regs = ADDri %stack.0, 0
  ; CHECK:   [[ORXri:%[0-9]+]]:i64regs = ORXri killed [[ADDri]], 8
  ; CHECK:   STDFrr [[ORXri]], $g0, killed [[COPY1]] :: (store (s64) into %stack.0 + 8)
  ; CHECK:   [[COPY2:%[0-9]+]]:dfpregs = COPY [[COPY]].sub_even64
  ; CHECK:   STDFri %stack.0, 0, killed [[COPY2]] :: (store (s64) into %stack.0, align 16)
  ; CHECK:   [[LDXrr:%[0-9]+]]:i64regs = LDXrr [[ORXri]], $g0 :: (load (s64) from %stack.0 + 8)
  ; CHECK:   [[LDXri:%[0-9]+]]:i64regs = LDXri %stack.0, 0 :: (load (s64) from %stack.0, align 16)
  ; CHECK:   [[COPY3:%[0-9]+]]:intregs = COPY [[LDXrr]]
  ; CHECK:   [[COPY4:%[0-9]+]]:intregs = COPY [[LDXri]]
  ; CHECK:   [[SRLXri:%[0-9]+]]:i64regs = SRLXri [[LDXrr]], 32
  ; CHECK:   [[COPY5:%[0-9]+]]:intregs = COPY [[SRLXri]]
  ; CHECK:   [[SRLXri1:%[0-9]+]]:i64regs = SRLXri [[LDXri]], 32
  ; CHECK:   [[COPY6:%[0-9]+]]:intregs = COPY [[SRLXri1]]
  ; CHECK:   [[ADDCCri:%[0-9]+]]:intregs = ADDCCri killed [[COPY3]], -1, implicit-def $icc
  ; CHECK:   [[ADDEri:%[0-9]+]]:intregs = ADDEri killed [[COPY5]], -1, implicit-def $icc, implicit $icc
  ; CHECK:   [[ADDEri1:%[0-9]+]]:intregs = ADDEri killed [[COPY4]], -1, implicit-def $icc, implicit $icc
  ; CHECK:   [[ADDEri2:%[0-9]+]]:intregs = ADDEri killed [[COPY6]], -1, implicit-def dead $icc, implicit $icc
  ; CHECK:   [[SRLri:%[0-9]+]]:i64regs = SRLri killed [[ADDCCri]], 0
  ; CHECK:   [[COPY7:%[0-9]+]]:i64regs = COPY [[ADDEri]]
  ; CHECK:   [[SLLXri:%[0-9]+]]:i64regs = SLLXri killed [[COPY7]], 32
  ; CHECK:   [[ORXrr:%[0-9]+]]:i64regs = ORXrr killed [[SLLXri]], killed [[SRLri]]
  ; CHECK:   [[ADDri1:%[0-9]+]]:i64regs = ADDri %stack.1, 0
  ; CHECK:   [[ORXri1:%[0-9]+]]:i64regs = ORXri killed [[ADDri1]], 8
  ; CHECK:   STXrr [[ORXri1]], $g0, killed [[ORXrr]] :: (store (s64) into %stack.1 + 8, basealign 16)
  ; CHECK:   [[SRLri1:%[0-9]+]]:i64regs = SRLri killed [[ADDEri1]], 0
  ; CHECK:   [[COPY8:%[0-9]+]]:i64regs = COPY [[ADDEri2]]
  ; CHECK:   [[SLLXri1:%[0-9]+]]:i64regs = SLLXri killed [[COPY8]], 32
  ; CHECK:   [[ORXrr1:%[0-9]+]]:i64regs = ORXrr killed [[SLLXri1]], killed [[SRLri1]]
  ; CHECK:   STXri %stack.1, 0, killed [[ORXrr1]] :: (store (s64) into %stack.1, align 16)
  ; CHECK:   [[LDDFri:%[0-9]+]]:dfpregs = LDDFri %stack.1, 0 :: (load (s64) from %stack.1, align 16)
  ; CHECK:   [[DEF:%[0-9]+]]:qfpregs = IMPLICIT_DEF
  ; CHECK:   [[INSERT_SUBREG:%[0-9]+]]:qfpregs = INSERT_SUBREG [[DEF]], killed [[LDDFri]], %subreg.sub_even64
  ; CHECK:   [[LDDFrr:%[0-9]+]]:dfpregs = LDDFrr [[ORXri1]], $g0 :: (load (s64) from %stack.1 + 8)
  ; CHECK:   [[INSERT_SUBREG1:%[0-9]+]]:qfpregs = INSERT_SUBREG [[INSERT_SUBREG]], killed [[LDDFrr]], %subreg.sub_odd64
  ; CHECK:   $q0 = COPY [[INSERT_SUBREG1]]
  ; CHECK:   RETL 8, implicit $q0
Entry:
  %1 = bitcast fp128 %0 to i128
  %2 = add i128 %1, -1
  %3 = bitcast i128 %2 to fp128
  ret fp128 %3
}
