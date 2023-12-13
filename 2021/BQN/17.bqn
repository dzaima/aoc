#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "../../utils/utils.bqn"
l ← ⊑•FLines ≠◶"17.in"‿⊑ •args
xs‿xe‿ys‿ye←SInts l
s←xs‿ys
e←xe‿ye

my ← 0
n ← 0
Step ← {⟨vy0 ⋄ p ⋄ v⟩: vx‿vy←v
  nx‿ny ← p+↩ v
  done ← ∧´(p≥s)∧p≤e
  my⌈´↩ done/vy0
  n+↩ +´done
  h ← (¬done)∧ny≥ys
  ⟨h/vy0 ⋄ (<h)/¨p ⋄ ⟨-⟜× h/vx ⋄ ¯1 + h/vy⟩⟩
}

Iota ← {x‿y: ⟨y/↕x ⋄ (x×y)⥊↕y⟩}
Step•_while_{×≠⊑𝕩} {x‿y: sz←⟨x,1+2×y⟩ ⋄ z←0⥊˜×´sz ⋄ v←x‿y-Iota sz ⋄ ⟨1⊑v ⋄ z‿z ⋄ v⟩} 1+s⌈○|e
•Show {2÷˜𝕩×𝕩+1}my
•Show n