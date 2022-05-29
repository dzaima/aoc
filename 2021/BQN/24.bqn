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

OptComp ← { 𝕊:
  inpCtr ← 0
  nl←⟨@+10⟩
  val0 ← ⟨'c',0⟩
  vars ← 4⥊<val0
  SetVar ← {vars𝕩⌾(𝕨⊸⊑)↩}
  instrs ← ⟨⟩
  instrUsage ← ↕0
  IncUsage ← {instrUsage+⟜1⌾((1⊑𝕩)⊸⊑)↩}⍟('r'≡⊑)
  AddInstr ← { opid‿r‿la‿ra:
    IncUsage¨ la‿ra
    instrs∾↩ <⟨opid, la, ra⟩
    instrUsage∾↩ 0
    r SetVar⍟(r≢@) ⟨'r'⋄¯1+≠instrs⟩
  }
  
  { 𝕊ins:
    ty ← 3↑ins
    v1 ← 'w'-˜4⊑ins
    #        012345
    #        i+×÷|=
    opid ← ⊑"nduioq"⊐1⊑ty
    {
      opid≡0? v1 SetVar ⟨'i'⋄inpCtr⟩ ⋄ inpCtr+↩1;
      v1v ← v1⊑vars
      v2v ← {(≥⟜'w'∧≤⟜'z')6⊑ins? vars⊑˜'w'-˜6⊑ins; ⟨'c'⋄SInt 6↓ins⟩}
      {
        "cc"≡⊑¨v1v‿v2v?
          v1 SetVar ⟨'c',v1v opid◶⟨@,+,×,(××⌊∘|)÷,|˜,=⟩○(1⊸⊑) v2v⟩;
        (⊑(<val0)∊v1v‿v2v) ∧ opid≡1? # 0+x, x+0
          v1 SetVar (val0≡v1v)⊑v1v‿v2v;
        (⊑(<val0)∊v1v‿v2v) ∧ opid≡2? # 0×x, x×0
          v1 SetVar val0;
        (v2v≡⟨'c'⋄1⟩) ∧ opid≡3? # x÷1
          @;
        # default:
          AddInstr opid‿v1‿v1v‿v2v
      }
    }
  }¨ 𝕩
  IncUsage 3⊑vars
  
  res ← ∾⟨"{",1↓∾"‿i"⊸∾¨•Repr¨↕14,"←𝕩⋄RTZ←××⌊∘|",nl⟩
  GenOp ← {
    𝕨𝕊'c'‿n: •Repr n;
    𝕨𝕊'r'‿n: 𝕨{1<n⊑instrUsage? "t"∾•Repr n; {"("∾𝕩∾")"}⍟𝕨 GenInstr n⊑instrs}𝕩;
    𝕨𝕊'i'‿n: "i"∾•Repr n;
    "idk"
  }
  GenInstr ← { opid‿l‿r:
    {
      opid≡4? ∾⟨         1 GenOp r ⋄ "|" ⋄ 0 GenOp l⟩;
      opid≡3? ∾⟨"RTZ " ⋄ 1 GenOp l ⋄ "÷" ⋄ 0 GenOp r⟩;
      ∾⟨1 GenOp l ⋄ opid ⊑ ""‿"+"‿"×"‿"((××⌊∘|)÷)"‿"|˜"‿"=" ⋄ 0 GenOp r⟩
    }
  }
  (↕≠instrs) {res∾↩ ∾⟨"t",•Repr𝕨,"←",GenInstr 𝕩,nl⟩}¨○((instrUsage>1)⊸/) instrs
  •BQN res ∾ ∾⟨0 GenOp 3⊑vars ⋄ nl,"}"⟩
}

# f ← Train l # compile to trains
# f ← Comp l # simple transpilation to BQN
f ← OptComp l # SSAified transpilation to BQN with constant folding

# •Show 2e5 F•_timed 14⥊5
# ! 4154727576 ≡ F 10|↕14


Any ← { # guesses if the prefix 𝕩 gives any valid model numbers
  # •Show 𝕩 # uncomment for progress display
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

Find ← { 𝕊order:
  c ← ⟨⟩
  {𝕊:
    c∾↩ @ {𝕨𝕊@:Any c∾𝕨?𝕨;@}⍟(@≡⊢)´ ⌽order
  }¨↕10
  c ∾ ⊑(0=(F c∾⊢)¨)⊸/ ⥊∾⌜´4⥊<⌽order
}

•Out '0'+Find ⌽1+↕9
•Out '0'+Find  1+↕9
