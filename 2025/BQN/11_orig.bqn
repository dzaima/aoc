#!/usr/bin/env bqn
# part 1: 3:47; both: 12:27
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {((¯1+⊢×·+`»⊸<)¬𝕩∊": ")⊔𝕩}¨ •FLines 2025‿11 Input •args
a←⊑¨l
b←1↓¨l

m ← a•HashMap b
{
  n ← 0
  {
    n+↩+´1⊑¨("out"⊸≡¨ ⊑¨𝕩) / 𝕩
    {k←⊑¨𝕩 ⋄ (⍷k)⋈¨+´¨(⊐k)⊔1⊑¨𝕩} ·∾{a‿b: b⋈˜¨⟨⟩m.Get a}¨ 𝕩
  }•_while_{×≠𝕩} ⋈"you"‿1
  •Show n
}

n ← 0
{
  n+↩+´{·‿a‿b‿c: c×a∧b}¨ ("out"⊸≡¨ ⊑¨𝕩) / 𝕩
  # {k←⊑¨𝕩 ⋄ (⍷k)⋈¨+´¨(⊐k)⊔1⊑¨𝕩} ·∾{a‿b: b⋈˜¨⟨⟩m.Get a}¨ 𝕩
  {k←3↑¨𝕩 ⋄ (k/˜∊l)∾¨+´¨(l←⊐k)⊔3⊑¨𝕩} ·∾{z←⊑𝕩 ⋄ (⟨⟩m.Get z)<⊸∾¨< (z⊸≡¨"dac"‿"fft")⊸∨⌾(2↑⊢) 1↓𝕩}¨ 𝕩
}•_while_{×≠𝕩} ⋈"svr"‿0‿0‿1
•Show n
