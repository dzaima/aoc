#!/usr/bin/env bqn
# part 1: 8:43; both: 18:04
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2025‿8 Input •args
n ← ≠l
o ← ⍋⥊+´¨×˜-⌜˜l
p ← n(|⋈¨⌊∘÷˜)n↓o
p ≤´¨⊸/↩

{ # part 1
  c ← ↕≠l

  {
    a‿b ← 𝕩⊏c
    a≠b?
    c a¨⌾((b=c)⊸/)↩
    @
    ;@
  }¨ {n=20? 10; 1000}↑p
  •Show ×´3↑∨/⁼c

}

{ # part 2
  # •Show /(216‿117≡·⊑¨⊏⟜l)¨ p
  c ← ↕≠l
  i←¯1
  {𝕊:
    z ← p⊑˜i+↩1
    a‿b ← z⊏c
    # •Show ⟨"A", , ¯1+i+↩1, ×´⊑¨z⊏l⟩
    a≠b?
    # •Show ⟨a‿b,≠⍷c⟩
    c a¨⌾((b=c)⊸/)↩
    {𝕊:•Show ×´⊑¨z⊏l}⍟⊢ done←1= ≠⍷c
    
    done
    ;0
  }•_while_¬ 0
}

# true original part 2 with •Exit:
# { # part 2
#   # •Show /(216‿117≡·⊑¨⊏⟜l)¨ p
#   c ← ↕≠l
#   i←0
#   {𝕊z:
#     a‿b ← 𝕩⊏c
#     # •Show ⟨"A", , ¯1+i+↩1, ×´⊑¨z⊏l⟩
#     a≠b?
#     # •Show ⟨a‿b,≠⍷c⟩
#     c a¨⌾((b=c)⊸/)↩
#     {𝕊:•Show ×´⊑¨z⊏l⋄•Exit 1}⍟⊢ 1= ≠⍷c
#     @
#     ;@
#   }¨ p
#   •Show ×´3↑∨/⁼c
# }
