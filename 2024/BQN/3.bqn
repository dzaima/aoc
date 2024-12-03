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

d1 ← / "do()"    ⍷ l # indices of dos
d0 ← / "don't()" ⍷ l # indices of don'ts
da ← d1∾d0    # all relevant indices
dg ← ⍋da      # grade: indices to sort da by
do ← dg < ≠d1 # mask of dos
prev ← ¯1 + (dg⊏da)⍋mi    # for each number, get nearest index in sorted da
•Show +´(prev ⊏ do∾1) / r # filter by whether that index is of a do(); the start gets index ¯1, which wraps around to the end and hits the ∾1