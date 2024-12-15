#!/usr/bin/env bqn
⟨SplitF, _underSelect_, Select, MDSlash, MDSlashI, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2024‿15 Input •args
a >↩
b ∾↩

Score ← {+´ +´¨ 100‿1 × MDSlashI 𝕨=𝕩}

# part 1
{
  c ← a
  y‿x ← ⋈⁼MDSlash c='@'
  c '.'⌾(y‿x⊸⊑)↩
  ds ← ⟨0‿1,1‿0,0‿¯1,¯1‿0⟩
  sh ← ≢c
  c ↩ c {
    d ← ⊑">v<^"⊐𝕨
    {
      (k←⊑𝕩⊐'.') < ⊑𝕩⊐'#'?
        y‿x+↩d⊑ds
        '.'∾(k↑𝕩)∾(1+k)↓𝕩;
      𝕩
    } _underSelect_(sh {d≥2? (𝕩-1)-↕𝕩; 𝕩+↩1 ⋄ 𝕩+↕𝕨-𝕩}⌾((¬2|d)⊸⊑) y‿x) 𝕩
  }´ ⌽b
  •Show 'O' Score c
}

# part 2
{
  Re ← {s‿d𝕊𝕩: d¨⌾((s=⥊𝕩)/⥊) 𝕩}
  c ← ∾˝˘ ("O[" Re a) ≍⎉0 "O]" Re "@." Re a
  
  h‿w ← ≢c
  
  y‿x ← ⋈⁼MDSlash c='@'
  {
    d ← ⊑">v<^"⊐𝕩
    {
      ⊑d∊0‿2?
        c {
          (k←⊑𝕩⊐'.') < ⊑𝕩⊐'#'?
            x+↩d⊑1‿0‿¯1‿0
            '.'∾(k↑𝕩)∾(1+k)↓𝕩;
          𝕩
        } _underSelect_⟨y, {d=2? x-↕x+1; x+↕w-x}⟩↩
      ;
        cy ← y
        dy ← d⊑0‿1‿0‿¯1
        ai ← ⟨⋈cy, ⋈x⟩
        {
          𝕊 xs:
          cy+↩dy
          (cy≥0) ∧ cy<h?
          cv ← cy‿xs Select c
          xs‿cv (cv≠'.')⊸/¨↩
          xs∾↩ (1+(cv='[')/xs) ∾ ¯1+(cv=']')/xs
          xs⍷↩
          ai∾¨↩ ⟨cy¨ xs, xs⟩
          xs
          ; ↕0
        }•_while_(×≠) ⋈x
        av ← ai Select c
        { 𝕊:
          c '.'¨_underSelect_ ai↩
          c av _underSelect_(dy‿0+ai)↩
          y+↩ dy
        }⍟⊢ ∧´'#'≠av
    }
    1
  }¨ b
  •Show '[' Score c
}