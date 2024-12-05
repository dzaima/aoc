#!/usr/bin/env bqn
⟨Ints, SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← Ints¨¨ ⟨⟩SplitF •FLines 2024‿5 Input •args

m ← (1+⌈´∾a) ↑ ⊔´<˘⍉>a

s ← {𝕩⊏˜ ⍋ +´ 𝕩⊸∊¨ 𝕩⊏m}¨ b
(•Show +´)¨ (2∾˜s≢¨b) ⊔ {𝕩⊑˜⌊2÷˜≠𝕩}¨ s
