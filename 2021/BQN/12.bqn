#!/usr/bin/env cbqn
⟨Split⟩ ← •Import"utils.bqn"
rs‿re ← <˘⍉>'-'Split¨•FLines ≠◶"12.in"‿⊑ •args

u ← ⍷rs∾re # unique caves
big ← ('A'⊸≤∧≤⟜'Z') ⊑¨u # whether each of them are big
sp‿ep ← u⊐"start"‿"end" # start and end cave numbers

s‿e ← ∾¨⟜⌽rs‿re ⊐˜¨ <u # connected cave pairs
c ← {(s=𝕩)/e}¨ ↕≠u # list of connected caves for each cave

Step ← { r‿l:
  l ↩ ∾{
    a‿v: # a - is second visit available
      l ← ¯1⊑v            # last
      l≠ep?               # if not at end:
      n ← l⊑c             # caves connected to this one
      f ← (n⊏big) ∨ ¬n∊v  # always fine to add - either big, not not already present
      n‿f/˜¨↩ <f ∨ a∧n≠sp # if can't use second visit, remove ones not 'always fine to add'
      (a∧f) ⋈¨ v⊸∾¨ n;    # and return the pairs
    𝕊:
      r+↩1 # else, at end, increase counter
      ⟨⟩   # and return an empty list for next step
  }¨ l
  r‿l
}

•Show¨ {⊑ Step•_while_{0≠≠1⊑𝕩} ⟨0⋄⟨⟨𝕩⋄⟨sp⟩⟩⟩⟩}¨ 0‿1
