#!/usr/bin/env bqn
c ← •FChars ≠◶"15.in"‿⊑ •args

cc ← ',' = c # commas
cs ← cc ∨ (∊⟜"=-" ∨ '0'⊸≤ ∧ ≤⟜'9') c # non-key character
ce ← 1«cc # end of an entry
el ← -⟜»/cc∾1 # entry lengths

ca ← c-@
ic ← ↕≠c
ht ← {256|17×𝕩}⍟(↕⌈´el) 1
ht •internal.Squeeze¨↩ # 610us → 400us; TODO don't
_hashTil ← { b 𝔽 _𝕣 m:
  rm ← ⌽m
  hm ← (⌽ ic - ⌈` (ic×rm) - ¬rm)⊏ht
  {𝕩 - ⌈`𝕩×b} +` 𝔽 256 | ca × hm × ¬m
}

•Show +´ 256 | ce × cc ⊢_hashTil cc

vs ← ce/c            # values
vd ← '-'=vs          # is value deleted here
kn ← ⊐ (cs-˜ cs¬⊸× +`cs∧¬»cs) ⊔ c # keys as unique numbers
lo ← ∊⌾⌽kn           # last occurence mask
fv ← ('0'-˜lo/vs)⌾((lo/kn)⊸⊏) ¯2⥊˜1+⌈´kn # map of key to final value
ld ← ¬kn∊(lo∧vd)/kn  # entries whose last operation is deletion
kn‿vd ld⊸/¨↩         # filter those out
pm ← ⊒⌾⌽ kn          # progressive counter
pl ← {               # progressive counter of last deletion
  c ← /⁼ kn
  s ← (1+↕≠c) ∾ vd×kn+1
  t ← 1 ↓ s ⍋⊸⊏○((∊⌾⌽s)⊸/) c∾pm
}
wi ← ⍉[kn,   pm]     # reference index
ti ← ⍉[↕≠pl, pl-1]   # target reference index - first entry after last deletion
tm ← wi∊ti           # mask of entries at the target
cb ← ≠⟜» /tm/ld/el   # beginning of included in partially-filtered hash list
fhs ← 256 | (1«cb) / cb (el/(≠el)↑/⁼tm//ld)⊸/ _hashTil cs # final filtered hashes
fvs ← (tm/kn) ⊏ fv   # final filtered values
fvs×↩ 1 + ⊒fhs       # multiply values by their index in their bucket
•Show +´ fvs × 1+fhs # multiply by bucket number, sum