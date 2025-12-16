# ⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
RB ⇐ 2⊸×⊸+˜´⌽
B10 ⇐ 10⊸×⊸+˜´⌽
Num ⇐ •ParseFloat
Repr ⇐ {𝕩<1e10? •Repr𝕩; ∾{𝕩«10⥊'0'}⌾(1⊸⊑) •Repr¨ 1e10(⌊∘÷˜⋈|)𝕩}

LCM ⇐ •math.LCM
GCD ⇐ •math.GCD

Ints ⇐ {•ParseFloat¨((¯1+⊢×·+`»⊸<)𝕩∊'0'+↕10)⊔𝕩}
SInts ⇐ {•ParseFloat¨((¯1+⊢×·+`»⊸<)𝕩∊'-'∾'0'+↕10)⊔𝕩}

Split ⇐ {((¯1+⊢×·+`»⊸<)¬𝕩=𝕨)⊔𝕩}
SplitF ⇐ {((¯1+⊢×·+`»⊸<)¬𝕨⊸≡¨𝕩)⊔𝕩}

Indices ⇐ <⥊¨·⊣⌜˜`⌾⌽↕¨ # <˘⍉⁼>↕𝕩
ReIndexH ⇐ {𝕨|⎉1⌊𝕩÷⌜1«×`⌾⌽𝕨}
ReIndex ⇐ <˘ ReIndexH # convert indices into a shape-⟨×´𝕨⟩ array into corresponding indices into a shape-𝕨 one
MDSlash ⇐ {(0.13×≠⥊𝕩)>+´⥊𝕩? (≢𝕩) ReIndex /⥊𝕩; /○⥊⟜↕⟜≢ 𝕩} # multi-dimensional /𝕩
MDSlashI ⇐ {<˘⍉ (≢𝕩) ReIndexH /⥊𝕩} # MDSlash but transposed output

Unjoin ⇐ {((≠¨𝕨)/↕≠𝕨) ⊔ 𝕩}

Count ⇐ ⊐˜∘⊣⊏ ≠∘⊣↑ /⁼∘⊐

_fx_ ⇐ {F _𝕣_ 𝔾 𝕩: ⊑{p‿n:n⋈F n}•_while_(𝔾´) 𝕩⋈𝔽𝕩} # fixed-point
_fi_ ⇐ {F _𝕣_ 𝔾 𝕩: ¯1↓{𝕩∾<F ¯1⊑𝕩}•_while_(𝔾´¯2↑⊢) 𝕩⋈𝔽𝕩} # fixed-point with immediates

SelectInds ← {+´ (1«×`⌾⌽≢𝕩) × <˘⍟(2≤=) 𝕨}
Select ⇐ SelectInds⊏⥊∘⊢
_underSelect_ ⇐ {𝔽⌾((𝕘 SelectInds 𝕩)⊏⥊) 𝕩} # fast version of 𝔽⌾((<˘⍉𝕘)⊸⊑) 𝕩

Tr ⇐ { # depth-transpose
  1≡=𝕩? <⎉1⍉>𝕩;
  1≡=⊑𝕩? <˘⍉⁼>𝕩;
  =⊸{<⎉𝕨⍉⍟𝕨>𝕩} 𝕩
}
TW ⇐ { # transposed depth-separated 𝕨↕arr
  1=≠𝕨? (𝕨¬˜≠𝕩)↑¨↓⟜𝕩¨↕𝕨;
  <⎉(≠𝕨) ((≢𝕩)-𝕨-1) ↕ 𝕩
}

base ← •file.At "../"
Input ⇐ {· 𝕊 ⟨path⟩: path; y‿d 𝕊 ⟨⟩: ∾⟨base, •Repr y, "/inputs/", •Repr d, ".txt"⟩}

MemoInit ⇐ { 𝕊 init:
  {F _𝕣: (•HashMap´init){𝔽_𝕣𝕩: 𝕗.Has𝕩? 𝕗.Get 𝕩; 𝔽_𝕣𝕩: 𝕩⊸𝕗.Set⊸⊢ F 𝕩}}
}
memo ⇐ MemoInit ⟨⟩‿⟨⟩

BrailleDisplay ⇐ {@+10240+256|⥊˘ 1‿8•bit._cast 0‿2‿4‿1‿3‿5‿6‿7⊸⊏⎉1 ⥊⎉2 0‿2‿1‿3⍉⁼ 4‿2(⊢⥊˜·⥊≢⊸÷˜≍˘⊣) (4‿2×·⌈4‿2÷˜≢)⊸↑ 𝕩}

GetSmtEnv ← {𝕊: getSmtEnv ↩ •SH "printenv"‿"BQN_SMT"}
SMT ⇐ { 𝕊 options:
  c‿o‿e ← GetSmtEnv@
  {𝕊: •Out "Needs bqn-smt! Set the environment variable BQN_SMT to a path to https://codeberg.org/dzaima/bqn-smt (or to "∾((⊣∾" or "∾⊢)´ ∾⟜".bqn"¨ options)∾" within it to use a specific engine)" ⋄ •Exit 2}⍟⊢ 0≢c
  •Import {".bqn"≡¯4↑𝕩? 𝕩; 𝕩•file.At (⊑options)∾".bqn"} ¯1↓o
}
