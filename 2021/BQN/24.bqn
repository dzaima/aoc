#!/usr/bin/env cbqn
⟨SInt⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"24.in"‿⊑ •args

# guesses a digit at a time, by trying 100…1000 (depending on position) random inputs (with some mutation)

Train ← {
  inpCtr ← 0
  Res ← ⊢
  
  _set ← {𝕨⌾(𝕗⊸⊑)𝕩}
  { 𝕊ins:
    ty ← 3↑ins
    v1 ← (4⊑ins)-'w'
    {
      ty≡"inp"?
        Res ↩ (inpCtr⊑⊣) v1 _set Res
        inpCtr+↩1;
      # else
        Div ← (××⌊∘|)÷ # alternative funky dzaima/BQN: ⌊⌾|÷
        Mod ← |˜
        op ← (⊑"duioq"⊐1⊑ty) ⊑ +‿×‿Div‿Mod‿=
        {
          (≥⟜'w'∧≤⟜'z')6⊑ins?
            v2 ← (6⊑ins)-'w'
            Res ↩ (((v1⊑⊢) Op v2⊑⊢) v1 _set ⊢) Res;
          # else
            n ← SInt 6↓ins
            Res ↩ (((v1⊑⊢) Op N) v1 _set ⊢) Res
        }
    }
  }¨𝕩
  3⊑⊢ Res 0‿0‿0‿0˙
}

Comp ← {
  inpCtr ← 0
  nl←⟨@+10⟩
  res ← "{w←0⋄x←0⋄y←0⋄z←0"∾nl
  { 𝕊ins:
    ty ← 3↑ins
    v1 ← 4⊑ins
    {
      ty≡"inp"?
        res∾↩ ∾⟨v1,"↩",•Repr inpCtr,"⊑𝕩",nl⟩
        inpCtr+↩1;
      # else
        op ← (⊑"duioq"⊐1⊑ty) ⊑ "+"‿"×"‿"((××⌊∘|)÷)"‿"|˜"‿"="
        {
          (≥⟜'w'∧≤⟜'z')6⊑ins?
            v2 ← 6⊑ins
            res∾↩ ∾⟨v1,"↩",v1,op,v2,nl⟩;
          # else
            n ← SInt 6↓ins
            #Res ↩ (((v1⊑⊢) Op N) v1 _set ⊢) Res
            res∾↩ ∾⟨v1,"↩",v1,op,•Repr n,nl⟩
        }
    }
  }¨𝕩
  •BQN ∾⟨res,nl,"z}"⟩
}

f ← Comp l
# f ← Train l # alternate compiler



Any ← { # •Show 𝕩 # uncomment for progress display
  initV ← 𝕩
  initL ← ≠𝕩
  
  Mut ← {𝕊i:
    opt ← ⥊(1+↕9) {𝕨⌾(𝕩⊸⊑)i}⌜ initL+↕14-initL
    opt⊑˜(⊑⊢⊐⌊´)F¨ opt
  }
  0 { 𝕨𝕊1:1;𝕨𝕊0:
    i0 ← initV∾1+(14-initL)•rand.Range 9
    0≡F 2⊑{s‿·‿p: ⟨s+1⋄p⋄Mut p⟩}•_while_{s‿p‿n: (s<20)∧p≢n} ⟨0 ⋄ i0 ⋄ Mut i0⟩
  }´ ↕initL⊑1000‿1000‿500‿500‿500‿100‿100‿100‿100‿100‿100‿100‿100‿100
}
# •Show Any 1‿1‿1
# •Show Any ⥊1
# •Show 1e9×1e6 F•_timed "11711691612189"-'0'
Find ← { 𝕊order:
  c ← ⟨⟩
  {𝕊:
    c∾↩ @ {𝕨𝕊@:Any c∾𝕨?𝕨;@}⍟(@≡⊢)´ ⌽order
  }¨↕10
  c∾⊑(0=(F c∾⊢)¨)⊸/ ⥊∾⌜´4⥊<⌽order
}

•Out '0'+Find ⌽1+↕9
•Out '0'+Find  1+↕9


# {
#   𝕩+↩1
#   i ← ("1171169"-'0')∾𝕩∾("189"-'0')
#   0=F i? •Show '0'+i;0
# }¨ ⥊↕4⥊9
