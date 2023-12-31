; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

declare <32 x i8> @llvm.loongarch.lasx.xvssran.b.h(<16 x i16>, <16 x i16>)

define <32 x i8> @lasx_xvssran_b_h(<16 x i16> %va, <16 x i16> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_b_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.b.h $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvssran.b.h(<16 x i16> %va, <16 x i16> %vb)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvssran.h.w(<8 x i32>, <8 x i32>)

define <16 x i16> @lasx_xvssran_h_w(<8 x i32> %va, <8 x i32> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_h_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.h.w $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvssran.h.w(<8 x i32> %va, <8 x i32> %vb)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvssran.w.d(<4 x i64>, <4 x i64>)

define <8 x i32> @lasx_xvssran_w_d(<4 x i64> %va, <4 x i64> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_w_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.w.d $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvssran.w.d(<4 x i64> %va, <4 x i64> %vb)
  ret <8 x i32> %res
}

declare <32 x i8> @llvm.loongarch.lasx.xvssran.bu.h(<16 x i16>, <16 x i16>)

define <32 x i8> @lasx_xvssran_bu_h(<16 x i16> %va, <16 x i16> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_bu_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.bu.h $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvssran.bu.h(<16 x i16> %va, <16 x i16> %vb)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvssran.hu.w(<8 x i32>, <8 x i32>)

define <16 x i16> @lasx_xvssran_hu_w(<8 x i32> %va, <8 x i32> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_hu_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.hu.w $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvssran.hu.w(<8 x i32> %va, <8 x i32> %vb)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvssran.wu.d(<4 x i64>, <4 x i64>)

define <8 x i32> @lasx_xvssran_wu_d(<4 x i64> %va, <4 x i64> %vb) nounwind {
; CHECK-LABEL: lasx_xvssran_wu_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvssran.wu.d $xr0, $xr0, $xr1
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvssran.wu.d(<4 x i64> %va, <4 x i64> %vb)
  ret <8 x i32> %res
}
