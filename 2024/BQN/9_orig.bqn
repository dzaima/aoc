#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜⊑•FLines 2024‿9 Input •args

z←↑‿2⥊l
m ← z /○⥊ (↕≠z)≍˘¯1
# •Show ⊏⟜("."∾'0'+↕10)1+ m
t ← (+`⌾⌽ m≠¯1) > +`m=¯1
# •Show t⊏"·#"
b←{a‿b: (¯1⊸≠⊸/ ⌽a)⌾((b=¯1)⊸/)b} t⊔m

•Show +´b×↕≠b

p←m
{
  n←+´𝕩=p
  ls ← ↕∘≠⊸(⊣-·⌈`×) p≠¯1
  i ← ⊑ls⊐n
  i<⊑p⊐𝕩?
    p ¯1¨⌾((p=𝕩)⊸/)↩
    p 𝕩¨⌾(n↑(i-n-1)↓⊢)↩
    # •Show ⊏⟜("."∾'0'+↕10)1+ p
    
    ;
  @
}¨ ⌽↕≠z

# •Show 1+p
•Show +´(0⌈p)×↕≠(0⌈p)
# •Show ⊏⟜("."∾'0'+↕10)1+ p
# 