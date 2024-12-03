#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FChars 2024‿3 Input •args

ks ← (-≠l)↑"mul("⍷l  # class 1: start mask (marks the opening paren)
km ← l=','           # class 2: middle separator mask
ke ← l=')'           # class 3: end mask
kn ← ('0'⊸≤∧≤⟜'9') l # class 4: number mask
knc← kn∧»kn          # class 5: number continuation mask
class ← +´ ⟨ks, km, ke, kn, knc⟩ × 1‿2‿3‿4‿1 # class of each character
si ← 1+/ {class {(≠𝕨)↑1‿4‿2‿4‿3⍷𝕨}⌾(𝕩⊸/) 0¨class} 5≠class # find the mul(n,n) pattern under filtering out number continuation chars; returns indices of each first number
mi ← km /⊸(⍋⊏⊣) si # location of corresponding comma for each of the above
ei ← ke /⊸(⍋⊏⊣) si # location of corresponding end for each of the above
n0 ← •ParseFloat¨    si ↓¨ mi↑¨<l # parse the numbers between si and mi
n1 ← •ParseFloat¨ (1+mi)↓¨ ei↑¨<l # parse the numbers between 1+mi and ei
r ← n0×n1 # the multiplications
•Show +´ r

d1 ← / "do()"    ⍷ l     # indices of dos
d0 ← / "don't()" ⍷ l     # indices of don'ts
P ← {(𝕨⍋𝕩) ⊏ ¯1∾𝕨}       # find the index of nearest smaller value in 𝕨 for each in 𝕩 via binary search (¯1 if not yet encountered)
do ← (d1 P mi) ≥ d0 P mi # whether a do is nearer than a don't (≥ to make initial state true)
•Show +´ do / r          # filter by that
