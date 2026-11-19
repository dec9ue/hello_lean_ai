/-!
# 等式の向きを変える・二つの等式をつなぐ

自然数 a, b, c を使い、すでに分かっている等式から次の等式を作ります。
-/

namespace HelloLeanAI.Intro

/-- a = b が分かっていれば、逆向きの b = a も成り立ちます。 -/
theorem reverse_equality (a b : Nat) (hab : a = b) : b = a :=
  -- hab.symm は、等式 hab の左辺と右辺を入れ替えた証明です。
  hab.symm

/-- タクティクでは、まずゴールの等号の向きを変えます。 -/
theorem reverse_equality_tactic (a b : Nat) (hab : a = b) : b = a := by
  -- symm の後に残るゴールは a = b なので、仮定 hab が使えます。
  symm
  exact hab

/-- a = b と b = c が分かっていれば、間の b を経由して a = c を示せます。 -/
theorem chain_equalities (a b c : Nat) (hab : a = b) (hbc : b = c) : a = c :=
  -- trans は、最初の等式の右辺と次の等式の左辺が同じときに使えます。
  hab.trans hbc

/-- タクティクでは、先に a を b に書き換えてから、残った等式を示します。 -/
theorem chain_equalities_tactic (a b c : Nat) (hab : a = b) (hbc : b = c) : a = c := by
  -- rw [hab] はゴール a = c の a を b に置き換えます。
  rw [hab]
  -- 残った b = c は、もう一つの仮定そのものです。
  exact hbc

end HelloLeanAI.Intro
