#!/usr/bin/env bqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"4.in"‿⊑ •args
l0 ← •BQN"⟩"∾˜"⟨"∾⊑l
bs ← {{>Ints¨1↓𝕩}¨ 𝕩⊔˜⌊6÷˜↕≠𝕩} 1↓l

bo ← l0⊸⊐¨ bs
t ← (⌈˝ ⌊○(⌊´) ⌈˝˘)¨bo
•Show¨ {(l0⊑˜𝕩⊑t) × +´⥊ (𝕩⊑bs)× (𝕩⊑bo)>𝕩⊑t}¨ 0‿¯1⊏⍋t
#•Show¨ (0‿¯1⊏⍋t) ⊏ (t⊏l0) × +´∘⥊¨ bs×bo>t
