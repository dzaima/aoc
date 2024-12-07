#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2023‿21 Input •args

nw ← l≠'#' # not wall
ls ← l='S' # start

Step ← {nw∧∨´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}
•Show +´⥊Step⍟64 ls

r0 ← 3     # how many repetitions of input to process
s0 ← ≠l    # initial side length
x ← 1+2×r0 # number of blocks to expand to

# expand input
nw ↩ ∾ x‿x ⥊ <nw
ls ↩ ∾ ls⌾((⌊x‿x÷2)⊸⊑) x‿x⥊ <0¨ls

stgt ← 26501365 # target number of steps
sdone ← (r0×s0) + s0|stgt # steps to actually evaluate
sums ← +´∘⥊¨ {<⎉2 0‿2‿1‿3⍉x‿s0‿x‿s0⥊𝕩} Step⍟sdone ls # run that many steps, sum each block

rep ← (stgt-sdone)÷s0 # number of repetitions still left
rtot ← rep + r0 # total repetitions needed

•Show +´{
  r ← +´⥊ sums = 𝕩
  𝕩 × { # multiply each distinct sum per block by the number of expected such blocks in the total, based on the pattern of how many were encountered in the sample
    r ≡ 1?      1;
    r ≡ r0-1?   rtot-1;
    r ≡ r0?     rtot;
    r ≡ ×˜r0-1? ×˜rtot-1;
    r ≡ ×˜r0?   ×˜rtot;
    ! "unknown count"
  }
}¨ 0⊸≠⊸/ ⍷⥊sums