#!/usr/bin/env bqn
⟨Ints, Count, Split, SplitF⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩ SplitF •FLines ≠◶"20.in"‿⊑ •args

n ← ⋈⁼∘Ints∘⊑¨ l
v ← '#'=>¨ 1↓¨l

edges ← {>⊏¨ ⌽∘⍉⍟(↕4) 𝕩}¨ v # order: top, right, bottom, left; TODO do less stupidly
all ← ∾ ∾⟜(⌽˘)¨ edges # order: t,r,b,l, reversed t,r,b,l
allIdx ← 8/↕≠l # group index for each edge

RotCW ← {(8×𝕩⊑allIdx) + (8|𝕩) ⊑ 1‿2‿3‿0‿7‿4‿5‿6}
RotCCW ← {(8×𝕩⊑allIdx) + (8|𝕩) ⊑ 3‿0‿1‿2‿5‿6‿7‿4}
# Opposite ← {(8×𝕩⊑allIdx) + (8|𝕩) ⊑ 2‿3‿0‿1‿6‿7‿4‿5}
Opposite ← {(8×𝕩⊑allIdx) + (8|𝕩) ⊑ 6‿7‿4‿5‿2‿3‿0‿1}

corners ← / 2=+´¨2= (¯1+`(4↑1)⥊˜≠)⊸⊔ all Count○(<˘)˜ ∾edges # TODO remove <˘ after Count makes sense of it

# •Show ('0'+<˘all)≍˘allMap
next ← ⊑¨ ∾⟜¯1¨ {i←⊐all ⋄ 𝕩⊸≠⊸(/¨) i⊏i⊔𝕩}↕≠all # for each edge, the adjacent ones' index

# •Show next≍˘˜↕≠next

•Show ×´ corners⊏n # no need to actually reconstruct the image yet

GetNext ← { 𝕊i: # takes edge number, gets adjacent tile & gives its next edge
  nt ← i⊑next # next tile matching edge
  nt≢¯1? Opposite nt; ¯1
}

# horrible mess follows:

start ← ⊑corners # top left corner tile number
startEdge ← {!2=≠𝕩⋄⊑𝕩} {∧´¯1≠next⊏˜RotCW⊸⋈ 𝕩}¨⊸/ (8×start)+↕8 # edge of that which also continues after RotCW
NextList ← {¯1↓ (⊢∾⟜< ·GetNext ¯1⊑⊢)•_while_(¯1≢¯1⊑⊢) ⋈𝕩}
leftCol ← NextList startEdge

gridNs ← >{NextList RotCW 𝕩}¨ leftCol

grid0 ← ⌽(8|gridNs) {𝕨◶⟨⍉⌽,⊢,⌽⍉,⌽⌽˘,⌽∘⍉∘⌽,⌽,⍉,⌽˘⟩ 𝕩}¨ (gridNs⊏allIdx)⊏v
! {𝕩≡2/˘2/(2|↕¨≢𝕩)/𝕩} ¯2‿¯2↓1‿1⌽∾{0‿¯1⊸⊏˘0‿¯1⊏𝕩}¨ grid0 # verify that we've gotten the proper grid
grid ← ∾{¯1‿¯1↓1‿1↓𝕩}¨ grid0 # and now with removed borders

seaMonster ← '#'=(@+10)Split 1↓"
                  # 
#    ##    ##    ###
 #  #  #  #  #  #   "
seaMonsterW ← ≠⊑seaMonster
seaMonsterIdxs ← /¨ seaMonster

# •Show grid⊏".#"
# •Show ".#"⊏˜ >seaMonster

Find ← {
  offs ← »⍟(↕seaMonsterW) 𝕩
  t ← {∧´𝕩⊏offs}¨ seaMonsterIdxs # for each sea monster row, where it matches in the grid
  a ← ∧´{(𝕩⥊0)⊸»˘𝕨}¨⟜(↕≠) t
  b ← ∧´{(𝕩⥊0)⊸«˘𝕨}¨⟜(↕≠) t
  a ∨ b
}

a ← Find grid
b ← ⍉Find ⍉grid

•Show (+´⥊grid) - (+´≠¨ seaMonsterIdxs) × +´+´∘⥊¨ a‿b # assumes sea monsters don't overlap