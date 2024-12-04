#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2024‿3 Input •args

on ← 1
# separation into block for reuse across parts added after solve; live I modified it in-place
Process ← {part2 𝕊 l:
  S ← {∨⟜»⍟(𝕨-1) (0⥊˜𝕨-1)∾˜𝕩}
  Next ← {
    l≡⟨⟩? 0‿@;
    m ← ∧`𝕏 l
    ⊑m?
      n ← +´m
      (l↓˜↩n) ⊢ 1⋈n↑l
    ;
      0⋈@
  }
  r ← ↕0
  any ← 0
  { 𝕊:
    {𝕊:
      {𝕊: on↩1⋄1}⍟⊢ ⊑Next {{4 S "do()"⍷𝕩}}? 1;
      {𝕊: on↩0⋄1}⍟⊢ ⊑Next {{7 S "don't()"⍷𝕩}}? 1;
      0
    } •_while_⊢ part2
    any↩⊑Next {{4 S "mul("⍷𝕩}}?
    ⊑·‿a←Next {{𝕩∊'0'+↕10}}?
    ⊑    Next {{<`𝕩=','}}?
    ⊑·‿b←Next {{𝕩∊'0'+↕10}}?
    ⊑    Next {{<`𝕩=')'}}?
    # •Show on‿a‿b∾≠l
    r∾⍟on˜↩ a ×○•ParseFloat b;
    l ↓˜↩¬any # originally this was `l↓˜↩1`, which was buggy
    @
  } •_while_ {𝕊:×≠l}@
  +´r
}
•Show +´ 0 Process¨ l
•Show +´ 1 Process¨ l
