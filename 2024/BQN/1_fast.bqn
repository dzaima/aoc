#!/usr/bin/env bqn
⟨Input, Count⟩ ← •Import "../../utils/utils.bqn"
bs ← •file.MapBytes 2024‿1 Input •args

Re ← {a‿b𝕊𝕩: b¨⌾((a=𝕩)⊸/)𝕩}
nw ← 0.5×1+⊑bs⊐@+10          # half of the width of a line (we assume all numbers are equal-width)
nums ← 0⌈ '0'-˜ ∘‿nw⥊bs      # (A) reshape into an n×nw matrix, subtract '0', max(0, that)
cols ← ⌽ ¯1↓<˘⍉ nums         # (B) transpose, split into rows, drop last one (all spaces/newlines), reverse
a‿b ← <˘⍉ ∘‿2⥊ 10⊸×⊸+˜´ cols # (C) a+10×b-reduce, split apart the two columns
a ↩ •internal.Squeeze a×÷10  # (D) the first column was shifted one to the right; divide by 10 (multiply by 1÷10) to shift it back (squeeze to convert to ints, as float multiply doesn't bother)

# 12345···67890↩
# 54321···98765↩
# ↓ (A)
# 1234500
# 0678900
# 5432100
# 0987650
# ↓ (B)
# 0005
# 5916
# 3738
# 4827
# 2649
# 1050
# ↓ (C)
# ⟨⟨123450,543210⟩, ⟨67890,98765⟩⟩
# ↓ (D)
# ⟨⟨12345,54321⟩, ⟨67890,98765⟩⟩


a‿b ∧¨↩             # sort both columns
•Show +´ |a-b       # sum of absolute differences
•Show +´ a× a ⊏ /⁼b # indices-inverse (i.e. histogram) column b, select from that by column a, multiply, sum
# better for larger numbers, but slower for the input:
# +´ a× a Count b
