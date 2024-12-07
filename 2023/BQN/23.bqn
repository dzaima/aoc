#!/usr/bin/env bqn
⟨Tr, MDSlash, _fx_, Input⟩ ← •Import "../../utils/utils.bqn"
inp ← >•FLines 2023‿23 Input •args
w ← inp='#'
nw ← ¬w
z ← 0¨ inp

{
  u ← (inp∊"^.") ∧ »nw
  d ← (inp∊"v.") ∧ «nw
  l ← (inp∊"<.") ∧ »˘nw
  r ← (inp∊">.") ∧ «˘nw
  next ← (<¨↕∘≢)⊸+ {@⊸≢¨⊸/ 𝕩}¨ Tr ⟨¯1‿0, 1‿0, 0‿¯1, 0‿1⟩ {⊑⟜@‿𝕨¨ 𝕩}¨ u‿d‿l‿r
  Run ← { pos‿vis:
    u ← 1⌾(pos⊸⊑)vis
    @⊸≢¨⊸/ {𝕩⊑vis? @; ⟨𝕩, u⟩}¨ pos⊑next
  }
  
  yE ← ¯1+≠inp
  mx ← 0
  i ← 0
  {
    mx⌈↩ i×∨´ yE = ⊑∘⊑¨ 𝕩
    i+↩ 1
    ∾Run¨ 𝕩
  }•_while_{×≠𝕩} ⟨{⟨𝕩, 1⌾(𝕩⊸⊑)z⟩} 0⋈⋈⁼/'.'=⊏inp⟩
  •Show mx
}

{
  cj ← {𝕩×2<+´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}nw # conjunctions
  cj∨↩ nw ∧ ↕⊸(=⟜0 ∨ ⊣=¯1+⊢) ≠inp # add in start & end
  cji ← MDSlash cj
  
  sln ← nw ∧ ¬cj # straight line
  cjd ← { # distances between all conjunctions
    cjc ← ∞¨ cji
    i ← 0
    {
      n ← ∨´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩
      cjc⌊↩ i+÷cji⊑n∧¬𝕩
      i+↩ 1
      𝕩∨sln∧n
    }_fx_≢ 1⌾(𝕩⊸⊑) z
    cjc
  }¨ cji
  
  cjc ← ∞≠cjd
  cjci ← /¨ cjc
  cjde ← ∞⊸≠⊸/¨ cjd
  mx ← 0
  ln ← ¯1+≠cjd
  Run ← { v𝕊d: # scan all paths through conjunctions
    l  ← ¯1⊑v
    ns ← l⊑cjci
    ds ← l⊑cjde
    m  ← ¬ns∊v
    (d×l=ln) ⌈´ (v⊸∾¨ m/ns) Run¨ d+m/ds
  }
  •Show ⟨0⟩ Run 0
}