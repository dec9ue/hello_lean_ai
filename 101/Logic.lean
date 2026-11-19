/-!
# 仮定を使う・二つの事実を組みにする

`P : Prop` は「P は命題」、`hp : P` は「hp は P の証明」という意味です。
`:=` の右側に証明そのものを書いた例と、`by` の後に手順を書いた例を見比べてみましょう。
-/

namespace HelloLeanAI.Intro

/-- P が成り立つと分かっていれば、P を示せます。 -/
theorem use_given (P : Prop) (hp : P) : P :=
  -- 求められている型は P なので、その型を持つ hp がそのまま答えです。
  hp

/-- 同じ主張をタクティクで示します。 -/
theorem use_given_tactic (P : Prop) (hp : P) : P := by
  -- exact は、現在のゴールに合う証明を渡す手順です。
  exact hp

/-- P と Q の証明が一つずつあれば、「P かつ Q」を示せます。 -/
theorem both_hold (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q :=
  -- 山かっこの中に、「かつ」の左側と右側の証明を順番に並べます。
  ⟨hp, hq⟩

/-- 同じ「かつ」を、左側と右側に分けて示します。 -/
theorem both_hold_tactic (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  -- constructor を実行すると、P を示すゴールと Q を示すゴールができます。
  constructor
  · exact hp
  · exact hq

end HelloLeanAI.Intro
