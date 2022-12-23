#!/usr/bin/env cbqn
⟨RB, B10, Num, SInt, Ints, SInts, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← '#'=>•FLines ≠◶"23.in"‿⊑ •args

Step ← {
  # 𝕩 ↩ ¯1‿¯1⌽(2+≢𝕩)↑𝕩
  𝕩 ↩ •internal.Squeeze 0¨∘⊏⊸(∾∾⊣)0∾˘𝕩∾˘0 # CBQN's slow at the above
  n ← (»˘+«˘+⊢) (»+«+⊢) 𝕩
  s ← 𝕩∧1=n # stay where you are
  
  ah ← ¬(»˘∨«˘∨⊢) 𝕩
  av ← ¬(» ∨« ∨⊢) 𝕩
  an ← »ah ⋄ ae ← «˘av
  as ← «ah ⋄ aw ← »˘av
  
  o ← 4-+´∨`𝕨⌽an‿as‿aw‿ae
  s∨↩ o=4
  d ← (5×s∨¬𝕩)+4|𝕨+o # the direction each elf wants to move (≥4 if doesn't)
  
  c ← ((»1=d)∧«0=d) ∨ («˘2=d)∧»˘3=d # conflict
  co ← ((1=d)∧«c) ∨ ((0=d)∧»c) ∨ ((2=d)∧»˘c) ∨ ((3=d)∧«˘c) # conflict origin
  m ← 𝕩 ∧ (¬s) ∧ ¬co # all moving elves
  (𝕩∧¬m) ∨ («m∧d=0) ∨ (»m∧d=1) ∨ («˘m∧d=2) ∨ (»˘m∧d=3) # move elves
}

Trim ← {{𝕩/˜(∨`∧∨`⌾⌽)∨˝˘𝕩}∘⍉⍟2 𝕩}
Step2 ← {n‿b: ⟨n+1, n Step b⟩}

# •Show {1<≡𝕩? 𝕊¨𝕩; ∧´⥊(𝕩=0)∨𝕩=1? ⊏⟜".#" 𝕩; '0'+𝕩} {𝕩{(-⌊0.5×𝕩-≢𝕨)⌽𝕩↑𝕨}¨<⌈´≢¨𝕩}⎊⊢ l<⊸∾ (<l) Step˜` ↕5

•Show +´⥊¬ Trim 1⊑ Step2⍟10 0‿l
•Show 1+⊑ Trim⌾(1⊸⊑)∘Step2 _fx_(≢○(1⊸⊑)) 0‿l