// RUN: llvm-mc -triple=amdgcn -mcpu=bonaire -show-encoding %s | FileCheck %s

s_load_dword s5, s[2:3], s2
// CHECK: [0x02,0x82,0x02,0xc0]

s_load_dword s103, s[2:3], s2
// CHECK: [0x02,0x82,0x33,0xc0]

s_load_dword flat_scratch_lo, s[2:3], s2
// CHECK: [0x02,0x02,0x34,0xc0]

s_load_dword flat_scratch_hi, s[2:3], s2
// CHECK: [0x02,0x82,0x34,0xc0]

s_load_dword vcc_lo, s[2:3], s2
// CHECK: [0x02,0x02,0x35,0xc0]

s_load_dword vcc_hi, s[2:3], s2
// CHECK: [0x02,0x82,0x35,0xc0]

s_load_dword tba_lo, s[2:3], s2
// CHECK: [0x02,0x02,0x36,0xc0]

s_load_dword tba_hi, s[2:3], s2
// CHECK: [0x02,0x82,0x36,0xc0]

s_load_dword tma_lo, s[2:3], s2
// CHECK: [0x02,0x02,0x37,0xc0]

s_load_dword tma_hi, s[2:3], s2
// CHECK: [0x02,0x82,0x37,0xc0]

s_load_dword ttmp11, s[2:3], s2
// CHECK: [0x02,0x82,0x3d,0xc0]

s_load_dword s5, s[4:5], s2
// CHECK: [0x02,0x84,0x02,0xc0]

s_load_dword s5, s[102:103], s2
// CHECK: [0x02,0xe6,0x02,0xc0]

s_load_dword s5, flat_scratch, s2
// CHECK: [0x02,0xe8,0x02,0xc0]

s_load_dword s5, vcc, s2
// CHECK: [0x02,0xea,0x02,0xc0]

s_load_dword s5, tba, s2
// CHECK: [0x02,0xec,0x02,0xc0]

s_load_dword s5, tma, s2
// CHECK: [0x02,0xee,0x02,0xc0]

s_load_dword s5, ttmp[10:11], s2
// CHECK: [0x02,0xfa,0x02,0xc0]

s_load_dword s5, s[2:3], s103
// CHECK: [0x67,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], flat_scratch_lo
// CHECK: [0x68,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], flat_scratch_hi
// CHECK: [0x69,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], vcc_lo
// CHECK: [0x6a,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], vcc_hi
// CHECK: [0x6b,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], tba_lo
// CHECK: [0x6c,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], tba_hi
// CHECK: [0x6d,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], tma_lo
// CHECK: [0x6e,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], tma_hi
// CHECK: [0x6f,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], ttmp11
// CHECK: [0x7b,0x82,0x02,0xc0]

s_load_dword s5, s[2:3], 0xaf123456
// CHECK: [0xff,0x82,0x02,0xc0,0x56,0x34,0x12,0xaf]

s_load_dword s5, s[2:3], 0x3f717273
// CHECK: [0xff,0x82,0x02,0xc0,0x73,0x72,0x71,0x3f]

s_load_dword s5, s[2:3], 0x7f
// CHECK: [0x7f,0x83,0x02,0xc0]

s_load_dwordx2 s[10:11], s[2:3], s2
// CHECK: [0x02,0x02,0x45,0xc0]

s_load_dwordx2 s[12:13], s[2:3], s2
// CHECK: [0x02,0x02,0x46,0xc0]

s_load_dwordx2 s[102:103], s[2:3], s2
// CHECK: [0x02,0x02,0x73,0xc0]

s_load_dwordx2 flat_scratch, s[2:3], s2
// CHECK: [0x02,0x02,0x74,0xc0]

s_load_dwordx2 vcc, s[2:3], s2
// CHECK: [0x02,0x02,0x75,0xc0]

s_load_dwordx2 tba, s[2:3], s2
// CHECK: [0x02,0x02,0x76,0xc0]

s_load_dwordx2 tma, s[2:3], s2
// CHECK: [0x02,0x02,0x77,0xc0]

s_load_dwordx2 ttmp[10:11], s[2:3], s2
// CHECK: [0x02,0x02,0x7d,0xc0]

s_load_dwordx2 s[10:11], s[4:5], s2
// CHECK: [0x02,0x04,0x45,0xc0]

s_load_dwordx2 s[10:11], s[102:103], s2
// CHECK: [0x02,0x66,0x45,0xc0]

s_load_dwordx2 s[10:11], flat_scratch, s2
// CHECK: [0x02,0x68,0x45,0xc0]

s_load_dwordx2 s[10:11], vcc, s2
// CHECK: [0x02,0x6a,0x45,0xc0]

s_load_dwordx2 s[10:11], tba, s2
// CHECK: [0x02,0x6c,0x45,0xc0]

s_load_dwordx2 s[10:11], tma, s2
// CHECK: [0x02,0x6e,0x45,0xc0]

s_load_dwordx2 s[10:11], ttmp[10:11], s2
// CHECK: [0x02,0x7a,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], s103
// CHECK: [0x67,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], flat_scratch_lo
// CHECK: [0x68,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], flat_scratch_hi
// CHECK: [0x69,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], vcc_lo
// CHECK: [0x6a,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], vcc_hi
// CHECK: [0x6b,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], tba_lo
// CHECK: [0x6c,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], tba_hi
// CHECK: [0x6d,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], tma_lo
// CHECK: [0x6e,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], tma_hi
// CHECK: [0x6f,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], ttmp11
// CHECK: [0x7b,0x02,0x45,0xc0]

s_load_dwordx2 s[10:11], s[2:3], 0xaf123456
// CHECK: [0xff,0x02,0x45,0xc0,0x56,0x34,0x12,0xaf]

s_load_dwordx2 s[10:11], s[2:3], 0x3f717273
// CHECK: [0xff,0x02,0x45,0xc0,0x73,0x72,0x71,0x3f]

s_load_dwordx2 s[10:11], s[2:3], 0x7f
// CHECK: [0x7f,0x03,0x45,0xc0]

s_load_dwordx4 s[20:23], s[2:3], s2
// CHECK: [0x02,0x02,0x8a,0xc0]

s_load_dwordx4 s[24:27], s[2:3], s2
// CHECK: [0x02,0x02,0x8c,0xc0]

s_load_dwordx4 s[100:103], s[2:3], s2
// CHECK: [0x02,0x02,0xb2,0xc0]

s_load_dwordx4 ttmp[8:11], s[2:3], s2
// CHECK: [0x02,0x02,0xbc,0xc0]

s_load_dwordx4 s[20:23], s[4:5], s2
// CHECK: [0x02,0x04,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[102:103], s2
// CHECK: [0x02,0x66,0x8a,0xc0]

s_load_dwordx4 s[20:23], flat_scratch, s2
// CHECK: [0x02,0x68,0x8a,0xc0]

s_load_dwordx4 s[20:23], vcc, s2
// CHECK: [0x02,0x6a,0x8a,0xc0]

s_load_dwordx4 s[20:23], tba, s2
// CHECK: [0x02,0x6c,0x8a,0xc0]

s_load_dwordx4 s[20:23], tma, s2
// CHECK: [0x02,0x6e,0x8a,0xc0]

s_load_dwordx4 s[20:23], ttmp[10:11], s2
// CHECK: [0x02,0x7a,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], s103
// CHECK: [0x67,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], flat_scratch_lo
// CHECK: [0x68,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], flat_scratch_hi
// CHECK: [0x69,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], vcc_lo
// CHECK: [0x6a,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], vcc_hi
// CHECK: [0x6b,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], tba_lo
// CHECK: [0x6c,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], tba_hi
// CHECK: [0x6d,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], tma_lo
// CHECK: [0x6e,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], tma_hi
// CHECK: [0x6f,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], ttmp11
// CHECK: [0x7b,0x02,0x8a,0xc0]

s_load_dwordx4 s[20:23], s[2:3], 0xaf123456
// CHECK: [0xff,0x02,0x8a,0xc0,0x56,0x34,0x12,0xaf]

s_load_dwordx4 s[20:23], s[2:3], 0x3f717273
// CHECK: [0xff,0x02,0x8a,0xc0,0x73,0x72,0x71,0x3f]

s_load_dwordx4 s[20:23], s[2:3], 0x7f
// CHECK: [0x7f,0x03,0x8a,0xc0]

s_load_dwordx8 s[20:27], s[2:3], s2
// CHECK: [0x02,0x02,0xca,0xc0]

s_load_dwordx8 s[24:31], s[2:3], s2
// CHECK: [0x02,0x02,0xcc,0xc0]

s_load_dwordx8 s[96:103], s[2:3], s2
// CHECK: [0x02,0x02,0xf0,0xc0]

s_load_dwordx8 ttmp[4:11], s[2:3], s2
// CHECK: [0x02,0x02,0xfa,0xc0]

s_load_dwordx8 s[20:27], s[4:5], s2
// CHECK: [0x02,0x04,0xca,0xc0]

s_load_dwordx8 s[20:27], s[102:103], s2
// CHECK: [0x02,0x66,0xca,0xc0]

s_load_dwordx8 s[20:27], flat_scratch, s2
// CHECK: [0x02,0x68,0xca,0xc0]

s_load_dwordx8 s[20:27], vcc, s2
// CHECK: [0x02,0x6a,0xca,0xc0]

s_load_dwordx8 s[20:27], tba, s2
// CHECK: [0x02,0x6c,0xca,0xc0]

s_load_dwordx8 s[20:27], tma, s2
// CHECK: [0x02,0x6e,0xca,0xc0]

s_load_dwordx8 s[20:27], ttmp[10:11], s2
// CHECK: [0x02,0x7a,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], s103
// CHECK: [0x67,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], flat_scratch_lo
// CHECK: [0x68,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], flat_scratch_hi
// CHECK: [0x69,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], vcc_lo
// CHECK: [0x6a,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], vcc_hi
// CHECK: [0x6b,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], tba_lo
// CHECK: [0x6c,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], tba_hi
// CHECK: [0x6d,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], tma_lo
// CHECK: [0x6e,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], tma_hi
// CHECK: [0x6f,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], ttmp11
// CHECK: [0x7b,0x02,0xca,0xc0]

s_load_dwordx8 s[20:27], s[2:3], 0xaf123456
// CHECK: [0xff,0x02,0xca,0xc0,0x56,0x34,0x12,0xaf]

s_load_dwordx8 s[20:27], s[2:3], 0x3f717273
// CHECK: [0xff,0x02,0xca,0xc0,0x73,0x72,0x71,0x3f]

s_load_dwordx8 s[20:27], s[2:3], 0x7f
// CHECK: [0x7f,0x03,0xca,0xc0]

s_load_dwordx16 s[20:35], s[2:3], s2
// CHECK: [0x02,0x02,0x0a,0xc1]

s_load_dwordx16 s[24:39], s[2:3], s2
// CHECK: [0x02,0x02,0x0c,0xc1]

s_load_dwordx16 s[88:103], s[2:3], s2
// CHECK: [0x02,0x02,0x2c,0xc1]

s_load_dwordx16 s[20:35], s[4:5], s2
// CHECK: [0x02,0x04,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[102:103], s2
// CHECK: [0x02,0x66,0x0a,0xc1]

s_load_dwordx16 s[20:35], flat_scratch, s2
// CHECK: [0x02,0x68,0x0a,0xc1]

s_load_dwordx16 s[20:35], vcc, s2
// CHECK: [0x02,0x6a,0x0a,0xc1]

s_load_dwordx16 s[20:35], tba, s2
// CHECK: [0x02,0x6c,0x0a,0xc1]

s_load_dwordx16 s[20:35], tma, s2
// CHECK: [0x02,0x6e,0x0a,0xc1]

s_load_dwordx16 s[20:35], ttmp[10:11], s2
// CHECK: [0x02,0x7a,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], s103
// CHECK: [0x67,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], flat_scratch_lo
// CHECK: [0x68,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], flat_scratch_hi
// CHECK: [0x69,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], vcc_lo
// CHECK: [0x6a,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], vcc_hi
// CHECK: [0x6b,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], tba_lo
// CHECK: [0x6c,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], tba_hi
// CHECK: [0x6d,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], tma_lo
// CHECK: [0x6e,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], tma_hi
// CHECK: [0x6f,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], ttmp11
// CHECK: [0x7b,0x02,0x0a,0xc1]

s_load_dwordx16 s[20:35], s[2:3], 0xaf123456
// CHECK: [0xff,0x02,0x0a,0xc1,0x56,0x34,0x12,0xaf]

s_load_dwordx16 s[20:35], s[2:3], 0x3f717273
// CHECK: [0xff,0x02,0x0a,0xc1,0x73,0x72,0x71,0x3f]

s_load_dwordx16 s[20:35], s[2:3], 0x7f
// CHECK: [0x7f,0x03,0x0a,0xc1]

s_buffer_load_dword s5, s[4:7], s2
// CHECK: [0x02,0x84,0x02,0xc2]

s_buffer_load_dword s103, s[4:7], s2
// CHECK: [0x02,0x84,0x33,0xc2]

s_buffer_load_dword flat_scratch_lo, s[4:7], s2
// CHECK: [0x02,0x04,0x34,0xc2]

s_buffer_load_dword flat_scratch_hi, s[4:7], s2
// CHECK: [0x02,0x84,0x34,0xc2]

s_buffer_load_dword vcc_lo, s[4:7], s2
// CHECK: [0x02,0x04,0x35,0xc2]

s_buffer_load_dword vcc_hi, s[4:7], s2
// CHECK: [0x02,0x84,0x35,0xc2]

s_buffer_load_dword tba_lo, s[4:7], s2
// CHECK: [0x02,0x04,0x36,0xc2]

s_buffer_load_dword tba_hi, s[4:7], s2
// CHECK: [0x02,0x84,0x36,0xc2]

s_buffer_load_dword tma_lo, s[4:7], s2
// CHECK: [0x02,0x04,0x37,0xc2]

s_buffer_load_dword tma_hi, s[4:7], s2
// CHECK: [0x02,0x84,0x37,0xc2]

s_buffer_load_dword ttmp11, s[4:7], s2
// CHECK: [0x02,0x84,0x3d,0xc2]

s_buffer_load_dword s5, s[8:11], s2
// CHECK: [0x02,0x88,0x02,0xc2]

s_buffer_load_dword s5, s[100:103], s2
// CHECK: [0x02,0xe4,0x02,0xc2]

s_buffer_load_dword s5, ttmp[8:11], s2
// CHECK: [0x02,0xf8,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], s103
// CHECK: [0x67,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], flat_scratch_lo
// CHECK: [0x68,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], flat_scratch_hi
// CHECK: [0x69,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], vcc_lo
// CHECK: [0x6a,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], vcc_hi
// CHECK: [0x6b,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], tba_lo
// CHECK: [0x6c,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], tba_hi
// CHECK: [0x6d,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], tma_lo
// CHECK: [0x6e,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], tma_hi
// CHECK: [0x6f,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], ttmp11
// CHECK: [0x7b,0x84,0x02,0xc2]

s_buffer_load_dword s5, s[4:7], 0xaf123456
// CHECK: [0xff,0x84,0x02,0xc2,0x56,0x34,0x12,0xaf]

s_buffer_load_dword s5, s[4:7], 0x3f717273
// CHECK: [0xff,0x84,0x02,0xc2,0x73,0x72,0x71,0x3f]

s_buffer_load_dword s5, s[4:7], 0x7f
// CHECK: [0x7f,0x85,0x02,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], s2
// CHECK: [0x02,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[12:13], s[4:7], s2
// CHECK: [0x02,0x04,0x46,0xc2]

s_buffer_load_dwordx2 s[102:103], s[4:7], s2
// CHECK: [0x02,0x04,0x73,0xc2]

s_buffer_load_dwordx2 flat_scratch, s[4:7], s2
// CHECK: [0x02,0x04,0x74,0xc2]

s_buffer_load_dwordx2 vcc, s[4:7], s2
// CHECK: [0x02,0x04,0x75,0xc2]

s_buffer_load_dwordx2 tba, s[4:7], s2
// CHECK: [0x02,0x04,0x76,0xc2]

s_buffer_load_dwordx2 tma, s[4:7], s2
// CHECK: [0x02,0x04,0x77,0xc2]

s_buffer_load_dwordx2 ttmp[10:11], s[4:7], s2
// CHECK: [0x02,0x04,0x7d,0xc2]

s_buffer_load_dwordx2 s[10:11], s[8:11], s2
// CHECK: [0x02,0x08,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[100:103], s2
// CHECK: [0x02,0x64,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], ttmp[8:11], s2
// CHECK: [0x02,0x78,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], s103
// CHECK: [0x67,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], flat_scratch_lo
// CHECK: [0x68,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], flat_scratch_hi
// CHECK: [0x69,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], vcc_lo
// CHECK: [0x6a,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], vcc_hi
// CHECK: [0x6b,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], tba_lo
// CHECK: [0x6c,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], tba_hi
// CHECK: [0x6d,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], tma_lo
// CHECK: [0x6e,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], tma_hi
// CHECK: [0x6f,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], ttmp11
// CHECK: [0x7b,0x04,0x45,0xc2]

s_buffer_load_dwordx2 s[10:11], s[4:7], 0xaf123456
// CHECK: [0xff,0x04,0x45,0xc2,0x56,0x34,0x12,0xaf]

s_buffer_load_dwordx2 s[10:11], s[4:7], 0x3f717273
// CHECK: [0xff,0x04,0x45,0xc2,0x73,0x72,0x71,0x3f]

s_buffer_load_dwordx2 s[10:11], s[4:7], 0x7f
// CHECK: [0x7f,0x05,0x45,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], s2
// CHECK: [0x02,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[24:27], s[4:7], s2
// CHECK: [0x02,0x04,0x8c,0xc2]

s_buffer_load_dwordx4 s[100:103], s[4:7], s2
// CHECK: [0x02,0x04,0xb2,0xc2]

s_buffer_load_dwordx4 ttmp[8:11], s[4:7], s2
// CHECK: [0x02,0x04,0xbc,0xc2]

s_buffer_load_dwordx4 s[20:23], s[8:11], s2
// CHECK: [0x02,0x08,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[100:103], s2
// CHECK: [0x02,0x64,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], ttmp[8:11], s2
// CHECK: [0x02,0x78,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], s103
// CHECK: [0x67,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], flat_scratch_lo
// CHECK: [0x68,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], flat_scratch_hi
// CHECK: [0x69,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], vcc_lo
// CHECK: [0x6a,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], vcc_hi
// CHECK: [0x6b,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], tba_lo
// CHECK: [0x6c,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], tba_hi
// CHECK: [0x6d,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], tma_lo
// CHECK: [0x6e,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], tma_hi
// CHECK: [0x6f,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], ttmp11
// CHECK: [0x7b,0x04,0x8a,0xc2]

s_buffer_load_dwordx4 s[20:23], s[4:7], 0xaf123456
// CHECK: [0xff,0x04,0x8a,0xc2,0x56,0x34,0x12,0xaf]

s_buffer_load_dwordx4 s[20:23], s[4:7], 0x3f717273
// CHECK: [0xff,0x04,0x8a,0xc2,0x73,0x72,0x71,0x3f]

s_buffer_load_dwordx4 s[20:23], s[4:7], 0x7f
// CHECK: [0x7f,0x05,0x8a,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], s2
// CHECK: [0x02,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[24:31], s[4:7], s2
// CHECK: [0x02,0x04,0xcc,0xc2]

s_buffer_load_dwordx8 s[96:103], s[4:7], s2
// CHECK: [0x02,0x04,0xf0,0xc2]

s_buffer_load_dwordx8 ttmp[4:11], s[4:7], s2
// CHECK: [0x02,0x04,0xfa,0xc2]

s_buffer_load_dwordx8 s[20:27], s[8:11], s2
// CHECK: [0x02,0x08,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[100:103], s2
// CHECK: [0x02,0x64,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], ttmp[8:11], s2
// CHECK: [0x02,0x78,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], s103
// CHECK: [0x67,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], flat_scratch_lo
// CHECK: [0x68,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], flat_scratch_hi
// CHECK: [0x69,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], vcc_lo
// CHECK: [0x6a,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], vcc_hi
// CHECK: [0x6b,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], tba_lo
// CHECK: [0x6c,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], tba_hi
// CHECK: [0x6d,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], tma_lo
// CHECK: [0x6e,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], tma_hi
// CHECK: [0x6f,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], ttmp11
// CHECK: [0x7b,0x04,0xca,0xc2]

s_buffer_load_dwordx8 s[20:27], s[4:7], 0xaf123456
// CHECK: [0xff,0x04,0xca,0xc2,0x56,0x34,0x12,0xaf]

s_buffer_load_dwordx8 s[20:27], s[4:7], 0x3f717273
// CHECK: [0xff,0x04,0xca,0xc2,0x73,0x72,0x71,0x3f]

s_buffer_load_dwordx8 s[20:27], s[4:7], 0x7f
// CHECK: [0x7f,0x05,0xca,0xc2]

s_buffer_load_dwordx16 s[20:35], s[4:7], s2
// CHECK: [0x02,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[24:39], s[4:7], s2
// CHECK: [0x02,0x04,0x0c,0xc3]

s_buffer_load_dwordx16 s[88:103], s[4:7], s2
// CHECK: [0x02,0x04,0x2c,0xc3]

s_buffer_load_dwordx16 s[20:35], s[8:11], s2
// CHECK: [0x02,0x08,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[100:103], s2
// CHECK: [0x02,0x64,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], ttmp[8:11], s2
// CHECK: [0x02,0x78,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], s103
// CHECK: [0x67,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], flat_scratch_lo
// CHECK: [0x68,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], flat_scratch_hi
// CHECK: [0x69,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], vcc_lo
// CHECK: [0x6a,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], vcc_hi
// CHECK: [0x6b,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], tba_lo
// CHECK: [0x6c,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], tba_hi
// CHECK: [0x6d,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], tma_lo
// CHECK: [0x6e,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], tma_hi
// CHECK: [0x6f,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], ttmp11
// CHECK: [0x7b,0x04,0x0a,0xc3]

s_buffer_load_dwordx16 s[20:35], s[4:7], 0xaf123456
// CHECK: [0xff,0x04,0x0a,0xc3,0x56,0x34,0x12,0xaf]

s_buffer_load_dwordx16 s[20:35], s[4:7], 0x3f717273
// CHECK: [0xff,0x04,0x0a,0xc3,0x73,0x72,0x71,0x3f]

s_buffer_load_dwordx16 s[20:35], s[4:7], 0x7f
// CHECK: [0x7f,0x05,0x0a,0xc3]

s_dcache_inv_vol
// CHECK: [0x00,0x00,0x40,0xc7]

s_memtime s[10:11]
// CHECK: [0x00,0x00,0x85,0xc7]

s_memtime s[12:13]
// CHECK: [0x00,0x00,0x86,0xc7]

s_memtime s[102:103]
// CHECK: [0x00,0x00,0xb3,0xc7]

s_memtime flat_scratch
// CHECK: [0x00,0x00,0xb4,0xc7]

s_memtime vcc
// CHECK: [0x00,0x00,0xb5,0xc7]

s_memtime tba
// CHECK: [0x00,0x00,0xb6,0xc7]

s_memtime tma
// CHECK: [0x00,0x00,0xb7,0xc7]

s_memtime ttmp[10:11]
// CHECK: [0x00,0x00,0xbd,0xc7]

s_dcache_inv
// CHECK: [0x00,0x00,0xc0,0xc7]
