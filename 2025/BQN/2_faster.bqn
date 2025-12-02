#!/usr/bin/env bqn
⟨Ints, Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨','Split ⊑•FLines 2025‿2 Input •args

max ← ⌈10⋆⁼2+⌈´∾l

all ← { 𝕊 l: # for each necessary number length:
  ds ← (0=|⟜𝕩)⊸/ ↕l # divisors (excl. self)
  ps ← { 𝕊 k: # for each divisor:
    r ← {𝕩+↕9×𝕩} 10⋆k-1 # e.g. for k=3: 100…999
    r×↩ +´ 10⋆ k× ↕l÷k  # multiply by e.g. 100100100100 to get length-l numbers
  }¨ ds
  (2∾˜2≠l÷ds) ⊔ ps # group by whether number is repeated twice
}¨ 1+↕max

ps ← ∾∘∾¨ <˘⍉> all # ⟨all 2x-repeated invalid IDs ⋄ ≥3x-repeated IDs⟩
ps ∧⌾(1⊸⊑)↩ # sort the ≥3x-repeated IDs (2x-repeated is already sorted)
i2‿ir ← {𝕊a: ∾{s‿e←a⍋𝕩 ⋄ s↓e↑a}¨ l}¨ ps # binary-search the input in the invalid IDs & slice them
•Show p1 ← +´i2 # 2x-repeated doesn't have duplicates
•Show p1+´ ⍷ ¬∘∊⟜i2⊸/ ir # clean up ≥3x duplicates
