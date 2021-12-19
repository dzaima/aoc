#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "utils.bqn"

l ← {{<˘⍉>SInts¨𝕩}¨ 2↓¨(¯1+`0=≠¨𝕩)⊔𝕩}⟨⟨⟩⟩∾ •FLines ≠◶"19.in"‿⊑ •args

Rots ← {
  RotC←{x‿y:⟨-y⋄x⟩}
  fs←RotC⌾(1‿0‿1⊸/)⍟(↕4) 𝕩
  (∾RotC⌾(0‿1‿1⊸/)⍟(1‿3)¨ fs) ∾ ∾RotC⌾(1‿1‿0⊸/)⍟(↕4)¨ fs
}


scpos ← ⟨0‿0‿0⟩
Correct ← {a𝕊b: # assumes left arg is ground truth, and right arg is unknown
  at ← <˘⍉>a
  br ← Rots b
  bd ← {∾{x‿y‿z: (x⋈¨y)∾¨z}¨𝕩⊸-¨at}¨ br # TODO (x⋈¨y)∾¨z → <˘⍉> when that's fast
  d←{+´¬∊𝕩}¨ bd
  11=⌈´d?
    i←⊑d⊐⌈´d
    rel ← -(bdc⊑˜⊑∘⊐⟜(⌈´)) ⊒ bdc←i⊑bd
    scpos∾↩ ⟨rel⟩
    rel+i⊑br
    ;
  @
}

done ← 1↑l
todo ← 1↓l
{𝕊:
  todo ↩ {𝕊b:
    nv ← @ {a𝕊@:a Correct b; 𝕩}´ done
    nv≢@? done∾↩ ⟨nv⟩
    0;1
  }¨⊸/ todo
}•_while_{𝕊:0≠≠todo}@

•Show +´∊⍉>∾¨<˘⍉>done
•Show ⌈´+´¨ ⥊|-⌜˜ scpos
