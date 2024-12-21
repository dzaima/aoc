#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2024‿21 Input •args

T0 ← { pt𝕊𝕩:
  br ← ⋈⁼ /∨˝˘ pt=' '
  okm ← '>' ∾ {br=0? 'v'; '^'}
  ∾⟜'A'¨ {
    ∨´0=𝕩?
      ⋈(0⌈𝕩∾-𝕩)/"^<v>";
    𝕨 {(((⊑¨𝕩)∊okm) ∨ (0≠1⊑⊑𝕨) = '<'≠⊑¨𝕩)/𝕩}⍟(∧´ (br=⊑¨𝕨) ∨ 0=1⊑¨𝕨) (∾⋈∾∘⌽) ⊑⊸=⊸⊔ (0⌈𝕩∾-𝕩)/"^<v>"
  }⟜(-´) (≢pt) ReIndex (⥊pt) ⊐ 𝕩
}

T ← { pt𝕊𝕩:
  br ← ⋈⁼ /∨˝˘ pt=' '
  okm ← '>' ∾ {br=0? 'v'; '^'}
  # ks ← MDSlash 𝕨≠' '
  # •Show {{∧´0≠𝕩? 𝕩; @}¨ ks-<𝕩}¨ ks
  ⍷∾𝕨⊸{
    ⋈𝕩
    ∾¨ ∾⟜'A'¨¨ ⥊(<⟨⟩)<⊸∾⌜´ {
      ∨´0=𝕩?
        ⋈(0⌈𝕩∾-𝕩)/"^<v>";
      𝕨 {(((⊑¨𝕩)∊okm) ∨ (0≠1⊑⊑𝕨) = '<'≠⊑¨𝕩)/𝕩}⍟(∧´ (br=⊑¨𝕨) ∨ 0=1⊑¨𝕨) (∾⋈∾∘⌽) ⊑⊸=⊸⊔ (0⌈𝕩∾-𝕩)/"^<v>"
    }⟜(-´)¨ <˘ 2↕(⋈⁼ MDSlash 𝕨='A')<⊸∾ (≢𝕨) ReIndex (⥊𝕨)⊐𝕩
  }¨𝕩
}

p0 ← ["789","456","123"," 0A"]
p ← [" ^A","<v>"]

# •Show p0 T ⋈"029A"
•Show +´{(•ParseFloat 3↑𝕩) × ⌊´≠¨ p⊸T⍟2 p0⊸T ⋈𝕩}¨ l
# •Show {⍷≠¨ p⊸T⍟1 p0⊸T ⋈𝕩}¨ l
# •Show {⍷≠¨ p⊸T⍟2 p0⊸T ⋈𝕩}¨ l

root ← (p0 T ⋈)¨ l
# scv← {•Show p T ⋈𝕩∾"A"}¨ sck←"<>^vA"
# scv ↩ (⊑3⊸⌽)¨ scv
# •Show scv
# C ← (≠sck)↑/⁼
# sct ← >C¨ sck⊸⊐¨ scv
# •Show sct
# •Show {
#   +´(+˝sct×⊢)⍟1 •Show C sck⊐𝕩
# }¨¨ root

sck ← "<>^vA"
scs ← ⋈⌜˜ sck
sct ← {p T0 𝕨⋈𝕩}⌜˜ sck
# •Show scs
# •Show sct
# •Show {+´ (⌊´≠¨)¨ ⊑⟜sct (≢scs) ReIndex (⥊scs) ⊐ <˘ 2↕'A'∾𝕩}¨¨ sct
•Show ⌊´ ⥊{
  sctb ← ((≢sct)⥊𝕩)⊑¨sct # ((¯1⊸⊑∘/⌊´=⊢)¨ {⌊´≠¨ p⊸T⍟2 ⋈𝕩}¨¨ sct)⊑¨ sct
  AA ← {(≢scs)⥊(≠⥊scs) ↑ /⁼ (⥊scs) ⊐ <˘ 2↕'A'∾𝕩}
  sctt ← {AA 𝕩}¨sctb
  # •Show sctt
  +´({•ParseFloat 3↑𝕩}¨ l) × ⌊´¨ {+´⥊ (+´∘⥊sctt×⊢)⍟25 AA 𝕩}¨¨ root
}¨ ↕⥊≠¨ sct
# •Show¨ {⊑⟜sct (≢scs) ReIndex (⥊scs) ⊐ <˘ 2↕'A'∾𝕩}¨¨ 1↑root
