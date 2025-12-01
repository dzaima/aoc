#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
i ← •FChars 2025‿1 Input •args
# assumes numbers have 1-3 rigits

le ← i = @+10
l ← 'L'= i/˜1»le

nc ← i/˜ «⊸∨⍟2 «le # extract number characters; each line has at least 3 chars, so the expanded masks won't overlap
nc 'Q'⊸∾⍟(2=3|≠)↩  # ..except the first line, which may have 2 chars; prepend an arbitrary char if so
n3‿n2‿n1 ← <˘ '0'-˜ ⍉∘‿3⥊nc # 3-item list of the digits per position
n  ← n1        # numbers; first digit currently
nm ← n2≤9      # mask of numbers which continue
n +↩ nm×10×n2  # add second digit
nm∧↩ n3≤9      # (update mask)
n +↩ nm×100×n3 # add third digit

# (same continuation as 1.bqn)
d ← n×l⊏1‿¯1 # delta
e ← 50+`d    # endpoints
h ← ⌊e÷100   # hundreds
z ← e=h×100  # zeroes (mod 100)
•Show +´z

hs ← »h-z∧«l # starts of hundreds ranges
he ←  h-z∧ l # ends of hundreds ranges
•Show +´|hs-he
