#!/usr/bin/env bqn
⟨_fx_, MDSlash⟩ ← •Import "../../utils/utils.bqn"
m ← >•FLines ≠◶"10.in"‿⊑ •args

l ← m∊"-J7S"
r ← m∊"-FLS"
u ← m∊"|LJS"
d ← m∊"|F7S"

l∧↩ »˘r
r∧↩ «˘l
u∧↩ » d
d∧↩ « u

ludr ← l‿u‿d‿r
delta ← ⟨0‿¯1, ¯1‿0, 1‿0, 0‿1⟩
masks ← ⌽≠⟜< ↕4

dist ← ⊑ {m‿i‿p:
  pp←4↓¨p
  ⟨
    {i¨⌾((0=𝕩)⊸/)𝕩}⌾(pp⊸⊑)m,
    i+1,
    ∾pp {(𝕩/masks) (⊣∾𝕨+⊢)¨ 𝕩/delta}¨ (4↑¨p) ∧ <˘pp⊑⌜ludr
  ⟩
}_fx_(≢○⊑) ⟨0¨ m, 1, 1‿1‿1‿1⊸∾¨ MDSlash m='S'⟩

•Show ¯1 + ⌈´⥊dist

mw ← dist≠0 # mini walls
xw ← {mw‿l‿r‿u‿d: mw ∨´ ⟨»d,«u,»˘r,«˘l⟩} {(∧⌜´ ⥊⟜0‿1‿0¨ 3×≢𝕩) ∧ ⟨<3,<3⟩ / mw×𝕩}¨ mw‿l‿r‿u‿d # expanded walls

f ← {𝕩 ∨´ (¬xw)⊸×¨ ⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}_fx_≢ xw < 1(»˘∨«˘) 1¨∘⊏⊸(»∨«) 0¨ xw # flood fill into expanded space
•Show +´⥊¬ mw ∨ (⥊⟜0‿1‿0¨ ≢f) / f