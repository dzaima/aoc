#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿17 Input •args

# off ← 2⋆52
# Xor ← {off-˜ ⊑{(8•bit._xor˝ 6↑˘𝕩)∾6↓⊏𝕩}⌾(64‿8•bit._cast⊢) ≍˘𝕨‿𝕩+off}
Xor ← 32•bit._xor⌾⋈

p ← 4⊑l
Run ← {𝕊r:
  outs←⟨⟩
  {
    oc‿op←2↑𝕩↓p
    combo ← {𝕩≤3? 𝕩; 7: '!'; (𝕩-4)⊑r} op
    # •Show oc‿op⋈r
    oc◶⟨
      {r(⌊(⊑r)÷2⋆combo)⌾(  ⊑)↩ ⋄ 𝕩} # adv
      {r (op Xor ⊢)⌾(1⊸⊑)↩ ⋄ 𝕩}     # bxl
      {r (8|combo)⌾(1⊸⊑)↩ ⋄ 𝕩}      # bst
      {0=⊑r?𝕩; op}                  # jnz
      {r ((2⊑r) Xor ⊢)⌾(1⊸⊑)↩ ⋄ 𝕩}  # bxc
      {outs∾↩8|combo⋄𝕩}             # out
      {r(⌊(⊑r)÷2⋆combo)⌾(1⊸⊑)↩ ⋄ 𝕩} # bdv
      {r(⌊(⊑r)÷2⋆combo)⌾(2⊸⊑)↩ ⋄ 𝕩} # cdv
    ⟩ 𝕩+2
  }•_while_{𝕊: 𝕩≠≠p} 0
  outs
}

•Out 1↓∾','∾¨•Repr¨ Run ⊑¨ 3↑l
# •Show 1⊸+•_while_{𝕊: p≢Run 𝕩‿0‿0} 0 # the insufficient part 2 solution
