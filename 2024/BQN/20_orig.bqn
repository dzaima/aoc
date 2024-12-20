#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿20 Input •args
nw←l≠'#'
e ← ⋈⁼ MDSlash l='E'

S0 ← {∨´⟨𝕩,»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}
Step ← {nw∧S0 𝕩}
zero ← 0¨l
f0 ← (Step⌾(1⊸⊑) 1⊸+⌾⊑) _fi_(¬e⊑1⊑⊢) 0⋈l='S'
path ← (MDSlash l='S')∾ {⋈⁼ MDSlash 𝕨<𝕩}´¨ <˘ 2↕ (⊢∾<∘Step∘(¯1⊑⊢)) 1⊑¨ f0
Solve ← { 𝕊 k:
  cs ← ∧⍷∾{(⍷·⥊+⌜)´ 𝕩⥊< ⌽¨⊸∾ ⋈⟜- 0‿1}¨ 1↓↕k
  # •Show cs
  # 
  z ← ¯1+(≠path)- ⥊{(𝕩≠≠path) /○⥊ (+´¨|cs) +⎉1 (↕≠path) + 𝕩} (⌽path) ⊐ path +⌜ cs
  # •Show ∧´∘×˘⊸/ ⍉↕∘≠⊸≍ /⁼ 0⌈ z
  # •Show +´≥⟜50 z
  +´≥⟜100 z
}
•Show Solve 3
•Show Solve 21

# very slow part 1 that got me the answer before I managed to write the above:
# {
#   f0 ← (Step⌾(1⊸⊑) 1⊸+⌾⊑) _fi_(¬e⊑1⊑⊢) 0⋈l='S'
#   z ← (⊑¯1⊑f0) - ∾{⟨a‿b,c‿d⟩: ∾{{a‿b: (e⊑Step b)⥊a} (Step⌾(1⊸⊑) 1⊸+⌾⊑) _fx_({(¬∨´⥊𝕩)∨¬e⊑𝕩}1⊑⊢) 1⊸+⌾⊑ {1⌾(𝕩⊸⊑)zero}⌾(1⊸⊑) 𝕩}¨ {a‿b: a⋈¨MDSlash b} S0⌾(1⊸⊑) ⟨c,d∧¬b⟩}¨ <˘ 2↕f0
#   •Show ⍉↕∘≠⊸≍ /⁼ 0⌈z
#   •Show +´z≥100
# }
