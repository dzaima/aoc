#!/usr/bin/env cbqn
⟨SInts, Repr⟩ ← •Import "utils.bqn"
l ← {⟨'n'=1⊑𝕩 ⋄ 0‿1+<˘⍉3‿2⥊SInts𝕩⟩}¨ •FLines ≠◶"22.in"‿⊑ •args

# remove 𝕩 from the cube 𝕨; assumes there actually is an intersection
Diff ← {𝕊s‿e: ∧´s<e}¨⊸/ { ⟨sKx‿sKy‿sKz⋄eKx‿eKy‿eKz⟩ 𝕊 ⟨sRx‿sRy‿sRz⋄eRx‿eRy‿eRz⟩:
  sz ← (sKz⌈sRz) ⋄ ez ← (eKz⌊eRz)
  sy ← (sKy⌈sRy) ⋄ ey ← (eKy⌊eRy)
  ⟨
    ⟨sKx‿sKy‿eRz ⋄ 1⊑𝕨⟩
    ⟨⊑𝕨 ⋄ eKx‿eKy‿sRz⟩
    ⟨sKx‿eRy‿sz ⋄ eKx‿eKy‿ez⟩
    ⟨sKx‿sKy‿sz ⋄ eKx‿sRy‿ez⟩
    ⟨eRx‿sy‿sz ⋄ eKx‿ey‿ez⟩
    ⟨sKx‿sy‿sz ⋄ sRx‿ey‿ez⟩
  ⟩
}

Do ← {
  rs‿re ← ⋈˜ 3⥊<↕0
  
  Add ← {
    𝕊𝕩: 0𝕊𝕩;
    si𝕊as‿ae:
      i ← ∧´(as<si↓¨re)∧ae>si↓¨rs
      ∨´i?
        pos ← si+⊑/i
        iv ← pos⊑¨¨rs‿re
        pos Add¨ as‿ae Diff iv;
    ·𝕊·:
      rs‿re∾¨¨↩ 𝕩
      @
  }
  Sub ← {𝕊as‿ae:
    i ← ∧´(as<re)∧ae>rs
    iv ← i⊸/¨¨ rs‿re
    rs‿re (¬i)⊸/¨¨↩
    (/i) {𝕨 Add¨ 𝕩 Diff as‿ae}¨ <˘⍉>{<˘⍉>𝕩}¨ iv
  }
  
  {𝕊 ⟨on⋄c⟩: on◶Sub‿Add c}¨ 𝕩
  +´{×´-˜´𝕩} rs‿re
}

•Show Do {⟨v⋄s‿e⟩: ∧´ (s≥¯50)∧e≤50}¨⊸/ l
•Out Repr Do l