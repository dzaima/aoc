#!/usr/bin/env bqn
c ← •FChars ≠◶"15.in"‿⊑ •args

cc ← ',' = c       # commas
cs ← cc ∨ (∊⟜"=-" ∨ '0'⊸≤ ∧ ≤⟜'9') c # non-key character
ce ← 1«cc          # end of an entry
el ← (⊢-¯1»⊢)/cc∾1 # entry lengths
ea ← -⟜1⌾⊑ el      # entry allocated length in input (comma goes to the entry following it)

ca ← c-@
ic ← ↕≠c
ht ← {256|17×𝕩}⍟(↕⌈´el) 1
_hashTil ← { b 𝔽 _𝕣 m:
  rm ← ⌽m
  hm ← (⌽ ic - ⌈` (ic×rm) - ¬rm)⊏ht
  {𝕩 - ⌈`𝕩×b} +` 𝔽 256 | ca × hm × ¬m
}

•Show +´ 256 | ce / cc ⊢_hashTil cc

vs ← ce / c          # values
vd ← '-' = vs        # is value deleted here
kn ← ⊐ (((el+vd)>⌜3+↕8) × (/1∾cc)+⌜1+↕8) ⊏ '!'∾c
lo ← ∊⌾⌽ kn          # last occurence mask
fv ← ('0'-˜lo/vs)⌾((lo/kn)⊸⊏) ¯2⥊˜1+⌈´kn # map of key to final value
ld ← ¬kn∊(lo∧vd)/kn  # entries whose last operation is deletion
kn‿vd ld⊸/¨ ↩        # filter those out
pm ← ⊒⌾⌽ kn          # progressive counter
wi ← ⍉[kn,pm]        # reference index for each key
ti ← {               # target reference index - first entry after last deletion
  c ← /⁼ kn                 # fake progressive counter for each unique key for fake deletes
  s ← (1+↕≠c) ∾ vd×1+kn     # a non-zero element n at index i means that, at time i (which can be of a fake delete), key n+1 is deleted
  ⍉¯1 + s ≍○((∊⌾⌽s)⊸/) c∾pm # filter progressive counters to last delete, sort by key
}
tm ← wi∊ti           # mask of entries at the target
cb ← ≠⟜» /tm/ld/ea   # beginning of included in partially-filtered hash list
fhs ← 256 | (1«cb) / cb (ea/(≠ea)↑/⁼tm//ld)⊸/ _hashTil cs # final filtered hashes
fvs ← (tm/kn) ⊏ fv   # final filtered values
fvs×↩ 1 + ⊒fhs       # multiply values by their index in their bucket
•Show +´ fvs × 1+fhs # multiply by bucket number, sum