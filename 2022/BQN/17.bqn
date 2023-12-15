#!/usr/bin/env bqn
⟨Split,MDSlash⟩ ← •Import "../../utils/utils.bqn"
l ← •FChars ≠◶"17.in"‿⊑ •args
r ← '>'=l

Set1 ← {𝕨 1⌾((+´𝕩×1«≢𝕨)⊑⥊)↩}

pcb ← {⌽>'#'=(@+10)Split𝕩}¨ '-'Split"
####
-
.#.
###
.#.
-
..#
..#
###
-
#
#
#
#
-
##
##"

pci ← MDSlash¨ pcb
pcw ← ≠∘⊏¨ pcb
pch ← ≠¨ pcb

Game ← { 𝕊:
  board ← 100‿7⥊0
  h ⇐ 0

  pi ← 0
  p ← 3‿2
  si ← 0

  done ⇐ 0

  Step ⇐ { 𝕊:
    cr ← si⊑r
    cpci ← pi⊑pci
    p+↩ {
      cr?  0‿1×{(7-pi⊑pcw)>1⊑p? ¬∨´((p+ 0‿1)<⊸+cpci)⊑board; 0}
      ;   0‿¯1×{ 0        <1⊑p? ¬∨´((p+0‿¯1)<⊸+cpci)⊑board; 0}
    }
    fall ← {0<⊑p? ¬∨´((p+¯1‿0)<⊸+cpci)⊑board; 0}
    {
      fall?
        p+↩ ¯1‿0
      ;
        {board Set1↩ 𝕩 ⋄ 1}¨ p<⊸+ pi⊑pci
        h⌈↩ (⊑p)+pi⊑pch
        
        pi ↩ (≠pci)|pi+1
        
        p ↩ ⟨h+3, 2⟩
        done+↩ 1
        {𝕊:
          board∾↩ 0¨board
        }⍟⊢ h>¯10+≠board
    }
    si ↩ (≠r)|1+si
  }
  Status ⇐ {𝕊: si‿pi}
}

p1 ← Game@
p1.Step •_while_ {𝕊: p1.done<2022} 1
•Show p1.h


iter ← 1000000000000
p2 ← Game@
warm ← 2000
p2.Step •_while_ {𝕊:  p2.done≤warm} 1 ⋄ h1←p2.h ⋄ d1←p2.done ⋄ s1 ← p2.Status@ ⋄ p2.Step@
p2.Step •_while_ {𝕊: s1≢p2.Status@} 1 ⋄ h2←p2.h ⋄ d2←p2.done

skip ← ⌊(iter-p2.done) ÷ (d2-d1)
skipIter ← skip × d2-d1
skipHeight ← skip × h2-h1

p2.Step •_while_ {𝕊: p2.done < iter-skipIter} 1
•Show p2.h + skipHeight
