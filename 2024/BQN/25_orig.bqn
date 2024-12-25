#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
d‿u ← '#'={⋈⁼⍷'#'=⊏𝕩}¨⊸⊔ >¨ ⟨⟩SplitF •FLines 2024‿25 Input •args

•Show +´⥊∧´¨7≥+⌜´+˝¨¨d‿u