#!/usr/bin/env bqn
⟨SplitF, Ints⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩SPlitF •FLines ≠◶"5.in"‿⊑ •args

s ← Ints⊑⊑l

l ↩ Ints¨¨1↓¨1↓l

# dst;src;len

#•Show s
#•Show ≍˘l

•Show ⌊´s {
  𝕨 + +˝˘𝕨 {
    d‿s‿l←𝕩
    (d-s) × (𝕨≥s) ∧ 𝕨<s+l
  }⌜ 𝕩
}˜´⌽ l

# incl/excl
•Show ⌊´⊑(<˘⍉+`˘∘‿2⥊s) {
  vs‿ve ← 𝕨
  # •Show "s"‿"e"∾˘vs≍ve
  [d,s,l] ← ⍉>𝕩
  ak ← ⍷∧vs∾ve∾s∾(s+l)#∾(90+↕10)∾48+↕10
  us ← ak⍋s-1
  ue ← ak⍋s+l-1
  #•Show (d-s)∾us≍ue
  ds ← d-s
  tr ← +`(-ds)⊸+⌾(ue⊸⊏) ds⌾(us⊸⊏) 0¨ak
  # •Show ak≍tr
  ms←ak⍋vs-1 ⋄ #•Show vs≍ms
  me←ak⍋ve-1 ⋄ #•Show ve≍me
  (⊑¨⋈1⊑¨⊢) ∾{
    a‿b:
    (a↓b↑tr) + <˘2↕a↓(b+1)↑ak
  }¨ <˘⍉>ms≍me
  
  #!0
}˜´⌽ l