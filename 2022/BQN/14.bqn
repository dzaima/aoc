#!/usr/bin/env bqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
i ← ∾{2↕∘‿2⥊𝕩}∘Ints¨•FLines ≠◶"14.in"‿⊑ •args

Set1 ← {𝕨 1⌾((+´𝕩×1«≢𝕨)⊑⥊)↩}

Run ← {
  min ← ¯1+0⊸⌊⌾(1⊸⊑) ⌊˝∾˝𝕩
  𝕩 -⎉1⟜min↩
  b ← ⍉ ∊⟜(∾{(<⊏𝕩)+⥊(<∘××·↕1+|)-˝⌽𝕩}¨ <˘𝕩)⌾⥊ ↕2+⌈˝∾˝𝕩
  oobx ← ¯1+≠⊏b
  ooby ← ¯1+≠b
  
  res ← 0
  Fill ← {
    𝕨‿𝕩⊑b? 1;
    (ooby=𝕨+1)∨(𝕩=0)∨𝕩=oobx? 0;
    (𝕨+1) Fill 𝕩?
    (𝕨+1) Fill 𝕩-1?
    (𝕨+1) Fill 𝕩+1?
      res+↩ 1
      b Set1↩ 𝕨‿𝕩
      1;
    0
  }
  Fill´ ⌽500‿0-min
  •Show res
}

Run i
ji ← 500‿0∾∾˝i
max ← ⌈˝ji
min ← ⌊˝ji
by ← 2+1⊑max
i2 ← i∾ [⟨by-˜⊑min, by⟩, ⟨by+⊑max, by⟩]
Run i2