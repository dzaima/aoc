#!/usr/bin/env bqn
⟨SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩SplitF •FLines 2024‿25 Input •args

•Show +´ ⥊ ∧´¨ 7 ≥ +⌜´ ({⋈⁼⍷⊏𝕩}¨ ⊔ +˝¨) ('#'=>)¨ l
