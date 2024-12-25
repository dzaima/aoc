#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2024‿24 Input •args

a {¯1⊸↓⌾⊑' 'Split𝕩}¨↩
b {0‿1‿2‿4⊏' 'Split𝕩}¨↩

swaps ← ⟨
  # part 2 done by manually adding entries here until the various prints at the bottom got more uniform
⟩
swapMap ← •HashMap´ <˘⍉∘‿2⥊>(⊢∾⌽¨) swaps

b0 ← b
b {𝕩 swapMap.Get 𝕩}⌾(3⊸⊑)¨↩
# •Show (b0≢¨b)/b0
# •Exit 1

b {∧⌾(0‿2⊸⊏) 𝕩}¨↩
b ∧↩

bm ← (3⊑¨b)•HashMap b

m ← •HashMap´"1"⊸≡¨⌾(1⊸⊑) <˘⍉>a
l ← ⟨⟩
Get ← {
  @≢r←@m.Get 𝕩? r;
  a‿b‿c‿d ← bm.Get 𝕩
  r ← ({"XOR":≠;"OR":∨;"AND":∧}b)´ Get¨ a‿c
  l∾↩<𝕩
  r ⊣ 𝕩 m.Set r
}

•Show +´{𝕩×2⋆↕≠𝕩} Get¨ ∧('z'=⊑¨)⊸/ ⍷3⊑¨b

# {
#   x‿y←<˘2‿∘⥊⊑¨a
#   bm0 ← (⍷0⊑¨b) •HashMap (⊐0⊑¨b)⊔b
#   bm1 ← (⍷2⊑¨b) •HashMap (⊐2⊑¨b)⊔b
#   Uses ← {(@ bm1.Get 𝕩)bm0.Get 𝕩}
#   •Show >{{≡´1↓¨0‿2⊏𝕩}¨ 𝕩}¨ bm0.Get∘•Show¨ x
#   •Show >{𝕩⋈∧⌾(⌽¨)Uses 3⊑𝕩}¨1⊑¨1↓Uses¨ x
# }
# •Show >bm.Get¨ ('z'=⊑¨l)/l
# # pn ← l•HashMap l{⊑(⊑𝕨)∊"xyz"? 𝕨; 'I'∾"000"«˜•Repr 𝕩}¨ ↕≠l
# # •Show >{𝕩pn.Get𝕩}¨¨ bm.Get¨ l

# # •Show >bm.Get¨ l
•Show 1↓∾','∾¨∧∾swaps