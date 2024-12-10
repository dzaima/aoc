#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜>•FLines 2024‿10 Input •args

n ← ≠l
flat ← ⥊l
deltas ← ⟨1, ¯1, n, -n⟩
inbounds ← ⥊¨ {⟨«˘𝕩, »˘𝕩, «𝕩, »𝕩⟩} (1¨ l) ∾ n⥊0
tab ← ⍉> (↕∘≠⊸⋈ /9=flat) { 𝕨 𝕊 ids‿ps:
  m0 ← ps⊸⊏¨ inbounds
  ps2 ← ∾deltas + /⟜ps¨ m0
  m1 ← 𝕨=ps2⊏flat
  ⟨
    m1/ ∾ /⟜ids¨ m0,
    m1/ ps2
  ⟩
}´ ↕9

•Show ≠⍷tab
•Show ≠tab
