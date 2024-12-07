#!/usr/bin/env bqn
⟨Ints, SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩SplitF •FLines 2023‿5 Input •args
s ← Ints ⊑⊑l
l ↩ {<˘⍉>Ints¨ 1↓𝕩}¨ 1↓l

•Show ⌊´s { 𝕨 𝕊 d‿s‿l:
  𝕨 + +˝˘ (d-s) ×⎉1 (𝕨 ≥⌜ s) ∧ 𝕨 <⌜ s+l
}˜´⌽ l

# current range set represented by ⟨list of starts ⋄ list of ends (exclusive)⟩
•Show ⌊´⊑ (<˘ +` ⍉ ∘‿2⥊s) { vs‿ve 𝕊 d‿s‿l:
  # vs,ve: start/end of previous sets
  # d,s,l: current mappings, serparated into columns
  ds ← d-s # delta a given mapping applies when matched
  
  ak ← ⍷∧vs∾ve∾s∾s+l # all key points at which values may change
  
  us ← ak⍋s-1   # offset in key where a mapping starts
  ue ← ak⍋s+l-1 # .. and where it ends
  tr ← +` -⟜ds⌾(ue⊸⊏) ds⌾(us⊸⊏) 0¨ ak # delta to apply at each key point; don't need some +´¨w⊔ds thing as, even though intervals can start where another ended, one will never start where another started or end where another ended
  
  rs ← ak⍋vs-1 # offset in key where a previous-range starts
  re ← ak⍋ve-1 # .. and where it ends
  
  mm ← +` rs -○((≠ak)↑/⁼) re # which key-point intervals are in the previous set; last element is always 0
  akns ← tr +  ak # all key point next interval start
  akne ← tr + «ak # ..and end
  ⟨mm/akns, mm/akne⟩ # filter the intervals. Don't bother merging adjacent ones
  
  # alternative less array-y way of computing the result:
  # (<∘⍋⊑)⊸(⊏¨) <˘⍉> ∾ {crs‿cre: (crs↓cre↑tr) + <˘2↕crs↓(cre+1)↑ak}¨ rs ⋈¨ re
}˜´⌽ l