#!/usr/bin/env -S cbqn -M 2000
⟨RB, B10, Num, Ints, SInts, Split⟩ ← •Import "utils.bqn"
l ← <˘⍉>'A'-˜2‿3⊏'A'⊸≤⊸/¨•FLines ≠◶"23.in"‿⊑ •args

scores ← 1‿10‿100‿1000
exits ← 2‿4‿6‿8

Fmt ← {s‿f‿r:
  •Out "⎕"∾(f⊏"ABCD.")∾"⎕  "∾•Repr s
  lns ← <˘⍉>∾((≠⊑r)⥊'⎕')⊸⋈¨r⊏¨<"ABCD."
  (↕≠lns) {
  ×𝕨? •Out "  "∾𝕩∾"⎕";
      •Out "⎕⎕"∾𝕩∾"⎕⎕⎕"
  }¨ lns
}

Do ← {
  minSc←∞
  nextKs ← ↕0
  nextVs ← ⟨⟩
  # Next ← {Get 𝕩} # in case of a need for some filtering
  Next ← {nextKs∾↩ ⊑𝕩 ⋄ nextVs∾↩ <1↓𝕩 ⋄ 1}
  Get ← { s‿f‿r:
    ft ← 4≠f # which spaces outside are free
    {
      sorted ← ∧´¨ (r=4) ∨ r=↕4
      {∧´sorted? ∧´f=4? minSc⌊↩s;0}
      ee ← (4=⊑¨r) ∧ sorted # whether the room is currently enterable
      ∨´ee? {
        0 { # try to move ones on the hallway to their homes
          v ← 𝕩⊑f
          v≠4?
          v⊑ee?
          end ← v⊑exits
          ∧´4=(end {s𝕊e: s+-⍟(e<s)↕|e-s} 𝕩)⊏f?
          pos ← ¯1+´∧`4=v⊑r
          nf ← 4⌾(𝕩⊸⊑)f
          nr ← v⌾(pos⊑v⊸⊑) r
          Next ⟨s+(v⊑scores)×pos+1+|end-𝕩 ⋄ nf ⋄ nr⟩
          1
          ;0
        }∘⊣⍟(¬⊢)´ ↕≠f? 1;
        0 { # try to move from home to home
          cr ← 𝕩⊑r
          nz ← 4≠cr
          ∨´nz?
          xpos ← ⊑/nz # exit pos
          v ← xpos⊑cr
          v⊑ee? # move only if actually possible
          v≠𝕩? # don't move from own home
          xx ← 𝕩⊑exits # exiting exit
          ex ← v⊑exits # entering exit
          ∧´4=(xx {s𝕊e: s+-⍟(e<s)↕1+|e-s} ex)⊏f? # whether the hallway is free for the move
          epos ← ¯1+´∧`4=v⊑r # enter pos
          Next ⟨s+(v⊑scores)×xpos+epos+2+|ex-xx ⋄ f ⋄ 4⌾(xpos⊑𝕩⊸⊑) v⌾(epos⊑v⊸⊑) r⟩
          1
          ;0
        }∘⊣⍟(¬⊢)´ ↕4? 1;
        0
      }? 1;
      
      # else, noone can yet move into their rooms; move out
      {
        nz ← 4≠𝕩⊑r
        ∨´nz? # does the current room even have anything
        ex ← 𝕩⊑exits
        4=ex⊑f? # is the space immediately outside free?
        d ← ⟨(⌽ex↑ft)⊑∘⊐1 ⋄ ((ex+1)↓ft)⊑∘⊐1⟩
        ∨´4≠d?
        pos ← ⊑/nz
        v ← pos⊑𝕩⊑r
        ∨´(4≠𝕩⊑r)∧𝕩≠𝕩⊑r? # am I not already in the correct room
        nr ← 4⌾(pos⊑𝕩⊸⊑) r
        sc ← v⊑scores
        ¯1‿1 {dir𝕊𝕩:
          {np←ex+dir×𝕩 ⋄ ∧´np≠exits? Next ⟨s+sc×pos+1+𝕩 ⋄ v⌾(np⊸⊑)f ⋄ nr⟩;0}¨ 1+↕𝕩
        }¨ d
        𝕩
      ;0}¨ ↕4
    }
  }
  Get ⟨0 ⋄ 11⥊4 ⋄ 𝕩⟩
  {𝕊:
    bestIs ← {𝕩⊑˜⊑(⊢⊐⌊´)𝕩⊏nextKs}¨ ⊔⊐ nextVs
    vs←(bestIs⊏nextKs)∾¨bestIs⊏nextVs
    nextVs ↩ ⟨⟩
    nextKs ↩ ↕0
    Get¨ vs
  } •_while_{𝕊: ×≠nextKs} @
  minSc
}
•Show Do l
•Show Do "DD"‿"CB"‿"BA"‿"AC" {𝕨𝕊r0‿r3: r0∾(𝕨-'A')∾r3}¨ l