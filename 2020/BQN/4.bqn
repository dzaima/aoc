#!/usr/bin/env cbqn
⟨Num, SplitF, Split⟩ ← •Import "utils.bqn"
l ← ∾¨ ' 'Split¨¨ ⟨⟩ SplitF •FLines ≠◶"4.in"‿⊑ •args

req ← "byr"‿"iyr"‿"eyr"‿"hgt"‿"hcl"‿"ecl"‿"pid"∾¨ ':'

B ← {∧´ req∊4↑¨𝕩} # basic check for required fields
IsNum ← {∧´𝕩∊'0'+↕10}


•Show +´ B¨ l
•Show +´{
  byr‿iyr‿eyr‿hgt‿hcl‿ecl‿pid ← 4↓¨ ⊑¨ (≠req) ↑ (req⊐4↑¨𝕩)⊔ 𝕩
  ∧´ 4‿4‿4‿3‿7‿3‿9≤≠¨ byr‿iyr‿eyr‿hgt‿hcl‿ecl‿pid? # min len
  ∧´ 4‿4‿4‿∞‿7‿3‿9≥≠¨ byr‿iyr‿eyr‿hgt‿hcl‿ecl‿pid? # max len
  
  ∧´ IsNum¨ byr‿iyr‿eyr‿pid?
  ∧´ (≥⟜1920‿2010‿2020 ∧ ≤⟜2002‿2020‿2030) Num¨ byr‿iyr‿eyr?
  
  IsNum ¯2↓hgt?
  (¯2↑hgt) {"cm"≡𝕨? (≥⟜150∧≤⟜193)𝕩; "in"≡𝕨? (≥⟜59∧≤⟜76)𝕩; 0} Num ¯2↓hgt?
  
  '#'=⊑hcl?
  ∧´(¯6↑hcl)∊∾"0a"+⟜↕¨10‿6?
  
  ⊑ecl<⊸∊"amb"‿"blu"‿"brn"‿"gry"‿"grn"‿"hzl"‿"oth"?
  
  1; 0
}¨ B¨⊸/ l