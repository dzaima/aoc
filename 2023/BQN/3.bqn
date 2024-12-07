#!/usr/bin/env bqn
⟨MDSlash, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '.'∾˜˘>•FLines 2023‿3 Input •args # adds a column of '.' so that there's always a '.' between adjacent numbers in deshape
ld ← (≥⟜'0'∧≤⟜'9') l
ni ← ¯1+(+`1∾1‿0⍷⊢)⌾⥊⊸× ld
pn ← •ParseFloat¨ ni⊔l

ai ← ⍷ ni /○⥊˜ ∨´∾ (<∾»˘⋈«˘)¨ (<∾»⋈«) ¬ld∨l='.'
•Show +´pn ⊏˜ ¯1⊸≠⊸/ ai

adj ← {¯1⊸≠⊸/⍷⥊(𝕩<⊸+¯1+↕3‿3)⊑ni}¨ MDSlash l='*'

•Show +´ (×´⊏⟜pn)¨ adj/˜2≤≠¨adj