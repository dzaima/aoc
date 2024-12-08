#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿8 Input •args
s←≢l
•Show +´⥊{1¨⌾(𝕩⊸⊑) 0¨l} (∧´≥⟜0∧<⟜s)¨⊸/ ∾{
  (≠⌜˜∘(↕≠) /○⥊ {(2×𝕩)-𝕨}⌜˜) MDSlash 𝕩=l
}¨ '.'⊸≠⊸/ ⍷⥊l
•Show +´⥊{1¨⌾(𝕩⊸⊑) 0¨l} (∧´≥⟜0∧<⟜s)¨⊸/ ∾{
  ∾(≠⌜˜∘(↕≠) /○⥊ {((𝕩⊸×1⊸+)-𝕨×⊢)¨↕⊑s}⌜˜) MDSlash 𝕩=l
}¨ '.'⊸≠⊸/ ⍷⥊l