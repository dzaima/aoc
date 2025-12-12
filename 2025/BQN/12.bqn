#!/usr/bin/env bqn
⟨SplitF, Ints, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ¯1(↓ ⋈ ⊑) ⟨⟩SplitF •FLines 2025‿12 Input •args

k ← +´¨ '#' = (∾1⊸↓)¨ a
•Show +´ ({(×´𝕨) ≥ +´𝕩×k}´ 2 (↑⋈↓) Ints)¨ b
