#!/usr/bin/env bqn
MakeRand ← •MakeRand
⟨MDSlash⟩ ← •Import "../../utils/utils.bqn"

Join ← {(≠𝕨)↓ ∾ 𝕨⊸∾¨ 𝕩}
Repr ← '-'⌾⊑⍟('¯'=⊑) •Repr

days ← •HashMap˜⟨⟩

_gen ← {𝕩 days.Set 𝕗}

_fxRand ← {p ← 10⋆𝕩-1 ⋄ p + 𝕨 𝕗.Range 9×p} # 𝕩-digit numbers, no leading zeroes

_retryThis ← {𝕨𝔽{𝕨𝔽𝕘}𝕩 •_while_(≡⟜retry) retry} # retry 𝕨𝔽𝕩 until result isn't retry

{ 𝕊r:
  n ← ScaleF 1000
  n2 ← n×2
  {(⊣∾"   "∾⊢)´Repr¨𝕩}¨ <˘ n‿2⥊ (n2 r.Range n2) ⊏ n2 r _fxRand ScaleD 5
} _gen 1

{ 𝕊r:
  n ← ScaleF 1000
  vs ← (n r.Range 2) -∘⊢⍟⊣¨ (5+ n r.Range 4) {
    l ← +` 𝕨 r.Range 4
    o ← r.Range 3⌊≠l
    l (¯10+20 r.Range˜≠)⊸+⌾((o r.Deal ≠l)⊸⊏)↩
    l
  }¨ n
  vs {{𝕩 + r.Range 99-⌈´𝕩} 𝕩-⌊´𝕩}¨↩
  {' 'Join Repr¨ 𝕩}¨ vs
} _gen 2

{ 𝕊r:
  n ← ScaleF 17800
  l ← (n r.Range ≠)⊸⊏ "![]%^&*()_+muldon't()"
  Sprinkle ← {l 𝕩⌾((≠𝕩)↑(r.Range (≠l)-≠𝕩)↓⊢)↩ ⋄ 1}¨
  Sprinkle {𝕊: a‿b←2 r.Range 1000 ⋄ ∾⟨"mul(", Repr a, ",", Repr b, ")"⟩}¨ ↕⌊n÷15
  Sprinkle (⌊n÷600)⥊<"do()"
  Sprinkle (⌊n÷600)⥊<"don't()"
  l (@+10)¨⌾(((⌊0.5+ n÷3500) r.Deal ≠l)⊸⊏)↩
  l
} _gen 3

{ 𝕊r:
  n ← ScaleF 140
  pts ← ⌽∘⍉⍟(↕4) ≍"XMAS"
  pts∾↩ {⌽˘¨⊸∾ ⌽⊸⋈ 𝕩} 4‿4⥊∾∾⟜"...."¨ "XMAS"
  pts∾↩ ⌽∘⍉⍟(↕4) ["M.S",".A.","M.S"]
  m ← "XMAS" ⊏˜ n‿n r.Range 4
  pti ← {MDSlash 𝕩≠'.'}¨ pts
  ptc ← pti ⊑¨ pts
  ptr ← n- ⌈´¨ pti
  {
    m (𝕩⊑ptc)⌾(((r.Range¨ 𝕩⊑ptr)⊸+¨ 𝕩⊑pti)⊸⊑)↩
    1
  }¨ (⌊×˜n) r.Range ≠pts
  m
} _gen 4

{ 𝕊r:
  nodes ← ⌈⌾(÷⟜4) 24⌈ ScaleF 100
  tests ← ScaleD ⌊nodes×1.85
  
  q ← nodes÷4
  conn ← nodes‿nodes⥊0
  
  qs ← ⟨
    ⟨nodes-q-2, nodes-q-1⟩⊸+¨ ↕q-2
    ⟨nodes-q+1, nodes-q⟩⊸+¨ - ↕q-1
    ⌽⟨nodes-q, nodes-q-1⟩⊸+¨ -⊸⋈¨ ↕q-1
    ⌽⟨nodes-q-1, nodes-q+1⟩⊸+¨ ⋈⟜-¨ ↕q-1
  ⟩
  {
    y‿x ← <˘⍉>𝕩
    conn 1¨⌾((∾ y ⋈¨¨ 1↓↑x)⊸⊑)↩
    1
  }¨ qs
  
  t ← { 𝕊:
    qc ← (2+r.Range 2) ⊑ qs # I have no clue what happens with the other two quadrants
    k ← 1+2× 2+ r.Range ¯2+⌊q÷2
    is ← k r.Subset ≠qc
    r.Deal∘≠⊸⊏⍟(r.Range 2) ⊑¨is⊏qc
  }¨ ↕tests
  
  d ← MDSlash conn
  
  nl←⌊nodes÷10
  shuf ← (↕nl) ∾ nl+r.Deal nodes-nl
  d‿t ⊏⟜shuf¨¨↩
  d‿t r.Deal∘≠⊸⊏¨↩
  
  ({'|'Join Repr¨𝕩}¨ d) ∾⟨⟨⟩⟩∾ (','Join Repr¨)¨ t
} _gen 5

{ 𝕊r:
  ds ← (⌽-⌾⊑)⍟(↕4) ¯1‿0
  
  w ← ScaleF 130
  cn ← ×˜w
  wa ← ⌈ 0.05 × cn # target wall amount
  p ← 1+2 r.Range w-2
  m ← w‿w⥊0 # 0:air/any/todo 1:wall 2:start 4:reqair
  m 2⌾(p⊸⊑)↩
  tgtSteps ← ⌈1.2×w
  remaining ← tgtSteps
  tryLeft ← remaining×20
  dir ← 0
  { 𝕊:
    d ← dir⊑ds
    l ← 2+r.Range w
    pe ← p + d×l
    pw ← pe+d
    ∧´pw≥0? ∧´pw<w?
    0=pe⊑m?
    1≥pw⊑m?
    path ← (p + d×⊢)¨ ↕l+1
    ∧´1≠path⊑m?
    {0:1;
      path2 ← (∧´≥⟜0∧<⟜w)¨⊸/ (pe + ((4|dir+1)⊑ds)×⊢)¨ ↕w
      ok ← ∧´ (path2⊑m)∊ 0‿2‿4
      {𝕊: 1⊣m 4¨⌾(path2⊸⊑)↩} ⍟⊢ ok
      ok
    } remaining=1?
    m (4×0=⊢)⊸+⌾(path⊸⊑)↩
    m 1⌾(pw⊸⊑) ↩
    p ↩ pe
    dir ↩ 4|dir+1
    remaining-↩1
  ;
    0
  }•_while_{𝕊: (0≤tryLeft-↩1) ∧ remaining≠0} @
  
  # •Show tgtSteps‿remaining‿tryLeft
  remaining = 0?
  # m 3⌾(p⊸⊑)↩
  # •Show m⊏"·#^⎕•"
  m ↩ {(≠𝕩)↑/⁼ ((⌊0.5×≠𝕩) ⌊ 0⌈ wa - +´1=⥊m)r.Deal ≠𝕩}⌾((0=m)/○⥊⊢) m
  # •Show md⊏"∧>∨<·"
  ".#^"⊏˜4|m
  ; retry
} _gen 6

{ 𝕊r:
  n ← ScaleF 850
  distr ← +`(⊢÷+´) 0‿0‿5‿5‿50‿25‿25‿20‿20‿20‿10‿10
  
  sum ← 0
  _gen ← {
    _try_ ← { 𝔽_𝕣_𝕘 @:
      ops ← (𝕘 r.Range ≠𝕗) ⊏ 𝕗
      args ← 1+𝕘 r.Range 99
      start ← 1+r.Range 999
      exp ← start {op‿arg𝕊𝕩: 𝕩 Op arg}´ ⌽ops⋈¨args
      exp<1e14?
      sum+↩ exp
      exp∾start∾args
      ;@
    }
    𝕗 _try_ 𝕩 •_while_ (@⊸≡) @
  }
  
  ts ← {𝕊: 0⌈¯1+r.Range 4}◶⟨
    {(1+r.Range 2⋆30+r.Range 20) ∾ 1+ r.Range¨ ¯1+ (1+𝕩)⥊10⋆1+r.Range 3}
    +‿× _gen
    +‿×‿{(𝕨 × 10⋆≠•Repr𝕩) + 𝕩} _gen
  ⟩¨ distr ⍋ n r.Range 0
  
  sum<1e15?
  {∾⟨Repr⊑𝕩, ": ", ' 'Join Repr¨ 1↓𝕩⟩}¨ ts
  ; retry
} _gen 7

{ 𝕊r:
  n ← ScaleF 50
  res ← n‿n⥊'.'
  chars ← (((⌈n×1.04)⌊≠) r.Deal ≠)⊸⊏ ∾"0Aa"+⟜↕¨10‿26‿26
  { 𝕊 char:
    { 𝕊:
      is ← 4 r.Deal n×n
      ∧´'.'= is⊏⥊res?
        1=⌈´ ⥊ •math.GCD´ |-⌜˜¨ n(|⋈⌊∘÷˜)is?
          res char¨⌾(is⊏⥊)↩
          0
      ; 1
    }•_while_⊢ 1
  }¨ chars
  '.'≡⊑res?
  res
  ; retry
} _gen 8

{ 𝕊r:
  n ← ScaleF 10000
  l←¯1↓⥊(1+n r.Range 9) ≍˘ n r.Range 10
  
  fs ← l / (≠l)↑ ⥊ (↕n+1)≍˘¯1
  gs ← 2↑((+`⌾⌽∘¬ > +`) fs=¯1) ⊔ fs
  ∧´×≠¨gs?
  ∧´¯1≠ {(⊑𝕨)⋈¯1⊑𝕩}´gs? # a property that was true in my input and 9_orig.bqn requires, but some inputs violate it
  
  ⋈'0'+l
  ; retry
} _gen 9

{ 𝕊r:
  ds ← ⌽¨⊸∾ 0⊸⋈¨ 1‿¯1
  n ← ScaleF 47
  m←n‿n r.Range 10
  { 𝕊:
    ps ← (<2 r.Range n) +`(10 r.Range 4)⊏ds
    ∧´(∧´≥⟜0∧<⟜n)¨ ps? ps≡⍷ps?
      m (↕10)⌾(ps⊸⊑)↩
      1
    ;0
  }¨ ↕n×n×100
  '0'+<˘m
} _gen 10

{ 𝕊r:
  n ← ScaleF 8
  vs ← 0 ∾ r _fxRand¨ 7⌊1+↕n-1
  ' 'Join Repr¨ vs
} _gen 11

{ 𝕊r:
  n ← ScaleF 140
  m ← n‿n⥊r.Range 26
  any ← 0¨ m
  ds ← -⊸∾ ⌽⊸⋈ 0‿1
  { 𝕊:
    s ← n (|⋈˜⌊∘÷˜) r.Range∘≠⊸⊑ /¬⥊any
    ps ← {(∧´≥⟜0∧<⟜n)¨⊸/ ⍷ 𝕩 ∾ (0=(⌈0.01×≠)r.Range˜≠)⊸/ ⥊𝕩+⌜ds}⍟(r.Range ⌈√n) ⋈s
    m (r.Range 26)¨⌾(ps⊸⊑) ↩
    any 1¨⌾(ps⊸⊑)↩
    1
  }¨ ↕n×2
  # m (26 r.Range˜≠)⌾((<˘ ⍷n‿2 r.Range n)⊸⊑)↩
  'A'+m
} _gen 12

{ 𝕊r:
  n ← ScaleF 320
  Check ← { a‿b‿r:
    ah ← -´ r×⌽b
    al ← -´ a×⌽b
    0=al|ah?
    an ← ah÷al
    bh ← (⊑r) - an×⊑a
    bl ← ⊑b
    0=bl|bh?
    (3×an) + bh÷bl
    ; 0
  }
  
  ¯1↓∾{ 𝕊𝕩:
    a ← 2 r _fxRand 2
    b ← 2 r _fxRand 2
    ≠´a÷b?
    ns ← 1+ 2 r.Range 99
    { 𝕊:
      an ← (-´ 1e13×⌽b) ÷ -´ a×⌽b
      bn ← (1e13 - an×⊑a) ÷ ⊑b
      ns+↩ ⌈an‿bn
    }⍟⊢ 𝕩
    ∧´ns>0?
    r ← (+´ns×a‿b) - 1e13×𝕩
    (𝕩⊑⟨0‿1,1‿0⟩) ≡ 0=Check¨ ⟨a‿b‿r, ⟨a,b,r+1e13⟩⟩? # check to make sure part1-intended or part2-intended doesn't happen to be valid for the other part, which could result in negative numbers
    ⟨
      {∾⟨"Button A: X+",𝕨,", Y+",𝕩⟩}´ Repr¨ a
      {∾⟨"Button B: X+",𝕨,", Y+",𝕩⟩}´ Repr¨ b
      {∾⟨"Prize: X=",𝕨,", Y=",𝕩⟩}´ Repr¨ r
      ⟨⟩
    ⟩
    ; retry
  }_retryThis ¨ n↑ /⁼ (n÷2) r.Deal n
} _gen 13

{ 𝕊r:
  n ← ScaleF 500
  sz ← 103‿101
  tree ← [
    "###############################"
    "#·····························#"
    "#·····························#"
    "#·····························#"
    "#·····························#"
    "#··············#··············#"
    "#·············###·············#"
    "#············#####············#"
    "#···········#######···········#"
    "#··········#########··········#"
    "#············#####············#"
    "#···········#######···········#"
    "#··········#########··········#"
    "#·········###########·········#"
    "#········#############········#"
    "#··········#########··········#"
    "#·········###########·········#"
    "#········#############········#"
    "#·······###############·······#"
    "#······#################······#"
    "#········#############········#"
    "#·······###############·······#"
    "#······#################······#"
    "#·····###################·····#"
    "#····#####################····#"
    "#·············###·············#"
    "#·············###·············#"
    "#·············###·············#"
    "#·····························#"
    "#·····························#"
    "#·····························#"
    "#·····························#"
    "###############################"
  ] = '#'
  treePos ← r.Range¨ 1+sz-≢tree # top-left of tree location
  mapP2 ← (2+tree)⌾((≢tree)↑treePos↓⊢) sz⥊0
  mapP2 {𝕩↑ /⁼ (n-+´⥊tree) r.Deal 𝕩}∘≠ ⌾((mapP2=0)⊸(/○⥊)) ↩
  # •Show mapP2⊏"·#_⎕"
  psP2 ← MDSlash 2|mapP2
  psP2 r.Deal∘≠⊸⊏↩
  tgtP2 ← 8000+r.Range 300
  vs ← <˘ ≥⟜0⊸+ ¯99+ n‿2 r.Range 198
  ps ← sz⊸|¨ psP2 - vs×tgtP2
  ps {∾⟨"p=",𝕨," v=",𝕩⟩}○(','Join Repr¨∘⌽)¨ vs
} _gen 14

{ 𝕊r:
  w ← ScaleF 50
  rq ← ScaleF w×w×8
  
  cn ← ×˜cw←w-2
  k ← r.Deal∘≠⊸⊏ / -⟜» 1∾-⟜1⌾⊑ ⌊cn × 1⌾(¯1⊸⊑) +`0.65‿0.25‿0.10
  b ← ∾⟜3˘ 3∾˘ 3¨∘⊏⊸(∾∾⊣) cw‿cw⥊k
  b ⊏⟜"@.O#"↩
  rqs ← {𝕩⊔˜⌊1000÷˜↕≠𝕩} (rq r.Range 4)⊏"><^v"
  (<˘b) ∾ ⟨⟨⟩⟩ ∾ rqs
} _gen 15

{ 𝕊r:
  cn←≠chars ← "wubrg"
  pn ← 440
  dn ← ScaleF 400
  Distr ← {-⟜»⌊0.5+𝕨× 1⌾(¯1⊸⊑) +`(⊢÷+´)𝕩}
  o1 ← (r.Range cn) ⊑ chars
  ps1 ← ⥊¨ o1⊸≠⊸/ chars
  ps2 ← ∾2↓¨{∨´¨ o1=𝕩}⊸⊔ ⥊⊏⟜chars¨ ↕cn‿cn
  ps3← {∧´(𝕩≠o1) ∨ ∨´(0⊸∾∨∾⟜0)¨ ⍷⟜𝕩¨ ps2}¨⊸/ ⊏⟜chars¨ ⥊↕3⥊cn
  ps ← ∾ps1‿ps2‿ps3 ∾ (4+↕5) {
    <˘ ⊏⟜chars ⍉>cn| ⌊∘÷⟜cn⍟(↕𝕨) 𝕩 r.Deal cn⋆𝕨
  }¨ pn Distr 1↓120-20×↕6
  ds ← {
    p ← chars ⊏˜ 𝕩 r.Range 5
    p
  }¨ +˝ 20+2‿dn r.Range 11
  •Show 1
  ⟨", "Join r.Deal∘≠⊸⊏ ps⟩∾⟨⟨⟩⟩∾ds
} _gen 19

{ 𝕊r:
  n ← ScaleF 5
  l ← ScaleF 3
  ('0'+n‿l r.Range 10)∾˘'A'
} _gen 21

{ 𝕊r:
  n ← ScaleF 1750
  Repr¨ n r.Range 16777216
} _gen 22

# { 𝕊r:
# } _gen

ScaleD ← !
ScaleF ← !
retry ← {⇐}
{
  args ← •args
  Arg ← {𝕊: (args↓˜↩1) ⊢ (1⌊≠)⊸↑args}
  path ← ⋈⁼ Arg@
  day ← •ParseFloat (∧`('0'⊸≤∧≤⟜'9'))⊸/ •file.Name path
  seed ← ≠◶⟨1, ("u"⊸≡◶⟨•ParseFloat, {𝕊: s←•rand.Range 1e9 ⋄ •Out "Seed: "∾•Repr s ⋄ s}⟩)⊑⟩ Arg@
  ScaleD ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: •ParseFloat a}
  ScaleF ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: m←'x'=¯1⊑a ⋄ 𝕩⊸×⍟m •ParseFloat m-⊸↓a}

  f ← days.Get day
  rng ← MakeRand seed
  rn ← 0
  args0 ← args
  res ← {𝕊: args↩args0 ⋄ rn+↩1 ⋄ F rng}•_while_ (retry⊸≡) retry
  {•Out ∾⟨path, ": ", •Repr 𝕩, " retries"⟩}⍟(1⊸≠) rn
  path •FLines ⋈⍟(2=•Type∘⊑) <˘⍟(2==) res
}