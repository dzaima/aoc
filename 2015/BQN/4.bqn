#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FChars 2015‿4 Input •args

c¯32 ← 2⋆32
U32 ← •internal.Squeeze -⟜(c¯32×≥⟜(c¯32÷2))
Add32 ← 32•bit._add
And32 ← 32•bit._and
Or32  ← 32•bit._or
Not32 ← 32•bit._not
Xor32 ← 32•bit._xor

# constants
c¯k ← U32 ⌊c¯32×|•math.Sin 1+↕64
c¯s ← ∾16⊸⥊¨ ⟨7‿12‿17‿22, 5‿9‿14‿20, 4‿11‿16‿23, 6‿10‿15‿21⟩
c¯abcd ← U32 1732584193‿4023233417‿2562383102‿271733878
c¯rounds ← {
  fs‿gs ← <˘⍉>⟨
    {𝕊a‿b‿c‿d: (b And32 ⋈c) Or32 (Not32 ⋈b) And32 d}‿{𝕊i: i}
    {𝕊a‿b‿c‿d: (d And32 ⋈b) Or32 (Not32 ⋈d) And32 c}‿{𝕊i: 16|1+5×i}
    {𝕊a‿b‿c‿d:                   b Xor32 c Xor32 ⋈d}‿{𝕊i: 16|5+3×i}
    {𝕊a‿b‿c‿d:              c Xor32 b Or32 Not32 ⋈d}‿{𝕊i: 16|  7×i}
  ⟩
  { 𝕊 i:
    r ← ⌊𝕩÷16
    g ← {𝕏 i} r⊑gs
    ⟨r⊑fs, g, i⊑c¯k, -i⊑c¯s⟩
  }¨ ↕64
}

MD5 ← {
  m ← 8‿1•bit._cast 𝕩
  m∾↩ ¯8↑1
  m∾↩ 0⥊˜512|448-≠m
  m∾↩ 64↑ 32‿1•bit._cast ⋈8×≠𝕩 # only works for (≠𝕩)<2⋆28 but that's fine
  abcd0 ← c¯abcd
  
  {
    m ← ⥊˘ 1‿32•bit._cast ∘‿32⥊𝕩
    a‿b‿c‿d ← abcd0
    { F‿g‿k‿ns:
      f ↩ F a‿b‿c‿d
      f ↩ f Add32 a Add32 k Add32 g⊏m
      a ↩ d
      d ↩ c
      c ↩ b
      b ↩ ⊑b Add32 1‿32•bit._cast ns ⌽ 32‿1•bit._cast f
    }¨ c¯rounds
    abcd0 Add32↩ a‿b‿c‿d
    @
  }˘ ∘‿16‿32⥊ m
  r ← ⥊⌽˘∘‿2⥊ +˝˘(2⋆↕4) ×⎉1 ∘‿4⥊32‿1•bit._cast abcd0
  # •Show 1↓⥊' '∾˘∘‿8⥊r⊏∾"0A"+⟜↕¨10‿6
  r
}

Min ← {tgt 𝕊 start: 1⊸+ •_while_{tgt > +´∧`0=MD5 l∾•Repr 𝕩} start}

p1 ← 5 Min 1
•Show p1
•Show 6 Min p1