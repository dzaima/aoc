#!/usr/bin/env cbqn
⟨Ints, Split⟩ ← •Import "utils.bqn"
l ← (Ints⌾(1⊑⊢) ' 'Split⊢)¨ •FLines ≠◶"12.in"‿⊑ •args

Fn ← { 𝕊 l‿i:
  max ← ⌈´i
  in ← ≠i
  i∾↩ ¯1
  n‿·‿o ← ⟨1⟩‿⟨0⟩‿⟨0⟩ { n‿s‿o 𝕊 c: # count,streak,offset 𝕊 char
    r1 ← {⊑c∊"?#"? m←s<o⊏i ⋄ ⟨m/n, 1+m/s, m/o⟩; 3⥊<↕0} # results from '?'/'#'; filters out too-high streaks
    r2 ← {⊑c∊"?."? j←s=o⊏i ⋄ m←j∨s=0 ⋄ ⟨m/n, 0⥊˜+´m, m/o+j⟩; 3⥊<↕0} # results from '?'/'.'
    n‿s‿o ↩ r1∾¨r2 # all results
    u ← ⍉s≍o
    m ← ∊u # deduplicate by streak,offset
    ⟨+´¨ (⊐u)⊔n, m/s, m/o⟩ # and sum the counts by the group
  }˜´⌽ l∾'.'
  +´ (in=o) / n
}

•Show +´ Fn¨ l
•Show +´ Fn∘{l‿i: ⟨¯1↓∾5⥊<l∾'?', ∾5⥊<i⟩}¨ l