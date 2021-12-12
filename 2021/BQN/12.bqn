#!/usr/bin/env cbqn
⟨Split⟩ ← •Import"utils.bqn"
rs‿re ← <˘⍉>'-'Split¨•FLines ≠◶"12.in"‿⊑ •args

u ← ⍷rs∾re # unique caves
big ← ('A'⊸≤∧≤⟜'Z') ⊑¨u # whether each of them are big
sp‿ep ← u⊐"start"‿"end" # start and end cave numbers

s‿e ← ∾¨⟜⌽rs‿re ⊐˜¨ <u # connected cave pairs
c ← {(s=𝕩)/e}¨ ↕≠u # list of connected caves for each cave

mid ← /¬(↕≠u)∊sp‿ep # indexes on non-endpoint caves (ones that we may want to add to lists)

Step ← { r‿a‿l‿v: # result, second visit available, last position, masks of visited caves
  as‿ls‿vs ← <˘⍉>{𝕊: # iterate through all caves
    cc ← 𝕩⊑c           # get ones adjacent to the current one
    lm ← l∊cc          # mask of paths adjacent to current ones
    f ← (𝕩⊑big) ∨ ¬𝕩⊑v # always fine to add - either big, or not already present
    o ← lm ∧ f ∨ a     # okay to add
    ⟨o/a∧f ⋄ (+´o)⥊𝕩 ⋄ 1¨⌾(𝕩⊸⊑) o⊸/¨ v⟩
  }¨ mid
  done ← +´l∊ep⊑c # count number of rows that are adjacent to the end
  ⟨r+done ⋄ ∾as ⋄ ∾ls ⋄ ∾¨ <˘⍉>vs⟩
}

•Show¨ {⊑ Step•_while_{0≠≠1⊑𝕩} ⟨0 ⋄ ⟨𝕩⟩ ⋄ ⟨sp⟩ ⋄ ⋈¨ sp=↕≠u⟩}¨ 0‿1