#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← SInts¨ •FLines 2024‿2 Input •args

•Show +´{∧´(≥⟜1∧≤⟜3)|-˝˘2↕𝕩}¨ (∧⊸≡∨∨⊸≡)¨⊸/ l
# •Show +´{1≥+´¬(≥⟜1∧≤⟜3)|-˝˘2↕𝕩}¨ (∧⊸≡∨∨⊸≡)¨⊸/ l
•Show +´{𝕊a: ∨´{(∧⊸≡∨∨⊸≡) z←𝕩/a? {∧´(≥⟜1∧≤⟜3)|-˝˘2↕𝕩}z;0}¨ ≠⟜<↕≠𝕩}¨ l
