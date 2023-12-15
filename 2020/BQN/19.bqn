#!/usr/bin/env bqn
⟨Num, Ints, SplitF, Split⟩ ← •Import "../../utils/utils.bqn"
rules0‿messages ← ⟨⟩ SplitF •FLines ≠◶"19.in"‿⊑ •args

r ← {
  n‿v ← (⊑𝕩⊐':')(↑⋈2⊸+⊸↓)𝕩
  {
    '"'=⊑v? ⟨Num n, ⊑1↓¯1↓v⟩;
    ⟨Num n, Ints¨ '|'Split v⟩
  }
}¨ rules0

rl ← 1=∘⊑¨r # rules with list
[rn,ra] ← ⍉>r # rule name, arguments

rm ← ra⌾(rn⊸⊏) @⥊˜1+⌈´rn # map from rule name to argument

Get ← {v←𝕩⊑rm ⋄ {=v? ∾ (⥊·∾⌜´ Get¨)¨ v; ⋈⋈v}}
# •Show +´(Get 0)∊messages # initial p1 impl; slower than using p2's method

! ⟨8‿11⟩ ≡ 0⊑rm # assumption 1: "0: 8 11" rule

# 0: 8 11              # said assumption
# 8: 42 | 42 8         # given
# 11: 42 31 | 42 11 31 # given

# 8: 42*w           # w≥1
# 11: 42*y 31*y     # y≥1
# 0: 42*w 42*y 31*y
# 0: 42*x 31*y      # x≥y+1; , x≥2

ox ← Get 42
oy ← Get 31

gl ← ≠⊑ox # group length
! {∧´ ∧´¨ gl = ≠¨¨𝕩} ox‿oy # assumption 2: variations for 42 and 31 all have the same length

ox >↩
oy >↩

messages (0=gl|≠¨)⊸/ ↩ # not required for my input (and probably everyone else's), but not much more difficult to do than an assuption

Unjoin ← {((≠¨𝕨)/↕≠𝕨) ⊔ 𝕩} # TODO ⌾∾

mgs ← ∘‿gl⊸⥊¨ messages # message groups
mx ← mgs Unjoin ox ∊˜ ∾mgs # message group has x
my ← mgs Unjoin oy ∊˜ ∾mgs # message group has y
v ← my {nx←+´∧`𝕩 ⋄ ny←+´∧`⌽𝕨 ⋄ (nx≥2) ∧ (ny≥1) ∧ (nx≥ny+1) ∧ (nx+ny)≥≠𝕩}¨ mx

•Show +´ my{3=≠𝕩? (∧´2↑𝕩) ∧ 2⊑𝕨;0}¨mx # part 1: 42 42 31
•Show +´ v # part 2