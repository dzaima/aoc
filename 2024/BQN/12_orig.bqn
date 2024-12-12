#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿12 Input •args

v←0¨l
s1←0
s2←0
{
  𝕩⊑v?1;
  lc ← 𝕩⊑l
  c ← 1⌾(𝕩⊸⊑) 0¨l
  {
    ps ← (lc=⊑⟜l)¨⊸/ (¬⊑⟜c)¨⊸/ (∧´≥⟜0∧<⟜(≠l))¨⊸/ ⥊𝕩 +⌜ ⟨¯1‿0,1‿0,0‿1,0‿¯1⟩
    c 1¨⌾(ps⊸⊑)↩
    ⍷ps
  }•_while_(×≠) ⋈𝕩
  a←+´⥊c
  b←+´+´∘⥊¨ {c∧¬𝕩}¨ {⟨«˘𝕩,»˘𝕩,»𝕩,«𝕩⟩}c
  b2←+´+´∘⥊¨ ⟨«,»,»˘,«˘⟩ {𝕩∧¬𝕎𝕩}¨ {c∧¬𝕩}¨ {⟨«˘𝕩,»˘𝕩,»𝕩,«𝕩⟩}c # originally this was b↩, and s1 was live-repurposed
  s1+↩a×b
  s2+↩a×b2
  v∨↩c
}¨ ↕≢l
# •Show¨ {⊏⟜"·#" 𝕩=l}¨ ⍷⥊l
•Show s1
•Show s2