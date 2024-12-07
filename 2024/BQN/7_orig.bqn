#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿7 Input •args

•Show +´{h←1⊑𝕩⋄ t←⌽2↓𝕩 ⋄ (⊑𝕩)××+´(⊑𝕩)=h {b‿o𝕊a: a o◶+‿× b}´¨ t⊸(⋈¨)¨⥊↕2⥊˜≠t}¨ l
C ← {(𝕨 × 10⋆≠•Repr𝕩) + 𝕩}
•Show +´{h←1⊑𝕩⋄ t←⌽2↓𝕩 ⋄ (⊑𝕩)××+´(⊑𝕩)=h {b‿o𝕊a: a o◶+‿×‿C b}´¨ t⊸(⋈¨)¨⥊↕3⥊˜≠t}¨ l