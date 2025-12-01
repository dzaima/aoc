#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
i ← •FLines 2025‿1 Input •args

l ← 'L'= ⊑¨ i # which lines go left
n ← {•ParseFloat 1↓𝕩}¨ i # numbers

d ← n×l⊏1‿¯1 # delta
e ← 50+`d    # endpoints
h ← ⌊e÷100   # hundreds
z ← e=h×100  # zeroes (mod 100)
•Show +´z

hs ← »h-z∧«l # starts of hundreds ranges
he ←  h-z∧ l # ends of hundreds ranges
•Show +´|hs-he
# ! (+´|hs-he) ≡ +´0=∾(50»100|e){100|𝕨+(×𝕩)×↕|𝕩}¨d
