#!/usr/bin/env bqn
⟨Ints, Split⟩ ← •Import "../../utils/utils.bqn"
l ← (Ints⌾(1⊑⊢) ' 'Split⊢)¨ •FLines ≠◶"12.in"‿⊑ •args

Fn ← { 𝕊 l‿i:
  max ← ⌈´i
  in ← ≠i
  i∾↩ ¯1
  n‿s‿o ← ⟨1⟩‿⟨0⟩‿⟨0⟩ # count,streak,offset
  { 𝕊 c:
    r1 ← {⊑c∊"?#"? m←s<o⊏i ⋄ ⟨m/n, 1+m/s, m/o⟩; 3⥊<↕0} # results from '?'/'#'; filters out too-high streaks
    r2 ← {⊑c∊"?."? j←s=o⊏i ⋄ m←j∨s=0 ⋄ ⟨m/n, 0⥊˜+´m, m/o+j⟩; 3⥊<↕0} # results from '?'/'.'
    n‿s‿o ↩ r1∾¨r2 # all results
    64≤≠n?
    u ← ⍉s≍o
    m ← ∊u # deduplicate by streak,offset
    n‿s‿o ↩ ⟨+´¨ (⊐u)⊔n, m/s, m/o⟩ # and sum the counts by the group
    @;@
  }¨ l∾'.'
  +´ (in=o) / n
}

•Show +´ Fn¨ l
•Show +´ Fn∘{l‿i: ⟨¯1↓∾5⥊<l∾'?', ∾5⥊<i⟩}¨ l