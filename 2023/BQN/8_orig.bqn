#!/usr/bin/env bqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2023‿8 Input •args
s ← 'L'=⊑l

k‿lv‿rv ← <˘⍉> {⟨3↑𝕩, 3↑7↓𝕩, 3↑12↓𝕩⟩}¨ 2↓l
tl ← k •HashMap lv
tr ← k •HashMap rv



Step ← {𝕊:
  (𝕨+1) ⋈ ((((≠s)|𝕨)⊑s)⊑tr‿tl).Get 𝕩
}´
F ← {
  Step•_while_ {'Z'≢2⊑1⊑𝕩} 𝕩
}

•Show ⊑ F 0⋈"AAA"

•Show LCM´ ⊑¨ F¨ 0⋈¨ ('A'=2⊑¨k)/k # I don't think this quite makes sense but annoyingly it gives the right value so