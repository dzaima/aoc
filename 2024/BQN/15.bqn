#!/usr/bin/env bqn
⟨SplitF, _underSelect_, Select, MDSlash, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2024‿15 Input •args
a >↩
b ∾↩
MoveRight1 ← {𝕩↓˜↩1⋄(𝕩⊐'.')<○⊑𝕩⊐'#'? ".@"∾(k↑𝕩)∾(1+k←⊑𝕩⊐'.')↓𝕩; 𝕩}

# part 1
{
  c ← a
  {
    d ← ⊑">v<^"⊐𝕩
    y‿x ← ⋈⁼MDSlash c='@'
    c MoveRight1 _underSelect_((≢c) {d≥2? 𝕩-↕𝕩+1; 𝕩+↕𝕨-𝕩}⌾((¬2|d)⊸⊑) y‿x)↩
    1
  }¨ b
  •Show +´∾100‿1⊸×¨ MDSlash c='O'
}

# part 2
{
  c ← 2/˘'.'¨⌾((a='O')⊸(/○⥊)) a
  c '.'⌾((1⊑MDSlash c='@')⊸⊑)↩
  {c "[]"⌾(((⊢⋈0‿1⊸+) 𝕩×1‿2)⊸⊑)↩⋄1}¨ MDSlash a='O'
  
  h‿w ← ≢c
  
  {
    d ← ⊑">v<^"⊐𝕩
    y‿x ← ⋈⁼MDSlash c='@'
    {
      ⊑d∊0‿2?
        c MoveRight1 _underSelect_⟨y, {d=2? x-↕x+1; x+↕w-x}⟩↩
      ;
        dy ← d⊑0‿1‿0‿¯1
        ai ← ⟨⋈y, ⋈x⟩
        {
          𝕊 xs:
          y+↩dy
          (y≥0) ∧ y<h?
          cv ← y‿xs Select c
          xs‿cv (cv≠'.')⊸/¨↩
          xs∾↩ (1+(cv='[')/xs) ∾ ¯1+(cv=']')/xs
          xs ⍷↩
          ai∾¨↩ ⟨y¨ xs, xs⟩
          xs
          ; ↕0
        }•_while_ (×≠) ⋈x
        av ← ai Select c
        { 𝕊:
          c '.'¨_underSelect_ ai↩
          c av _underSelect_(dy‿0+ai)↩
        }⍟⊢ ∧´'#'≠av
    }
    1
  }¨ b
  •Show +´∾100‿1⊸×¨ MDSlash c='['
}