#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜⊑•FLines 2024‿9 Input •args

bn‿en ← <˘⍉> ↑‿2⥊l
bs‿es ← <˘⍉> ∘‿2⥊0∾+`l
bi ← ↕≠bn


fs ← l / (≠l)↑ ⥊ bi≍˘¯1
head‿tail ← ((+` »⊸≥ +`⌾⌽∘¬) fs=¯1) ⊔ fs
•Show {+´ 𝕩 × ↕≠𝕩} (¯1⊸≠⊸/ ⌽tail)⌾((head=¯1)⊸/) head

bs2 ← ⌽{
  n ← 𝕩⊑bn
  𝕩 ≠ i← ⊑1⊐˜ n ≤ 𝕩↑en?
    s ← i⊑es
    en -⟜n⌾(i⊸⊑)↩
    es +⟜n⌾(i⊸⊑)↩
    s
  ; 𝕩⊑bs
}¨ ⌽bi

•Show +´ bi × (2÷˜bn×bn-1) + bn×bs2
