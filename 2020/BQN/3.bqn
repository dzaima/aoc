#!/usr/bin/env cbqn
l ← '#'=•FLines ≠◶"3.in"‿⊑ •args

F ← { r‿d:
  v ← ↕⌈ d÷˜≠l
  +´ ((≠⊑l)|r×v) ⊑¨ (d×v)⊏l
}

•Show F 3‿1
•Show ×´F¨ ⟨1‿1, 3‿1, 5‿1, 7‿1, 1‿2⟩