#!/usr/bin/env bqn
⟨Split, _fx_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨ ':'⊸≠⊸/¨ •FLines 2023‿25 Input •args

# original was: plug into graphviz layout=neato, see two clearly separated blobs, take the names of the nodes that connect those

k ← ⊑¨l
v ← 1↓¨l
un ← ⍷k∾∾v
kn ← ↕≠un
vn ← un⊸⊐¨ v ∾ (un -○≠ v)⥊<⟨⟩

vn0 ← vn
vn∾¨↩ (≠kn)↑ (∾vn) ⊔ (≠¨vn)/kn

m ← ⍉⊸∨ (≠un)↑ >(≠un)↑¨/⁼¨ vn0

r ← •MakeRand 38282246 # seeded to have consistent timings
es0 ← > ∾vn⋈¨¨kn
Try ← { 𝕊:
  m ← kn •HashMap ⋈¨ kn
  remap ← kn
  {
    2≥m.Count@?@;
    a‿b:
    a‿b ⊏⟜remap _fx_≢↩
    a≢b?
    remap b⌾(a⊸⊑)↩
    as ← m.Get a
    m.Delete a
    b m.Set as∾m.Get b
    ;@
  }˘ r.Deal∘≠⊸⊏ es0
  
  a‿b ← m.Values@
  {
    3 = +´∧´ a‿b ∊˜¨ <˘ ⍉es0? ≠¨ a‿b;
    @
  }
}

•Show ×´ Try•_while_{@≡𝕩} @