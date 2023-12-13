#!/usr/bin/env cbqn
⟨B10, Split⟩ ← •Import "../../utils/utils.bqn"
k‿v ← ∧¨¨¨<˘⍉>{' ' Split¨ 2⊸↓⌾(1⊸⊑)(+`'|'=𝕩)⊔𝕩}¨ •FLines ≠◶"8.in"‿⊑ •args

•Show +´(≠¨∾v)∊2‿3‿4‿7

•Show +´ k {
 n0‿n1‿n2‿n3‿n4‿n5‿n6‿n7 ← ≠¨⊸⊔𝕨 # group patterns by segment count
 ⟨d1⟩ ← n2 # extract ones with only one example per segment count
 ⟨d4⟩ ← n4
 ⟨d7⟩ ← n3
 ⟨d8⟩ ← n7
 
 ⟨d3⟩ ← {∧´d1∊𝕩}¨⊸/ n5  # '3' is the only 5-segment superset of '1'
 n5(¬∘∊/⊣)↩ ⋈d3         # remove '3' from the list of unfinished 5-segment digits
 d9 ← ∧⍷d3∾d4           # '9' is '3' & '4' overlapped
 n6(¬∘∊/⊣)↩ ⋈d9         # remove '9' from the list of unfinished 6-segment digits
 d2‿d5 ← {∧´𝕩∊d9}¨⊸⊏ n5 # from '2'&'5', '5' is the only subset of '9'
 d6‿d0 ← {∧´d1∊𝕩}¨⊸⊏ n6 # from '6'&'0', '0' is the only superset of '1'
 ds ← d0‿d1‿d2‿d3‿d4‿d5‿d6‿d7‿d8‿d9 # all the gotten digits
 B10 ds⊐𝕩 # look up the wanted numbers, and decode them
}¨ v


# lookup tables:
# •Show +´ k {
#   d14←0‿2⊏ns←(⍋≠¨𝕨)⊏𝕨
#   B10 𝕩⊐˜ 8‿0‿4‿6‿2‿5‿7‿1‿3‿9⊏(⍋4‿4‿6‿2‿2‿2‿0‿0‿0‿6-˜{+´∾𝕩⊸∊¨d14}¨)⊸⊏ ns
# }¨ v

# set operations:
# U ← ⍷∾ # APL ∪
# I ← ∊/⊣ # APL ∩
# W ← ¬∘∊/⊣ # APL ~
# 
# •Show +´k {
#   ns ← (⍋≠¨𝕨)⊏𝕨
#   cf‿acf‿bcdf‿n5a‿n5b‿n5c‿n6a‿n6b‿n6c‿abcdefg ← ns
#   a ← acf W bcdf
#   adg ← n5a I n5b I n5c
#   abfg ← n6a I n6b I n6c
#   ag ← adg I abfg
#   g ← ag W a
#   d ← adg W ag
#   cd ← bcdf W cf
#   b ← cd W d
#   bcef ← abcdefg W adg
#   cef ← bcef W b
#   e ← cef W cf
#   f ← abfg W b U ag
#   c ← abcdefg W abfg U d U e
#   ds ← ∧¨ ⊏⟜(a∾b∾c∾d∾e∾f∾g)¨ "abcefg"‿"cf"‿"acdeg"‿"acdfg"‿"bcdf"‿"abdfg"‿"abdefg"‿"acf"‿"abcdefg"‿"abcdfg"-'a'
#   B10 ds⊐𝕩
# }¨ v