#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FChars 2015‿4 Input •args

Sq ← •internal.Squeeze
c¯32 ← 2⋆32
U32 ← Sq -⟜(c¯32×≥⟜(c¯32÷2))
Bits32 ← 32‿1•bit._cast
Add32 ← 32‿1•bit._add

# constants
c¯k ← U32 ⌊c¯32×|•math.Sin 1+↕64
c¯s ← ∾16⊸⥊¨ ⟨7‿12‿17‿22, 5‿ 9‿14‿20, 4‿11‿16‿23, 6‿10‿15‿21⟩

c¯abcd ← U32 1732584193‿4023233417‿2562383102‿271733878
c¯rounds ← {
  fs‿gs ← <˘⍉>⟨
    {𝕊a‿b‿c‿d: d ≠ b ∧ c≠d}‿{𝕊i: i}
    {𝕊a‿b‿c‿d: c ≠ d ∧ b≠c}‿{𝕊i: 16|1+5×i}
    {𝕊a‿b‿c‿d:   b ≠ c ≠ d}‿{𝕊i: 16|5+3×i}
    {𝕊a‿b‿c‿d:  c ≠ b ∨ ¬d}‿{𝕊i: 16|  7×i}
  ⟩
  { 𝕊 i:
    r ← ⌊𝕩÷16
    g ← {𝕏 i} r⊑gs
    ⟨r⊑fs, g, Bits32⋈ i⊑c¯k, -i⊑c¯s⟩
  }¨ ↕64
}

# takes a mask of which bits to check being 0 in the first 32 bits (in a weird order)
MD5P ← {
  n ← ≠𝕩
  lenBits ← 8×≠⊑𝕩
  padLen ← 8+ 32|-8+lenBits
  heads ← 1⍉ n‿∘‿32 ⥊ ∾⟜(padLen↑¯8↑1)˘ 8‿1•bit._cast >𝕩
  headWords ← 32÷˜ lenBits+padLen
  const ← ∘‿32⥊ ¯512 ↑ 64↑ Bits32 ⋈lenBits
  
  a‿b‿c‿d ← (Bits32 n‿1⊸⥊)¨ c¯abcd
  a0 ← a
  
  { F‿g‿k‿ns:
    f ↩ F a‿b‿c‿d
    f ↩ f Add32 a Add32 k Add32 {g<headWords? g⊏heads; g⊏const}
    a ↩ d
    d ↩ c
    c ↩ b
    # rot ← ns ⌽˘ f
    rot ← (ns⌽↕32)⊸⊏˘ "Ai8"•internal.Variation f # hack for the above being even slower in CBQN; TODO don't
    b ↩ b Add32 rot
    @
  }¨ c¯rounds
  r ← a0 Add32 a
  ∨˝˘ 𝕨 ∧⎉1 r
} {1=≠⍷≠¨𝕩? 𝕨𝔽𝕩; 𝕨⊸𝔽¨⌾((⊐≠¨𝕩)⊸⊔) 𝕩}



chunk ← 3000
Min ← { tgt 𝕊 start:
  tgt ↩ 4/tgt-'0'
  found ← @
  {
    m ← tgt MD5P (l∾•Repr)¨ 𝕩
    𝕩{𝕤⋄ found ↩ ⊑m¬⊸/𝕗}⍟¬ ∧´m
    𝕩+chunk
  } •_while_{𝕊: @≡found} start+↕chunk
  found
}

•Show p1 ← "11110100" Min 1
•Show p2 ← "11111100" Min p1

# •Show 1e9× 3000÷˜ 1e3 (4/"11111100"-'0')⊸MD5P•_timed (l∾•Repr)¨ 1e5+↕3000 # nanoseconds per hash bench


# test code for comparing that results are equal for the basic version
# MD5 ← {
#   m ← 8‿1•bit._cast 𝕩
#   m∾↩ ⌽8↑1
#   m∾↩ 0⥊˜512|448-≠m
#   ! (≠𝕩)<2⋆28 # lazy length computation
#   m∾↩ 64↑ Bits32 ⋈8×≠𝕩
#   abcd0 ← Bits32∘⋈¨ c¯abcd
#   {
#     m ← 𝕩
#     a‿b‿c‿d ← abcd0
#     { F‿g‿k‿ns:
#       # •Show '0'+ >a‿b‿c‿d
#       f ↩ F a‿b‿c‿d
#       f ↩ f Add32 a Add32 k Add32 g⊏m
#       a ↩ d
#       d ↩ c
#       c ↩ b
#       b ↩ b Add32 ns ⌽ f
#     }¨ c¯rounds
#     abcd0 Add32¨↩ a‿b‿c‿d
#     @
#   }˘ ∘‿16‿32⥊ m
#   ⥊⌽˘∘‿2⥊ +˝˘(2⋆↕4) ×⎉1 ∘‿4⥊∾abcd0
# }

# { 𝕊:
#   gr ← (l∾•Repr)¨ 10 •rand.Range 100000
#   exp ← (0≠⊑∘MD5)¨ gr
#   got ← (4/"01000000"-'0') MD5P gr
#   gr ! exp ≡ got
# }¨ ↕10000
