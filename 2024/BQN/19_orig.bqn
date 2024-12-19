#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2024‿19 Input •args
a ↩ ','⊸≠⊸/¨ ' 'Split ⊑a

# •Show a
•Show +´{ 𝕊c:
  # •Show 𝕩
  ⊑(≢c)∊{⍷⥊𝕩 +⎉1 a (≠∘⊣×≠⊸↑≡⊣)⌜ ↓⟜c¨ 𝕩}_fx_≢ ⋈0
}¨ b


•Show +´ { 𝕊 c:
  m←•HashMap˜⟨⟩
  0 m.Set 1
  Get ← {
    @≢r←@m.Get 𝕩? r;
    r ← +´𝕩{𝕩≡(-≠𝕩)↑𝕨↑c? Get 𝕨-≠𝕩; 0}¨ a
    𝕩 m.Set r
    r
  }
  
  Get ≠c
}¨ b