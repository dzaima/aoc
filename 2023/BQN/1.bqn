#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2023‿1 Input •args

•Show +´•Parsefloat¨ {𝕩⊏˜0‿¯1⊏/𝕩∊'0'+↕10}¨ l

names ← (⋈¨'0'+↕10)≍@‿"one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
•Show +´•Parsefloat¨ {
  p ← ∾¨˝ /¨ ⍷⟜𝕩¨ names
  '0'+{⊑/∨´¨𝕩}¨ ((⌊´⋈⌈´) ∾p) = <p
}¨ l