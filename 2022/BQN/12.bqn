#!/usr/bin/env bqn
l ← >•FLines ≠◶"12.in"‿⊑ •args

h ← l-'a'
s ← l='S'
e ← l='E'

h×↩ ¬s∨e
h+↩ e×25

pd ← (h-1)≤«h
pu ← (h-1)≤»h
pl ← (h-1)≤»˘h
pr ← (h-1)≤«˘h

Step ← {∨´⟨𝕩, »pd×𝕩, «pu×𝕩, «˘pl×𝕩, »˘pr×𝕩⟩}
F ← {𝕊end: ⊑{n‿c: ⟨n+1,Step c⟩}•_while_{n‿c: ¬∨´⥊c∧end} ⟨0, e⟩}

•Show F s
•Show F h=0