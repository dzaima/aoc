#!/usr/bin/env bqn
# part 1: 1:46; both: 3:13
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '@'=>•FLines 2025‿4 Input •args

•Show +´⥊l∧4≥+´⥊⟨⊣,»˘,«˘⟩{𝕎𝕩}⌜ ⟨⊣,»,«⟩{𝕎𝕩}¨ <l

F ← {𝕩∧4≥+´⥊⟨⊣,»˘,«˘⟩{𝕎𝕩}⌜ ⟨⊣,»,«⟩{𝕎𝕩}¨ <𝕩}
•Show +´⥊l∧¬{𝕩∧¬F 𝕩}_fx_≢ l
