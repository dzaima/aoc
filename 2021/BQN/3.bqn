#!/usr/bin/env bqn
RB ← 2⊸×⊸+˜´⌽
_b ← {((≠𝕨)-𝕩) 𝔽 𝕩} # {≠⊸-𝔽⊢}
rs ← '0'-˜ •FLines ≠◶"3.in"‿⊑ •args
cs ← <˘⍉> rs
Filter ← {𝕊f:
  n←0
  RB rs⊑˜⊑{(n+↩1) ⊢ 𝕩/˜ (⊢(⊣≠F _b)+´) 𝕩⊏n⊑cs}•_while_(1≠≠) ↕≠rs
}

•Show rs (< ×○RB >)_b +´¨cs
•Show ×○Filter´ >‿≤
#{𝕊:×○(RB Filter⟜(cs∾⟨rs⟩))´ >‿≤}¨↕10000