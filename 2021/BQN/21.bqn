#!/usr/bin/env bqn
⟨RB, B10, Num, Ints, SInts, Split⟩ ← •Import "../../utils/utils.bqn"
l ← 1⊑⟜Ints¨•FLines ≠◶"21.in"‿⊑ •args

p ← l
sc ← 0‿0
d ← 1‿2‿3
i ← {sc ↩ (sc+p↩(1+10|¯1+p++´d)⊣⌾((2|𝕩)⊸⊑) p) ⊣⌾((2|𝕩)⊸⊑) sc ⋄ d↩1+100|¯1+ 3+d ⋄ 𝕩+1}•_while_{𝕊:¬∨´sc≥1000}0
•Show (⌊´sc)×3×i

p ↩ ⋈˜10‿21⥊0
s1‿s2 ← l-1
p{i‿n𝕊𝕩: 1⌾(n‿0⊑i⊑⊢) 𝕩}´↩ ⟨0‿s1⋄1‿s2⟩
distr ← ≠¨⊔∧⥊+⌜´3⥊<1+↕3
w ← 0‿0
Step ← {𝕊:
  c ← (2|𝕩  )⊑p
  o ← (2|𝕩+1)⊑p
  oam ← +´⥊o
  n ← ((1+↕∘≠){(𝕨⥊0)∾𝕩∾(0⥊˜10-𝕨)}˘⊢) +´ distr {𝕨×𝕩⌽c}¨ -↕≠distr
  w ↩ (oam × +´⥊10‿¯10↑n)⊸+⌾((2|𝕩)⊸⊑) w
  p (10‿21↑n)⌾((2|𝕩)⊸⊑)↩
  𝕩+1
}
Step•_while_{𝕊:¬∧´∧´∘⥊¨0=p} 0
•Show ⌈´w
