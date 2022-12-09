#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "utils.bqn"
l ← {(Ints 𝕩)/(𝕩∊"RLUD")/𝕩} •FChars ≠◶"9.in"‿⊑ •args

dx ← +`("RL"⊐l)⊏1‿¯1‿0
dy ← +`("UD"⊐l)⊏¯1‿1‿0
hps ← <˘⍉dx≍dy

Step ← { t𝕊h:
  1<⌈´|h-t? t+×h-t;
  𝕨
}
F ← (<0‿0) Step` ⊢

•Show¨ +´∘∊¨ F⍟1‿9 hps