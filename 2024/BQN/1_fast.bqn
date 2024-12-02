#!/usr/bin/env bqn
⟨Input, Count⟩ ← •Import "../../utils/utils.bqn"
bs ← •file.MapBytes 2024‿1 Input •args

lw ← 1+⊑bs⊐@+10       # line width; 14 for input
nw ← ¯2+lw÷2          # number width; 5 for input
si ← (⊢∾(3+nw)⊸+) ↕nw # indices to pick out from each row; 0‿1‿2‿3‿4‿8‿9‿10‿11‿12 for input

nums ← ∘‿nw⥊ si⊸⊏˘ ∘‿lw⥊ bs    # (A) select by the indices (reshaping to n by lw matrix beforehand, and n×2 by nw afterward)
digits ← ⌽ <˘ ⍉ nums-'0'       # (B) subtract ASCII '0', transpose, split into list of lists, reverse that
a‿b ← <˘⍉∘‿2⥊ {𝕨+10×𝕩}´ digits # (C) a+10×b-reduce, split into the two columns via reshape & transpose

# 12345···67890↩54321···98765↩
# ↓ (A)
# 12345···67890↩
# 54321···98765↩
# ↓ (A)
# 1234567890
# 5432198765
# ↓ (A)
# 12345
# 67890
# 54321
# 98765
# ↓ (B)
# 1659
# 2748
# 3837
# 4926
# 5015
# ↓ (C)
# ⟨12345,67890,54321,98765⟩
# ↓ (C)
# ⟨⟨12345,54321⟩, ⟨67890,98765⟩⟩

a‿b ∧¨↩           # sort both columns
•Show +´ |a-b     # sum of absolute differences
h ← (1+⌈´a)↑/⁼b   # indices-inverse (i.e. histogram) column b
•Show +´ a× a ⊏ h # select from histogram by b, multiply, sum
# better alternative to last two lines for large numbers, but slower for the ≤99999 inputs:
# •Show +´ a× a Count b
