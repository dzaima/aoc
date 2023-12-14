#!/usr/bin/env bqn
⟨MDSlash,_fx_⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines ≠◶"14.in"‿⊑ •args
TL ← {m ← ('.'=»𝕩)∧'O'=𝕩 ⋄ (≢𝕩)⥊ 'O'¨⌾((⥊«m)⊸/) '.'¨⌾((⥊m)⊸/) ⥊𝕩}_fx_≢
•Show +´1+⊑¨MDSlash⌽ 'O'=TL l

m←•HashMap˜⟨⟩
i←0
pr←⟨⟩
Q ← {
  r←TL⌾(⌽⍉) TL⌾⌽ TL⌾⍉ TL 𝕩
  pr∾↩<r
  r
}
la ← Q•_while_{𝕊: m.Has 𝕩?0; 𝕩 m.Set i+↩1 ⋄ 1} l

j←m.Get la
n←j+(1+i-j)|1000000000-j
# •Show ⊐pr
# •Show j
# •Show i
# •Show i-j
# •Show n
•Show +´1+⊑¨MDSlash⌽ 'O' = Q⍟n l