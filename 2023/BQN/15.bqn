#!/usr/bin/env bqn
⟨Split⟩ ← •Import "../../utils/utils.bqn"
l ← ','Split •FChars ≠◶"15.in"‿⊑ •args
ht ← {(⌽↑⟜𝕩)¨ ↕≠𝕩} {256|17×𝕩}⍟(↕1+⌈´≠¨l) 17
ht •internal.Squeeze¨↩ # 1.35ms → 1.17ms; TODO don't

H ← {256| +´ ((≠𝕩) ⊑ ht) × 𝕩-@}
•Show +´ H¨ l

vs ← ¯1⊑¨l           # values
vd ← '-'=vs          # is value deleted here
kt ← (vd-2) ↓¨ l     # key text
kn ← ⊐kt             # keys as unique numbers
lm ← ∊⌾⌽kn           # last occurence mask
fv ← ('0'-˜lm/vs)⌾((lm/kn)⊸⊏) ¯2⥊˜1+⌈´kn # map of key to final value
kt‿kn‿vd (¬kn∊(lm∧vd)/kn)⊸/¨↩ # filter out entries whose last operation is deletion
pm ← ⊒⌾⌽ kn          # progressive counter
pl ← {⊑1⊐˜⌽𝕩}¨ kn⊔vd # progressive counter of last deletion
wi ← ⍉[kn,   pm]     # reference index
ti ← ⍉[↕≠pl, pl-1]   # target reference index - first entry after last deletion
tm ← wi∊ti           # mask of entries at the target

MP ← {𝕩 × 1+↕≠𝕩} # multiply by position
•Show +´ ∾ MP MP¨ (H¨ tm/kt) ⊔ (tm/kn)⊏fv # group values by hashes & compute result
