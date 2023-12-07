#!/usr/bin/env cbqn
⟨Split⟩ ← •Import "utils.bqn"
l ← ' 'Split¨•FLines ≠◶"7.in"‿⊑ •args
k ← ⊑¨ l
v ← •ParseFloat¨ 1⊑¨ l
Winnings ← {+´ v × 1+⍋⍋𝕩}

Rank ← {𝕩≡⟨5⟩? 5; 𝕩≡4‿1? 4; 𝕩≡3‿2? 3; ⊑3∊𝕩? 2; 2≤+´2=𝕩? 1; ⊑2∊𝕩? 0; 𝕩≡5⥊1? ¯1; !𝕩}
rank1 ← {(Rank ∨/⁼⊐ 𝕩)∾𝕩⊐˜⌽"AKQJT98765432"}¨ k
•Show Winnings rank1


# rank2 ← {(⌈´{Rank ∨/⁼⊐𝕩}¨ ('J'⊸≠⊸/𝕩)⊸∾¨ ⥊(<⟨⟩)<⊸∾⌜´(+´𝕩='J')⥊<"AKQT98765432")∾𝕩⊐˜⌽"AKQT98765432J"}¨ k # basic extension with cartesian product
rank2 ← {
  c ← ∨/⁼⊐ 'J'⊸≠⊸/ 𝕩
  c ↩ (5-+´c)⊸+⌾⊑ (1⌈≠)⊸↑ c # redirect all jokers to the otherwise-most-common card
  (Rank c)∾𝕩⊐˜⌽"AKQT98765432J"
}¨ k
•Show Winnings rank2
