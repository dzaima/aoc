#!/usr/bin/env bqn
# part 1: 9:21; both: 16:39
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨','Split⊑•FLines 2025‿2 Input •args

_F_ ← { Trim _𝕣_ p2 𝕩: # originally part 2 was modified in-place
  r ← •Repr¨ 𝕩
  g ← Trim∘(≠¨) r
  +´+´¨ ({
    n←≠𝕩
    k ← ≠⊑𝕩
    m ← >𝕩
    ds ← {p2? (0=|⟜k)⊸/ 2↓↕1+k; ⋈2}
    ∨´{𝕩{2=𝕨? ≡˝˘𝕩;(1=≠∘⍷)¨<˘𝕩} ⟨n,𝕩,∘⟩⥊m}¨ ds
  }¨ ×∘≠¨⊸/ g ⊔ r) /¨ ×∘≠¨⊸/ g⊔𝕩
}

# •Show +´{F (⊑𝕩)+↕¬˜´𝕩}¨ ⋈⟨101008,101012⟩

•Show +´{{m-˜𝕩×¬m←2|𝕩} _F_ 0 (⊑𝕩)+↕¬˜´𝕩}¨ l
•Show +´{            ⊢ _F_ 1 (⊑𝕩)+↕¬˜´𝕩}¨ l
