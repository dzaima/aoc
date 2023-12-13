#!/usr/bin/env cbqn
⟨Num, SplitF⟩ ← •Import "../../utils/utils.bqn"
cards ← Num¨¨ 1↓¨ ⟨⟩ SplitF •FLines ≠◶"22.in"‿⊑ •args

P1 ← {
  c ← ⊑¨𝕩
  w ← <´c
  ∾⟜(⌽⍟w c)⌾(w⊸⊑) 1↓¨ 𝕩
}

Score ← {+´ (⌽×1+↕∘≠) ∾𝕩}

•Show Score P1•_while_{∧´0<≠¨𝕩} cards

Round ← {
  c ← ⊑¨ 𝕩
  w←{
    ∧´c<≠¨𝕩? # recurse
      <´ ≠¨ Game c↑¨ 1↓¨𝕩
    ; # don't recurse
      <´ c
  }𝕩
  ∾⟜(⌽⍟w c)⌾(w⊸⊑) 1↓¨ 𝕩
}

# Hash ← ⊢ ⋄ In ← {𝕨⊸≡¨ 𝕩}
Hash ← 1e9⊸×⊸+´•Hash ⋄ In ← = # TODO hashmap

ent ← •MonoTime@
enn ← 0

Game ← Hash⊸{
  p ← ⋈𝕨
  r ← {
    n ← Round 𝕩
    nh ← Hash n
    ¬∨´nh In p? # not encountered yet
      p∾↩ <nh
      n
    ; # encountered before
      ⟨⟨1⟩,⟨⟩⟩
  }•_while_{∧´0<≠¨𝕩} 𝕩
  r
}
•Show Score Game cards