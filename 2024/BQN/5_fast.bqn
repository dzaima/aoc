#!/usr/bin/env bqn
⟨Ints, SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
bytes ← •file.MapBytes 2024‿5 Input •args

nw ← 1+ ⊑bytes⊐'|' # number width, plus 1
sep ← ⋈⁼/ (@‿@+10) ⍷ bytes # index of the the two newlines

Nums ← {(1⊸⊏˘ + 10×0⊸⊏˘) '0'-˜∘‿nw⥊𝕩} # parse an nw×n string into n numbers, ignoring the last char of each

a ← ∘‿2⥊ Nums (1+sep)↑bytes # parse the first section, ordering rules

b0 ← (2+sep)↓bytes     # the second section
bw ← 3÷˜-⟜» /0∾b0=@+10 # number of pages in each each line: deltas between newlines, div 3
b ← (/bw) ⊔ Nums b0    # parse the numbers, group into lines

n ← 1+⌈´⥊a                             # number of nodes
ma ← <˘ 1¨⌾((+˝n‿1×⍉a)⊏⥊) n‿n⥊0        # build adjacency matrix
s ← {𝕩⊏˜ ⍋ +´ 𝕩⊸⊏¨ 𝕩⊏ma}¨ b            # sort each page list by how many other pages in the list it's adjacent to
(•Show +´)¨ (2∾˜s≢¨b) ⊔ {𝕩⊑˜⌊2÷˜≠𝕩}¨ s # extract middle of each sorted list, group by equality to the original, sum & output each
