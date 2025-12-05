#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
c ← •FChars 2025‿5 Input •args
r‿a ← Ints¨ {𝕩 (↑⋈↓)˜ ⊑1⊐˜ ∧⟜» (@+10)=𝕩} c # slightly-optimized parsing, avoiding operating on lines; more boring version is "r‿a ← Ints‿Num {𝕎¨𝕩}¨ ⟨⟩SplitF •FLines …"
rs‿re ← <˘⍉ ∧ ∘‿2⥊r # range starts & ends; rs is sorted
re+↩ 1 # we want [start;end) ranges

re ↩ (⌈`re) ⌊ ∞«rs # clamp end ranges to between the end of the previous range and start of the next one
# now each range end is smaller than the next ones start, i.e. the ranges are sorted & non-overlapping

•Show +´ 2| (⥊rs≍˘re) ⍋ a # binary-search in all ranges; odd result means it was between start & end

•Show +´ re - rs # as ranges are non-overlapping, we can trivially just sum their lengths
