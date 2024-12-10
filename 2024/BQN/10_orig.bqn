#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜>•FLines 2024‿10 Input •args
Z←{v‿m: x←l=v↩1+v ⋄ v⋈x∧(»m)+(»˘m)+(«m)+«˘m}

zz←0¨l
•Show +´{+´⥊×1⊑Z⍟9 0⋈1⌾(𝕩⊸⊑)zz}¨ MDSlash l=0
•Show +´⥊1⊑Z⍟9 0⋈l=0