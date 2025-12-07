#!/usr/bin/env bqn
# part 1: 4:40; both: 5:29
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2025‿7 Input •args

s ← ⌽'^'=1↓l

{
  n←0
  s {(n+↩+´m) ⊢ (𝕨¬⊸×𝕩)∨(«∨»)m←𝕨∧𝕩}˝˜ 'S'=⊏l
  •Show n
}
{
  n←0
  s {(n+↩+´m) ⊢ (𝕨¬⊸×𝕩)+(«+»)m←𝕨∧𝕩}˝˜ 'S'=⊏l
  •Show 1+n
}
