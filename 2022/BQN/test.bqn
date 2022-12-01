#!/usr/bin/env cbqn
⟨Split⟩ ← •Import "utils.bqn"
Ex ← {(@+10) Split 1⊑ •SH ⋈ •file.At 𝕩}
skip ← (¬⊑(<"all")∊•args)/⟨⟩
Test ← { 𝕊 n‿x‿o:
  {
    ⊑n∊skip? •Out "Skipping day "∾•Repr n;
    ("day "∾•Repr n) ! o ≡ Ex x
  }
}
Test ⟨1,  "./1.bqn", "70369"‿"203002"⟩