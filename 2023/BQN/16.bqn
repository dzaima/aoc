#!/usr/bin/env bqn
l ← >•FLines ≠◶"16.in"‿⊑ •args

data ← {⟨𝕩∊"-\",¬𝕩∊"-/\",𝕩∊"-/"⟩}¨ {⊏⟜".-|\/" ".|-/\"⊐⍉⌽𝕩}⍟(↕4) l # preprocess input to the four rotation
z ← 0¨ l
Step ← {{∨˝¯1‿0‿1⌽˘⍉>𝕩} data {a‿b‿c𝕊𝕩: ⟨»⍉⌽𝕩∧a, »𝕩∧b, »⌽⍉𝕩∧c⟩}¨ 𝕩} # input of down‿right‿up‿left, all ordered such that they go downwards
Run ← {+´⥊∨´ {⌽∘⍉⍟𝕩𝕨}¨⟜↕⟜≠ 1⊑{a‿m‿b: t←Step⍟(1+↕10) b ⋄ m2←m∨´t ⋄ ⟨m≢m2,m2,¯1⊑t⟩}•_while_⊑ ⟨1,4⥊<z,𝕩⟩}
•Show Run ⟨z,⍉⌽1⌾⊑z,z,z⟩
•Show ⌈´⥊ (↕4) {Run 1⌾(0‿𝕩⊑𝕨⊑⊢) 4⥊<z}⌜ ↕≠l