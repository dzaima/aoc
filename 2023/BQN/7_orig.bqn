#!/usr/bin/env bqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨•FLines 2023‿7 Input •args

t ← {c←∧/⁼⊐ ⊑𝕩 ⋄ {c≡⟨5⟩? 5; c≡1‿4? 4; c≡2‿3? 3; ⊑3∊c? 2; 2≤+´2=c? 1; ⊑2∊c? 0; c≡5⥊1? ¯1}∾(⊑𝕩)⊐˜⌽"AKQJT98765432"}¨l
•Show +´(•ParseFloat¨1⊑¨l) × (≠t)-⍋⍋-t
# expected order: 15324


t ↩ {c←∧/⁼⊐ 𝕩 ⋄ {c≡⟨5⟩? 5; c≡1‿4? 4; c≡2‿3? 3; ⊑3∊c? 2; 2≤+´2=c? 1; ⊑2∊c? 0; c≡5⥊1? ¯1}}{
  (⌈´𝔽¨ 𝕩⊸{𝕩⌾((𝕨='J')⊸/)𝕨}¨ ⥊(<⟨⟩)<⊸∾⌜´(+´𝕩='J')⥊<"AKQT98765432")∾𝕩⊐˜⌽"AKQT98765432J"
}¨ ⊑¨l
•Show +´(•ParseFloat¨1⊑¨l) × (≠t)-⍋⍋-t
# 248810748 wrong
# 248889096 high
# problems: 1) have to keep card order intact for tiebreaker; 2) no actually, the tiebreaker is its own thing