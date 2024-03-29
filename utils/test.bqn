#!/usr/bin/env bqn
year ← •args
utils ← •Import "utils.bqn"
AtYear ← year.path •file.At ⊢
expMap ← (•HashMap˜⟨⟩) {𝕩.Set´𝕨}´ year.exp
exitCode ← 0


MakeBQN ← { 𝕊 ⟨Show, Out, Import⟩:
  flc‿fcc‿fbc‿fmc ← {𝕊: •HashMap˜⟨⟩}¨ ↕4
  bqn ← •ReBQN {
    system ⇐ •listsys {𝕩∾𝕨/˜¬𝕨∊⊑¨𝕩} ⟨
      "show"‿Show
      "out"‿Out
      "import"‿Import
      ⟨"flines", FLines←{flc.Has 𝕩? flc.Get 𝕩; 𝕩 flc.Set v←•FLines AtYear 𝕩 ⋄ v}⟩
      ⟨"fchars", FChars←{fcc.Has 𝕩? fcc.Get 𝕩; 𝕩 fcc.Set v←•FChars AtYear 𝕩 ⋄ v}⟩
      ⟨"fbytes", FBytes←{fbc.Has 𝕩? fbc.Get 𝕩; 𝕩 fbc.Set v←•FBytes AtYear 𝕩 ⋄ v}⟩
      "file"‿{
        MapBytes ⇐      {fmc.Has 𝕩? fmc.Get 𝕩; 𝕩 fmc.Set v←•file.MapBytes AtYear 𝕩 ⋄ v}
        Lines ⇐ FLines
        Chars ⇐ FChars
        Bytes ⇐ FBytes
      }
      "exit"‿{𝕊: ! "Exit called"}
    ⟩
  }
  {⟨year.path, 𝕨⟩ BQN 𝕩}
}



_time0_ ← { F _𝕣_ time x: # time for at least 𝕘 seconds
  n ← 0
  left ← time+1e¯100
  { 𝕊:
    r ← 𝕩 F•_timed x
    n+↩ 𝕩
    left-↩ r×𝕩
    1⌈⌊(𝕩×2)⌊left÷r
  } •_while_ {𝕊: left>0} 1
  n÷˜time-left
}
_time_ ← { F _𝕣_ time x: # time for at least 𝕘 seconds, taking minimum of time÷20 runs if feasible
  t1 ← time+•MonoTime@
  tm ← time⌊ 0.0001⌈ time÷100 # want at least 0.1ms/iter if possible
  r ← ∞
  {𝕊: r⌊↩ F _time0_ tm x}•_while_{𝕊: (r≡∞) ∨ t1≥•MonoTime@} @
  r
}
TRepr ← {i←⊑𝕩⊐'.' ⋄ i<≠𝕩? (1+𝕨+i)↑𝕩∾𝕨⥊'0'; 𝕩∾'.'∾𝕨⥊'0'}⟜•Repr
FmtTime ← {
  𝕩<1e¯6? "ns"∾˜2 TRepr 𝕩×1e9;
  𝕩<1e¯3? "us"∾˜2 TRepr 𝕩×1e6;
  𝕩<1?    "ms"∾˜3 TRepr 𝕩×1e3;
           "s"∾˜4 TRepr 𝕩
}



RunTests ← { 𝕊:
  log ← {
    res ⇐ ⟨⟩
    Clear ⇐ {𝕊: res↩⟨⟩}
    bqn ⇐ MakeBQN {Show⇐{res∾↩<𝕩⋄𝕩} ⋄ Out⇐{res∾↩<𝕩⋄𝕩} ⋄ Import⇐{!𝕩≡"../../utils/utils.bqn" ⋄ utils}}
  }
  
  tested ← 0
  fail ← 0
  
  { 𝕊 ⟨name⟩:
    exp ← expMap.Get {𝕩/˜∧`𝕩∊'0'+↕10} 𝕩.path
    tested+↩ 1
    log.Clear@
    f ← name log.BQN 𝕩.srcBlock
    F @
    {𝕊: •Out ∾⟨"Failed ",name,": expected ",•Repr exp,", got ",•Repr log.res⟩ ⋄ fail↩1}⍟⊢ exp ≢ log.res
  }¨ 𝕩
  exitCode⌊↩ fail
  •Out {fail≡0? ∾⟨•Repr tested," passed!"⟩; ∾⟨•Repr tested-fail, "/", •Repr tested⟩}
}

raw ← 0
RunPerf ← { 𝕊:
  bqn ← MakeBQN {Show⇐⊢ ⋄ Out⇐⊢ ⋄ import⇐utils}
  𝕨⊸{ t 𝕊 o:
    f ← o.name BQN o.srcBlock
    {
      '×'=⊑t? (F⊢-⟜1) •_while_× •ParseFloat 1↓t;
      •internal.GC@
      F @
      •Out {raw? ∾⟨o.name, " ", •Repr 𝕩⟩; ∾⟨o.name, ": ", FmtTime 𝕩⟩} F _time_ (•ParseFloat t) @
    }
  }¨ 𝕩
  @
}

tests ← ⟨⟩
mode ← ⟨⟩
timeEach ← "0.1"
{
  "all": tests∾↩ year.all;
  "most": tests∾↩ year.most;
  "orig": tests∾↩ year.orig;
  "raw": raw↩1;
  "test":     mode∾↩<"test";
  "perf"≡4↑𝕩? mode∾↩<"perf" ⋄ {𝕊: timeEach↩4↓𝕩}⍟(4≠≠) 𝕩;
  ⊑(⊑𝕩)∊'0'+↕10? tests∾↩ <𝕩;
  ! "Unknown argument -- "∾𝕩
}¨ year.args

tests {
  𝕩↓˜↩ ¯4×".bqn"≡¯4↑𝕩
  name ⇐ path ⇐ 𝕩∾".bqn"
  fullpath ⇐ AtYear path
  src ⇐ •FChars fullpath
  srcBlock ⇐ "{𝕊:"∾src ∾ (@+10)∾"}"
}¨↩

{𝕊: •Out "Must specify either 'test' or 'perf'"}⍟¬ ×≠mode
{𝕊: •Out "Must specify at least one test or 'all'"}⍟¬ ×≠tests
{
  "test": RunTests tests;
  "perf": timeEach RunPerf tests
}¨ mode
•Exit⍟⊢ exitCode