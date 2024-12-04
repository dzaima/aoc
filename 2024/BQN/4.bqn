#!/usr/bin/env bqn
⟨Input,TW⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿4 Input •args

a ← ⌽∘⍉⍟(↕4) l
lp ← l∾˘ ' '¨l
b ← (-↕≠l) ⌽˘ lp
c ← ( ↕≠l) ⌽˘ lp

•Show +´ {+´⥊"XMAS"⍷𝕩}¨ a∾ ⍉¨ ⌽¨⊸∾ b‿c

•Show +´ {+´⥊ ∧´ ⥊ ["M.S",".A.","M.S"] {'.'𝕊𝕩: 1; 𝕨=𝕩}¨ 3‿3 TW 𝕩}¨ a
# some alternatives for part 2:
# •Show +´{+´⥊ ∧´ ⥊ ["M.S",".A.","M.S"] (= ∨ =⟜'.') 3‿3 TW 𝕩}¨ a
# •Show +´{+´⥊ ∧˝∾˝ ["M.S",".A.","M.S"] (= ∨ =⟜'.') (¯2+≢)⊸↕𝕩}¨ a
# •Show +´{+´⥊ ∧´ ⥊ ["M.S",".A.","M.S"] (= ∨ =⟜'.') <⎉2 (2-˜≢)⊸↕𝕩}¨ a
# •Show +´{+´⥊ ∧´⎉1 ⥊⎉2 ["M.S",".A.","M.S"] (=⎉2 ∨ =⟜'.' ⊣⎉2 ⊢) 3‿3↕𝕩}¨ a
