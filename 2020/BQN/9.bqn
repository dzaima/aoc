#!/usr/bin/env bqn
⟨Ints, MDSlash⟩ ← •Import "../../utils/utils.bqn"
l ← Ints •FChars ≠◶"9.in"‿⊑ •args
w ← 25


weak ← l⊑˜w+ ⋈⁼/ ¬∨˝˘ (w↓l) = (⥊+⌜˜)˘ ¯1↓w↕l
•Show weak

e‿s ← ⊑ MDSlash weak= -⌜˜ 0»+`l
•Show (⌊´+⌈´) s↓e↑l