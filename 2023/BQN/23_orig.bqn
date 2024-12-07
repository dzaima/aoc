#!/usr/bin/env bqn
⟨MDSlash, _fx_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2023‿23 Input •args
w ← l='#'
u ← l∊"^."
d ← l∊"v."
le← l∊"<."
r ← l∊">."


z ← 0¨l
Run ← { prev‿curr:
  {⟨1⌾(𝕩⊸⊑)prev, 1⌾(𝕩⊸⊑)z⟩}¨ MDSlash (¬w∨prev)∧∨´⟨»curr∧d,«curr∧u, «˘curr∧le, »˘curr∧r⟩
}
c ← 0
{
  c+↩1
  # •Show ≠𝕩
  ∾Run¨ 𝕩
}•_while_{×≠𝕩} ⋈ ⋈˜('.'=⊏l)⌾⊏ 0¨l
•Show c-1

cj ← {𝕩×2<+´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}¬w # conjunctions
cj∨↩ (¬w) ∧ ↕⊸(=⟜0 ∨ ⊣=¯1+⊢) ≠w # add in start & end
cji ← MDSlash cj

sln ← (¬w) ∧ ¬cj # straight line
cjd ← {
  cjc ← ∞¨ cji
  i←0
  {
    n ← ∨´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩
    cjc⌊↩ i+÷cji⊑n∧¬𝕩
    i+↩ 1
    𝕩∨sln∧n
  }_fx_≢ 1⌾(𝕩⊸⊑) z
  cjc
}¨ cji

cjc ← ∞≠cjd # connected
cjo ← (0¨cji)¨ cji # ok
cjde ← ∞⊸≠⊸/¨ cjd
mx ← 0
ln ← ¯1+≠cjd
{
  # •Show ≠𝕩
  ∾{v‿d: ⋄ l←¯1⊑v ⋄ mx⌈↩d×l=ln ⋄ n←/l⊑cjc ⋄ m←¬n∊v ⋄ (m/l⊑cjde) {⟨v∾𝕩,d+𝕨⟩}¨ m/n}¨𝕩
}•_while_(×≠) ⟨⟨0⟩‿0⟩
•Show mx