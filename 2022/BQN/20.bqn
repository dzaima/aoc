#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "utils.bqn"
l ← SInts •FChars ≠◶"20.in"‿⊑ •args

F ← { am 𝕊 l:
  is ← ↕≠𝕩
  r ← is { 𝕨𝕊n:
    v ← n⊑l
    {n⊸∾∘(v⌽⊢)1↓𝕩}∘((⊑𝕨⊐n)⌽⊢) 𝕨 # ∘s can be ⌾s to restore positions somewhat
  }˜´⌽ ∾am⥊<is
  
  1000‿2000‿3000 {+´ ((≠𝕩)|𝕨+⊑𝕩⊐0) ⊏ 𝕩} r⊏l
}

•Show 1 F l
•Show 10 F l×811589153