#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿4 Input •args

b←(-↕≠l) ⌽˘ {𝕩∾' '¨𝕩}˘ l
c←(↕≠l) ⌽˘ {𝕩∾' '¨𝕩}˘ l

•Show +´{(+´·⥊"XMAS"⊸⍷) 𝕩}¨ ⟨⌽∘⍉⍟(↕4) l⟩⊑⊸∾ ⍉¨ ⌽¨⊸∾ ⟨b, c⟩
•Show +´{+´⥊ ∧´ {𝕩↑˜¨<⌊´≢¨𝕩} (2==)¨⊸/⥊ ["M.S",".A.","M.S"] {'.'𝕊𝕩:1; 𝕨=𝕩}¨ ↓⟜𝕩¨ ↕3‿3}¨ ⌽∘⍉⍟(↕4) l