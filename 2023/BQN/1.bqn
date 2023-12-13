#!/usr/bin/env bqn
l ← •FLines ≠◶"1.in"‿⊑ •args

•Show +´•Parsefloat¨ {𝕩⊏˜0‿¯1⊏/𝕩∊'0'+↕10}¨ l

names ← (⋈¨'0'+↕10)≍@‿"one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
•Show +´•Parsefloat¨ {
  p ← ∾¨˝ /¨ ⍷⟜𝕩¨ names
  '0'+{⊑/∨´¨𝕩}¨ ((⌊´⋈⌈´) ∾p) = <p
}¨ l