#!/usr/bin/env bqn
l ← >'0'-˜•FLines ≠◶"9.in"‿⊑ •args

lp ← (⊢ < (99¨⊏)⊸(»⌊«) ⌊ 99⊸(»˘⌊«˘)) l
•Show +´ 1+lp/○⥊l


Step ← {
  vs‿⟨⟩: ≠vs;
  vs‿ps:
    ps/˜↩ (9≠ps⊑l)∧¬ps∊vs
    ⟨vs∾ps ⋄ {∧´¨(𝕩≥0)∧𝕩<<≢l}⊸/⍷⥊ps+⌜⟨0‿1,1‿0,0‿¯1,¯1‿0⟩⟩
}
•Show ×´ ¯3↑∧⊑¨ Step•_while_=∘{⟨⟩‿⟨𝕩⟩}¨ /○⥊⟜↕⟜≢ lp
