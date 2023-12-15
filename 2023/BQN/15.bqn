#!/usr/bin/env bqn
c ← •FChars ≠◶"15.in"‿⊑ •args

cc ← ',' = c
cs ← cc ∨ (∊⟜"=-" ∨ '0'⊸≤ ∧ ≤⟜'9') c

ht ← {256|17×𝕩}⍟(↕⌈´-⟜»/cc∾1) 1
ht •internal.Squeeze¨↩ # 670us → 460us; TODO don't

ic ← ↕≠c
ci ← +`cc
ca ← c-@
HashTil ← { 𝕊m:
  rm ← ⌽m
  hm ← (⌽ ic - ⌈` (ic×rm) - ¬rm)⊏ht
  ca × hm × ¬m
}

•Show +´ {256 | (1«cc) × 𝕩 - ⌈`𝕩×cc} +` 256 | HashTil cc

vs ← (1«cc)/c        # values
vd ← '-'=vs          # is value deleted here
kn ← ⊐ (cs-˜ cs¬⊸× +`cs∧¬»cs) ⊔ c # keys as unique numbers
lm ← ∊⌾⌽kn           # last occurence mask
fv ← ('0'-˜lm/vs)⌾((lm/kn)⊸⊏) ¯2⥊˜1+⌈´kn # map of key to final value
m1 ← ¬kn∊(lm∧vd)/kn  # entries whose last operation is deletion
kn‿vd m1⊸/¨↩         # filter those out
pm ← ⊒⌾⌽ kn          # progressive counter
pl ← {⊑1⊐˜⌽𝕩}¨ kn⊔vd # progressive counter of last deletion
wi ← ⍉[kn,   pm]     # reference index
ti ← ⍉[↕≠pl, pl-1]   # target reference index - first entry after last deletion
tm ← wi∊ti           # mask of entries at the target

fhs ← 256| +´¨ ci ⊐⊸⊔○((ci∊tm//m1)⊸/) HashTil cs # final filtered hashes
fvs ← (tm/kn) ⊏ fv   # final filtered values
fvs×↩ 1 + ⊒fhs       # multiply values by their index in their bucket
•Show +´ fvs × 1+fhs # multiply by bucket number, sum