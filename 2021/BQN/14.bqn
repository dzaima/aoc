#!/usr/bin/env cbqn
l ← •FLines ≠◶"14.in"‿⊑ •args
chrs ← (∊⟜('A'+↕26))⊸/ ⍷∾l # unique characters
w ← ≠chrs
s ← chrs⊐⊑l # initial state to its indexes

tp ← chrs⊸⊐¨ 2↑¨ 2↓l # transformation pattern
tn ← chrs⊐¯1⊑¨ 2↓l # transformation new char index
map ← tn⌾(tp⊸⊑) (¯1⥊˜⋈˜w) # map to the new middle char from the pair given as x/y coords

st0 ← (0⥊˜≢map) {1⊸+⌾(𝕨⊸⊑)𝕩}´ <˘2↕s # initial state
k ← (⊔⥊(w×↕≠map) + map) ∾¨ ⊔⥊(↕≠map) +⎉1 w×map # which indexes to sum for this one
s0 ← (w⥊0) {1⊸+⌾(𝕨⊸⊑)𝕩}´ s # initial state char counts
•Show¨ 10‿40{-´¯1‿0⊏∧ s0+(𝕨-1)⊑𝕩}¨ <+`(+´¨(⥊map)⊔⊢)¨ {+´∘⊏⟜𝕩¨ k}⍟(↕40) ⥊st0