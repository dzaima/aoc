#!/usr/bin/env bqn
m ← •HashMap˜⟨⟩

"1" m.Set 54667‿54203
"2" m.Set 2449‿63981
"3" m.Set 540131‿86879020
"4" m.Set 25183‿5667240
"5" m.Set 282277027‿11554135
"6" m.Set 219849‿29432455
"7" m.Set 248453531‿248781813
"8" m.Set 19199‿13663968099527
"9" m.Set 1708206096‿1050
"10" m.Set 6823‿415
"11" m.Set 9742154‿411142919886
"12" m.Set 7379‿7732028747925
"13" m.Set 35232‿37982

{
  path ⇐ •path
  args ⇐ •args
  exp ⇐ m
  all ⇐ •Repr¨ 1+↕13
  orig ⇐ ∾⟜"_orig"¨ 1↓all
} •Import "../../utils/test.bqn"
