#!/usr/bin/env bqn
⟨Ints, SplitF, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩SplitF Ints¨ •FLines 2024‿13 Input •args

# ≡´ (⟨r0,r1⟩ - ⟨a0,a1⟩×an) ÷ ⟨b0,b1⟩
# ((r0 - a0×an) ÷ b0) = (r1 - a1×an) ÷ b1
# (b1 × (r0 - a0×an)) = (r1 - a1×an) × b0
# (b1×r0) - b1×a0×an = (r1×b0) - a1×an×b0
# (b1×r0) = (r1×b0) + b1×a0×an - a1×an×b0
# ((b1×r0) - (r1×b0)) = b1×a0×an - a1×an×b0
# ((b1×r0) - (r1×b0)) = an×(b1×a0 - a1×b0)
# an = ((b1×r0) - (r1×b0)) ÷ (b1×a0 - a1×b0)

Calc ← { a‿b‿r:
  ah ← -´ r×⌽b
  al ← -´ a×⌽b
  0=al|ah?
  an ← ah÷al
  bh ← (⊑r) - an×⊑a
  bl ← ⊑b
  0=bl|bh?
  (3×an) + bh÷bl
  ; 0
}

•Show +´ Calc¨ l
•Show +´ (Calc 1e13⊸+⌾(2⊸⊑))¨ l
