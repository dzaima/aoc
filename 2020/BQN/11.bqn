#!/usr/bin/env bqn
⟨_fx_, Tr, MDSlash⟩ ← •Import "../../utils/utils.bqn"
s ← >'L'=•FLines ≠◶"11.in"‿⊑ •args

_run ← { GetCounts _𝕣 max:
  +´⥊{ 𝕊o:
    c ← GetCounts o
    (s∧c<max) ∧ o∨c=0
  }_fx_≢ 0¨ s
}

•Show {𝕩-˜(⊢+»˘+«˘) (⊢+»+«)𝕩}_run 4
zeroPos ← ⊑/⥊¬s

ns ← { u‿l: # neighbors
  f1 ← (1-u)⊑«‿⊢‿»
  f2 ← (1-l)⊑⟨«˘,⊢,»˘⟩
  y‿x ← (Tr↕≢s) + 𝕩×¨< n-+´¨Tr ∨` (F1 F2)⍟(1↓↕n←⌊´≢s) s
  has ← ∧´(y‿x≥0)∧y‿x<≢s
  (has¬⊸× zeroPos) + has× x + y×1⊑≢s
}¨ ∨´¨∘|⊸/ ⥊¯1+↕3‿3

•Show {+´⊏⟜(⥊𝕩)¨ ns}_run 5
