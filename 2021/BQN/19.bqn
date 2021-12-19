#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "utils.bqn"

l ← {{<˘⍉>SInts¨𝕩}¨ 2↓¨(¯1+`0=≠¨𝕩)⊔𝕩}⟨⟨⟩⟩∾ •FLines ≠◶"19.in"‿⊑ •args

Rots ← {
  RotC←{x‿y:⟨-y⋄x⟩}
  fs←RotC⌾(1‿0‿1⊸/)⍟(↕4) 𝕩
  (∾RotC⌾(0‿1‿1⊸/)⍟(1‿3)¨ fs) ∾ ∾RotC⌾(1‿1‿0⊸/)⍟(↕4)¨ fs
}


scpos ← ⟨0‿0‿0⟩
Correct ← {a𝕊br: # assumes left arg is ground truth, and right arg is unknown
  at ← <˘⍉>a
  bd ← {∾(⍉∘>𝕩⊸-)¨at}¨ br
  d←{+´¬∊𝕩}¨ bd
  11=⌈´d?
    i←⊑d⊐⌈´d
    rel ← -(bdc⊏˜⊑∘⊐⟜(⌈´)) ⊒ bdc←i⊑bd
    scpos∾↩ ⟨rel⟩
    rel+i⊑br
    ;
  @
}

todo ← Rots¨ 1↓l
allDone ← ⟨⟩
{𝕊prevDone:
  newDone ← ⟨⟩
  todo ↩ {𝕊b:
    nv ← @ {a𝕊@:a Correct b; 𝕩}´ prevDone
    nv≢@? newDone∾↩ ⟨nv⟩
          allDone∾↩ ⟨nv⟩
    0;1
  }¨⊸/ todo
  newDone
}•_while_{𝕊:0≠≠todo} 1↑l

•Show +´∊⍉>∾¨<˘⍉>allDone
•Show ⌈´+´¨ ⥊|-⌜˜ scpos
