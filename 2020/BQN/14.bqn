#!/usr/bin/env cbqn
⟨RB,Ints⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"14.in"‿⊑ •args

i ← {
  'a'=1⊑𝕩? # mask
    0⋈ ('X'⊸= ⋈ '1'⊸=) 7↓𝕩
  ; # else, mem
    1⋈ Ints 𝕩
}¨l

it‿ia ← <˘⍉>i # instruction type & arguments

UB ← (2| ·⌊ (⌽÷2⋆↕36)⊸×) # unpack binary

wm ← {𝕩⊏˜¯1+𝕩⍋↕≠it} /¬it # map from write instr to the nearest preceding mask
wim ← (it/wm)⊏ia # write instruction masks
wimX ← 0⊑¨wim # write ins mask keep/float
wimS ← 1⊑¨wim # write ins mask set

wil ← it/ia # write ins arguments
wia ← 0⊑¨wil # write ins addresses
wiv ← 1⊑¨wil # write ins values

{
  wl ← ∊⌾⌽ wia # mask of which Write instructions are the Last for this address
  •Show +´RB¨ (wl/wimS)∨(wl/wimX)∧UB¨ wl/wiv
}

{
  e ← 2⋆+´¨wimX # number of sub-writes
  ewa ← ∾((wimS ∨ UB¨ wia)∧¬wimX) {𝕨<⊸∨ ⥊↕1+𝕩}¨ wimX # expanded write addresses
  ewv ← e/wiv # expanded write values
  wl ← ∊⌾⌽ ewa # mask of which Write instructions are the Last for this address
  •Show +´wl/ewv
}