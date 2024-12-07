#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
k‿v ← <˘⍉> ' 'Split¨•FLines 2023‿7 Input •args
v •ParseFloat¨↩
Winnings ← {+´ v × 1+⍋⍋𝕩}

Rank ← ⊑ ⟨1‿1‿1‿1‿1 ⋄ 2‿1‿1‿1 ⋄ 2‿2‿1 ⋄ 3‿1‿1 ⋄ 3‿2 ⋄ 4‿1 ⋄ ⟨5⟩⟩ ⊐ <
rank1 ← {(Rank ∨/⁼⊐ 𝕩)∾𝕩⊐˜⌽"AKQJT98765432"}¨ k
•Show Winnings rank1


# rank2 ← {(⌈´{Rank ∨/⁼⊐𝕩}¨ ('J'⊸≠⊸/𝕩)⊸∾¨ ⥊(<⟨⟩)<⊸∾⌜´(+´𝕩='J')⥊<"AKQT98765432")∾𝕩⊐˜⌽"AKQT98765432J"}¨ k # basic extension with cartesian product
rank2 ← {
  c ← ∨/⁼⊐ 'J'⊸≠⊸/ 𝕩
  c ↩ (5-+´c)⊸+⌾⊑ (1⌈≠)⊸↑ c # redirect all jokers to the otherwise-most-common card
  (Rank c)∾𝕩⊐˜⌽"AKQT98765432J"
}¨ k
•Show Winnings rank2
