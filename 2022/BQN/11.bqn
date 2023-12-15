#!/usr/bin/env bqn
⟨Split, LCM, SplitF, Num, Ints⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩SplitF •FLines ≠◶"11.in"‿⊑ •args

m ← { a‿b‿c‿d‿e‿f:
  id ⇐ ⊑Ints a
  start ⇐ Ints b
  op ← 19↓c
  fn ⇐ {f‿g‿h: F G H} {(⊑"+*"⊐𝕩)⊑+‿×}⌾(1⊸⊑) {"old": ⊢; Num 𝕩}¨⌾(0‿2⊸⊏) ' 'Split op
  test ⇐ Num 21↓d
  throw ⇐ ⟨Num 29↓e, Num 30↓f⟩
  curr ⇐ @ ⋄ _modCurr ⇐ {curr 𝔽↩ 𝕩}
  insp ⇐ @ ⋄ _modInsp ⇐ {insp 𝔽↩ 𝕩}
}¨ l

mod ← LCM´ {𝕩.test}¨ m

_step ← { Calm _𝕣 c:
  +c._modInsp ≠c.curr
  {
    w ← Calm c.Fn 𝕩
    to ← (0≠c.test|w)⊑c.throw
    ∾(to⊑m)._modCurr w
  }¨ (⊢ 𝕩._modCurr ⟨⟩) ⊢ 𝕩.curr
}

_rounds ← {
  {⊢ 𝕩._modInsp 0 ⋄ ⊢ 𝕩._modCurr 𝕩.start}¨ m
  𝔽 _step¨∘m⍟𝕩 @
  ×´2↑∨{𝕩.insp}¨ m
}

•Show {⌊𝕩÷3} _rounds 20
•Show mod⊸| _rounds 10000