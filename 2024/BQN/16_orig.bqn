#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿16 Input •args
w←l='#'
z←¯1000000
# •Show l
•Show best←⋈⁼⌊´-z-(<l='E') /○⥊¨ q←{
  (¬w)⊸×¨ ({⌊´⟨1⊸⌽𝕩,¯1⊸⌽𝕩⟩}𝕩+1000) ⌊ 𝕩⌊⟨»,»˘,«,«˘⟩{𝕎𝕩}¨𝕩+1
}_fx_≢ {⟨0¨𝕩,𝕩,0¨𝕩,0¨𝕩⟩} ⊏⟜0‿z l='S'

# •Show best
# •Show 2‿2 ⥊ {𝕩++˜1e308×𝕩=-z} q-z
# •Show {
  
# } {⟨0¨𝕩,𝕩,0¨𝕩,0¨𝕩⟩}l='E'

# •Show (¬w)⊸∧¨ (•Show⌾(2⊸⊑) q-z) = •Show⌾(2⊸⊑) best+z-˜{
#   (¬w)⊸×¨ ({⌊´⟨1⊸⌽𝕩,¯1⊸⌽𝕩⟩}𝕩+1000) ⌊ 𝕩⌊⟨»,»˘,«,«˘⟩{𝕎𝕩}¨𝕩+1
# }_fx_≢ ⊏⟜0‿z¨ {⟨0¨𝕩,𝕩,0¨𝕩,0¨𝕩⟩}l='E'

•Show +´⥊ ∨´{
  # ∨´⟨𝕩, ¯1⌽(¯1⌽q) = (𝕩×q)+1000, 1⌽(1⌽q) = (𝕩×q)+1000, (⟨«,«˘,»,»˘⟩{𝕎𝕩}¨𝕩)×q=¯1+⟨«,«˘,»,»˘⟩{𝕎𝕩}¨q⟩
  # •Delay 0.2
  # •Show 𝕩
  ∨´⟨𝕩, (1⌽𝕩) ∧ (¬w)⊸∧¨q=1⌽q-1000, (¯1⌽𝕩) ∧ (¬w)⊸∧¨q=¯1⌽q-1000, (⟨«,«˘,»,»˘⟩{𝕎𝕩}¨𝕩) ∧ (¬w)⊸∧¨ q=¯1+⟨«,«˘,»,»˘⟩{𝕎𝕩}¨q⟩
}_fx_≢ (<l='E')∧q=z+best
# •Out "E"

