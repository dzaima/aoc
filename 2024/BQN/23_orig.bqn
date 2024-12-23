#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '-'Split¨•FLines 2024‿23 Input •args
s‿e ← <˘⍉>l

m ← •HashMap˜⟨⟩
s {
  𝕨 m.Set (⟨⟩ m.Get 𝕨)∾<𝕩
}¨{𝕨𝔽𝕩⋄𝕩𝔽𝕨} e
# •Show ≠⍷{∧{⍷𝕩∾·∾⟨⟩⊸m.Get¨𝕩}_fx_≢ ⋈𝕩}¨ ⍷s∾e
lan ← ⍷∾s {
  l ← m.Get 𝕨
  r ← m.Get 𝕩
  (∧·⍷𝕨‿𝕩∾⋈)¨ l(∊/⊣)r
}¨ e

•Show +´(∨´'t'=⊑¨)¨lan

# •Show ∧{𝕩/˜⌈´⊸=⊒𝕩}s∾e
# {
#   •Show (∊/⊣)´ m.Get¨ 𝕩
# }¨ lan

•Out 1↓∾'-'⊸∾¨ ⋈⁼ ⍷ ∾{
  k ← ≠𝕩
  z←+˝(=⌜´↕¨∘≢)⊸∨ t←> 𝕩⊸∊¨ m.Get¨ 𝕩
  good ← 12≤+´13≤z
  # originally result manually derived from:
  # 𝕩{¬𝕩?𝕩;•Show¨ 𝕨‿t⋄𝕩} good
  good/⋈(13≤z)/𝕩
}¨ ⍷{
  ∧𝕩<⊸∾m.Get 𝕩
}¨ s
