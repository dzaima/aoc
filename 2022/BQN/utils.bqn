# ⟨RB, B10, Num, SInt, Ints, SInts, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "../../utils/utils.bqn"
RB ⇐ 2⊸×⊸+˜´⌽
B10 ⇐ 10⊸×⊸+˜´∘⌽
Num ⇐ B10 -⟜'0'
SInt ⇐ {'-'=⊑𝕩?-Num 1↓𝕩;Num𝕩}
Ints ⇐ {Num¨((¯1+⊢×·+`»⊸<)𝕩∊'0'+↕10)⊔𝕩}
SInts ⇐ {SInt¨((¯1+⊢×·+`»⊸<)𝕩∊'-'∾'0'+↕10)⊔𝕩}
Split ⇐ {((¯1+⊢×·+`»⊸<)¬𝕩=𝕨)⊔𝕩}
SplitF ⇐ {((¯1+⊢×·+`»⊸<)¬𝕨⊸≡¨𝕩)⊔𝕩}
ReIndex ⇐ {<˘𝕨|⎉1⌊𝕩÷⌜1«×`⌾⌽𝕨} # convert indices into a shape-⟨×´𝕨⟩ array into corresponding indices into a shape-𝕨 one
MDSlash ⇐ {(0.13×≠⥊𝕩)>+´⥊𝕩? (≢𝕩) ReIndex /⥊𝕩; /○⥊⟜↕⟜≢ 𝕩}
Unjoin ⇐ {((≠¨𝕨)/↕≠𝕨) ⊔ 𝕩}
Count ⇐ ⊐˜∘⊣⊏ ≠∘⊣↑ /⁼∘⊐
GCD ⇐ {𝕨(|𝕊⍟(>⟜0)⊣)𝕩}
LCM ⇐ ×÷GCD
_fx_ ⇐ {F _𝕣_ 𝔾 𝕩: ⊑{p‿n:n⋈F n}•_while_(𝔾´) 𝕩⋈𝔽𝕩} # fixed-point
_fi_ ⇐ {F _𝕣_ 𝔾 𝕩: ¯1↓{𝕩∾<F ¯1⊑𝕩}•_while_(𝔾´¯2↑⊢) 𝕩⋈𝔽𝕩} # fixed-point with immediates
T ⇐ {
  1≡=𝕩? <⎉1⍉>𝕩;
  1≡=⊑𝕩? <˘⍉⁼>𝕩;
  =⊸{<⎉𝕨⍉⍟𝕨>𝕩} 𝕩
} # depth-transpose
