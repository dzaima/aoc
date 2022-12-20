#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "utils.bqn"
l ← 1↓¨ Ints¨ •FLines ≠◶"19.in"‿⊑ •args

Try ← { minsMax‿splitPos𝕊a‿b‿c‿d‿e‿f:
  cs ← ⟨
    a‿0‿0‿0
    b‿0‿0‿0
    c‿d‿0‿0
    e‿0‿f‿0
  ⟩
  cm ← 0<cs
  
  Div ← {•internal.Squeeze (2×minsMax)⌊⌈(0⌈𝕨)÷𝕩}
  
  max ← 0
  # tot←0 ⋄ spli←0
  maxRs ← minsMax⌾(3⊸⊑) ⌈´cs
  Sep ← {⟨⊑𝕩, 4↑1↓𝕩, 5↓𝕩⟩}
  Iter ← {
    0𝕊𝕩:
      # •Out "split at "∾•Repr spli↩≠⊑𝕩
      {¯1 Iter Sep ⋈¨ 𝕩}¨ ⍷ <˘⍉> ∾ ⋈⌾⊑ 𝕩;
      # l ← ⍷ <˘⍉> ∾ ⋈⌾⊑ 𝕩
      # i←0⋄t0←•MonoTime@
      # {
      #   (•MonoTime@) {t0↩𝕨⋄•Show𝕩}⍟(t0<-⟜1) (i+↩1)÷≠l
      #   ¯1 Iter Sep ⋈¨ 𝕩}¨ l;
    𝕨𝕊left‿ms‿rs:
      # •Show ≠⊑ms
      # tot+↩≠⊑ms
      nt ← 1+⌈´¨ ((cm/¨cs)-cm/¨<ms) Div¨¨ cm/¨<rs
      m ← (rs≤maxRs) ∧ nt<<left
      none ← ¬∨´m
      max⌈´↩ (none/3⊑ms) + (none/left)×(none/3⊑rs)
      ¬∧´none?
        (𝕨-1) 𝕊 Sep ∾¨ <˘ ⍉>{
          cm ← 𝕩⊑m
          fdt←cm/𝕩⊑nt
          fms←(<cm)/¨ms
          frs←(<cm)/¨rs
          ∾⟨⟨(cm/left)-fdt⟩, fms + ((<fdt)×frs) -˜⍟(0≠⊣)˜¨ 𝕩⊑cs, 1⊸+⌾(𝕩⊸⊑) frs⟩
        }¨ ↕4
      @;@
  }
  
  splitPos Iter ⟨⟨minsMax⟩, ⋈¨4⥊0, ⋈¨1‿0‿0‿0⟩
  # •Out "tot: "∾(•Repr tot)∾"; avg "∾•Repr tot÷spli
  max
}

•Show +´ (⊢×1+↕∘≠) (24‿4⊸Try)¨ l
•Show ×´32‿12⊸Try¨ (3⌊≠)⊸↑ l