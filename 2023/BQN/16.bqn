#!/usr/bin/env bqn
⟨_fx_⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines ≠◶"16.in"‿⊑ •args

data ← {⟨𝕩∊"-\",¬𝕩∊"-/\",𝕩∊"-/"⟩}¨ {⊏⟜".-|\/" ".|-/\"⊐⍉⌽𝕩}⍟(↕4) l # preprocess input to the four rotation
z ← 0¨ l
Step ← {𝕩∨{∨˝¯1‿0‿1⌽˘⍉>𝕩} data {a‿b‿c𝕊𝕩: ⟨»⍉⌽𝕩∧a, »𝕩∧b, »⌽⍉𝕩∧c⟩}¨ 𝕩} # input of down‿right‿up‿left, all ordered such that they go downwards
Run ← {+´⥊∨´ {⌽∘⍉⍟𝕩𝕨}¨⟜↕⟜≠ Step _fx_≢ 𝕩}
•Show Run ⟨z,1⌾(0‿¯1⊸⊑)z,z,z⟩
•Show ⌈´⥊ (↕4) {Run 1⌾(0‿𝕩⊑𝕨⊑⊢) 4⥊<z}⌜ ↕≠l
