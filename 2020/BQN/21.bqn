#!/usr/bin/env cbqn
⟨Split⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"21.in"‿⊑ •args
[is0,as0] ← ⍉>{' 'Split𝕩}‿{1↓¨','Split ¯1↓8↓𝕩}⊸({𝕎𝕩}¨)¨ '(' Split¨ l # ingredients, allergens

ins ← ⍷∾is0 # ingredient names
ans ← ⍷∾as0 # allergen names

is ← ins⊸⊐⌾∾ is0 # ingredient indexes instead of names
as ← ans⊸⊐⌾∾ as0 # allergen indexes instead of names

ip ← (≠ins) ↑⟜(/⁼)¨ is # for each food, whether each ingredient is present
aw ← {(∾𝕩)⊔/≠¨𝕩} as # which food each allergen is present in

ao ← (∧´⊏⟜ip)¨ aw # for each allergen, which ingredients it could be in
# •Show ⟨>ip, ≍˘aw, >ao⟩

ic ← /⁼∾is # ingredient counts
ok ← ∨´ao # ingredients which may contain allergens
•Show +´(¬ok)/ic

ao2 ← ok⊸/¨ ao # filter out the impossible ingredient options
ao2to1 ← /ok # the ao-index for each ao2
where ← /¨ <˘⍉>ao2 # which food potentially is each allergen
done ← 0¨⊑ao2 # which foods are completed; mutated
count ← +´¨ ao2 # count of possible allergens for each food; mutated
a2i ← ⍋⊸⊏˝⍉>{𝕊:
  n ← ⊑count⊐1 # allergen with only one ingredient option left
  m ← (¬done)∧n⊑ao2 # mask of that only ingredient
  i ← ⋈⁼ / m # and its index
  count -⟜1⌾((i⊑where)⊸⊏)↩
  done∨↩ m
  n‿i
}¨ ↕≠count

•Out {𝕨∾','∾𝕩}´ ans ⍋⊸⊏ (a2i⊏ao2to1)⊏ins