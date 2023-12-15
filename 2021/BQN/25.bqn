#!/usr/bin/env bqn
l ← ".>v"⊐>•FLines ≠◶"25.in"‿⊑ •args

Step ← {
  Rot ← 𝕨◶⟨!,⌽˘,⌽⟩
  e ← (𝕩=0) × ¯1 Rot 𝕨=𝕩
  (¬1 Rot e) × (e×𝕨) + (¬e)×𝕩
}´⟜(⌽1+↕2)

•Show 1+⊑{n‿·‿p: ⟨n+1,p,Step p⟩}•_while_{n‿p‿c: p≢c} ⟨0 ⋄ l ⋄ Step l⟩