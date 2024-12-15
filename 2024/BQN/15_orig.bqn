#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF•FLines 2024‿15 Input •args
a >↩
b∾↩
# •Show a
# •Show b
c←a
{
  d ← ⊑𝕩⊐˜"<^>v"
  c ⌽∘⍉⍟d↩
  y‿x← ⋈⁼MDSlash c='@'
  c {𝕩↓˜↩1⋄('.'⊐˜𝕩)<○⊑'#'⊐˜𝕩? ".@"∾('O'⥊˜k)∾(1+k←⊑𝕩⊐'.')↓𝕩; 𝕩}⌾⌽⌾((1+x)↑y⊏⊢)↩
  c ⌽∘⍉⍟(4-d)↩
  1
}¨ b
# •Show c
•Show +´∾100‿1⊸×¨ MDSlash c='O'

a2 ← 2/˘'.'¨⌾((a='O')⊸(/○⥊)) a
a2 '.'⌾((1⊑MDSlash a2='@')⊸⊑)↩
# •Show a2
{a2 "[]"⌾(((⊢⋈0‿1⊸+) 𝕩×1‿2)⊸⊑)↩⋄1}¨ MDSlash a='O'
# •Show a2
c2←a2
{
  d ← ⊑𝕩⊐˜"<^>v"
  {
    ⊑d∊0‿2?
    c2 ⌽∘⍉⍟d↩
    y‿x← ⋈⁼MDSlash c2='@'
    c2 {𝕩↓˜↩1⋄('.'⊐˜𝕩)<○⊑'#'⊐˜𝕩? ".@"∾(k↑𝕩)∾(1+k←⊑𝕩⊐'.')↓𝕩; 𝕩}⌾⌽⌾((1+x)↑y⊏⊢)↩
    c2 ⌽∘⍉⍟(4-d)↩
    ;
    c2 ⌽⍟(d=3)↩
    m ← c2='@'
    ma ← m
    # •Show c2
    {𝕊:
      t←«m
      t2←t∧c2≠'.'
      t2∨↩ »˘ t2 ∧ c2='['
      t2∨↩ «˘ t2 ∧ c2=']'
      ma∨↩t2
      m↩t2
      # •Show t2
      ∨´⥊t2
    }•_while_⊢ 1
    {𝕊: v0←ma/○⥊c2⋄ c2 '.'¨⌾((/⥊ma)⊏⥊)↩ ⋄ c2 v0⌾((/⥊«ma)⊏⥊)↩}⍟⊢ ∧´'#'≠(«ma)/○⥊c2
    # •Show c2
    c2 ⌽⍟(d=3)↩
  }
  1
}¨ b
•Show +´∾100‿1⊸×¨ MDSlash c2='['
