#!/usr/bin/env bqn
⟨Count⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"24.in"‿⊑ •args

#  00→⬡ ⬡ ⬡ x2   nw ne
# y1 ⬡ ⬡ ⬡       w ⬡ e
#   ⬡ ⬡ ⬡        sw se
#   nw  ne  w e sw se   nn      n n .
# x ¯1   0 ¯1 1  0  1   nxn    n x n
# y ¯1  ¯1  0 0  1  1    nn   . n n

GetPos ← {
  e‿w ←   𝕩⊸=¨ "ew"
  n‿s ← »¨𝕩⊸=¨ "ns"
  n‿e‿s‿w /˜¨↩ <e∨w
  y ← s-n
  x ← -y⊸≠⊸× w-e
  x ⋈○(+´) y
}

ps ← GetPos¨ l
psU ← ⍷ps
on ← 2|psU Count ps

•Show +´ on

Show ← {•Out¨ (⌽' '⥊˜¨↕≠𝕩) ∾¨ {⥊⍉' '¨⊸≍𝕩}¨ <˘ ⊏⟜"⬡⬢" 𝕩}
map ← {1¨⌾(𝕩⊸⊑) 0⥊˜1+⌈´𝕩} {𝕩-<⌊´𝕩} on/psU

Step ← {
  m ← ¯1‿¯1⌽(2+≢𝕩)↑𝕩
  w ← «˘m
  c ← m+w
  n ← (w + »˘m) + («c) + »˘»c
  r ← ((¬m)∧n=2)  ∨  m ∧ (n≠0)∧n≤2
  r
}

•Show +´⥊ Step⍟100 map