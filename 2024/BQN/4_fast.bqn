#!/usr/bin/env bqn
⟨Input,TW, MDSlash⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿4 Input •args

SuperFind ← { p𝕊src:
  cu ← '.'⊸≠⊸/ ⍷∾⥊¨p # unique characters
  
  pk ← ((≠cu) (⊢-+⟜1×=) cu⊸⊐)¨ p     # pattern key: index in cu for each char; ¯1 for '.'
  cw ← pk ⊔○(∾⥊¨) (↕≠pk) ⋈¨¨ ↕∘≢¨ pk # where each character from cu is; list of lists of ⟨pattern index, y‿x⟩
  
  shv ← ↑ ⟨⌈´≠¨p, 1⊑≢src⟩⥊0 # matrices of zeroes to shift in
  
  rm ← 1¨ pk # result masks
  cu { # for each unique character:
    ri‿ms ← <˘⍉>𝕩     # indices in result, mask shift
    i ← ⊐ms           # indices in unique shifts
    msf ← (∊i)/ms     # the unique shifts
    msy‿msx ← <˘⍉>msf # their y/x
    ri {rm∧⟜𝕩⌾(𝕨⊸⊑)↩⋄1}¨ i⊏(msy⊏shv) «¨ «˘⍟msx 𝕨=src # shift the source compared to the current character, and the masks in rm by it
  }¨ cw
  rm
}

p1 ← ⌽∘⍉⍟(↕4) ≍"XMAS"
p1∾↩ {⌽˘¨⊸∾ ⌽⊸⋈ 𝕩} 4‿4⥊∾∾⟜"...."¨ "XMAS"

p2 ← ⌽∘⍉⍟(↕4) ["M.S",".A.","M.S"]

•Show¨ +´¨ (≠p1)(↑⋈↓) +´∘⥊¨ (p1∾p2) SuperFind l
# running the two parts separately (slightly slower):
# •Show +´ +´∘⥊¨ p1 SuperFind l
# •Show +´ +´∘⥊¨ p2 SuperFind l
