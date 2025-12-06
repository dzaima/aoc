#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ¯1(↓⋈⊑) •FLines 2025‿6 Input •args

o ← ×‿+⊏˜ '+'= ' '⊸≠⊸/ b # extract the operations from the last line, convert to BQN objects

S ← {+´ o{𝕎´𝕩}¨ 𝕩} # all the folds
•Show S <˘ ⍉ ⟨≠a,∘⟩⥊ ∾Ints¨ a # for part 1, can just boringly extract all numbers in each row

# part 2:
nums ← 0 { row 𝕊 acc: # fold over rows:
  sp ← row=' '
  (sp×acc) + (¬sp)× (10×acc) + row-'0' # add digit row if not space
  # acc ⊣⌾(sp⊸/) (10×acc) + row-'0' # TODO this + (0¨⊑a) accumulator start when it's fast (and/or Case)
}´ ⌽a

•Show S nums⊔˜ (⊢-˜¬×+`) 0=nums # group by zeroes (0 is produced for all-spaces columns, and isn't present otherwise)

### alternative part 2:
# ta ← ⍉>a # for part 2, work on transposed values
# g ← (¬/+`) ∧˝˘' '=ta # find all-spaces rows (i.e. columns in input pre-tranpose), and create a group mask for each non-empty row
# •Show S g ⊔ Ints ⥊' '∾˘ta # parse all transposed numbers (making sure to not let numbers from adjacent columns merge)
