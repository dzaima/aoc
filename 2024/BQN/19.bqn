#!/usr/bin/env bqn
⟨Split, SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2024‿19 Input •args
a ↩ ','⊸≠⊸/¨ ' 'Split ⊑a

chars ← ⍷∾a
Tree ← {
  ⟨⟩: @;
  more ← (×≠¨)⊸/ 𝕩
  (𝕩-○≠more) ∾ Tree¨ 5 ↑ (chars ⊐ ¯1⊑¨more) ⊔ ¯1↓¨more
}
t←Tree a

ns ← { 𝕊 c:
  n ← 1+chars⊐𝕩
  m ← •HashMap˜ ⟨⟩
  0 m.Set 1
  Get ← {
    @≢r←@m.Get 𝕩? r;
    𝕩⊸m.Set⊸⊢ t {𝕩≥0? @≢tc←(𝕩⊑n)⊑𝕨? ((Get 𝕩) × ⊑tc) + tc 𝕊 𝕩-1; 0} 𝕩-1
  }
  
  Get ≠c
}¨ b

•Show +´ × ns
•Show +´ ns
