/-!
# 順序 ｜ 入れ子の区間

閉区間 [a, b] は、両端を含めて a 以上 b 以下の点を集めたもの。
外側の区間 [a, d] の中に区間 [b, c] があるとき、内側の点 x は外側にもある。
紙に a, b, x, c, d を順に並べると、二つの不等式をつなぐ理由が見えてくる。
-/

namespace HelloLeanAI.Examples

def inInterval (left right x : Nat) : Prop :=
  left ≤ x ∧ x ≤ right

theorem in_outer_interval {a b c d x : Nat}
    (leftEnd : a ≤ b) (rightEnd : c ≤ d) (inside : inInterval b c x) :
    inInterval a d x := by
  -- 内側にあるという仮定から、b ≤ x と x ≤ c を取り出す。
  obtain ⟨lower, upper⟩ := inside
  -- 外側についても、左端と右端の条件を別々に示せばよい。
  constructor
  · -- a ≤ b と b ≤ x をつないで a ≤ x を得る（不等号の推移律）。
    exact Nat.le_trans leftEnd lower
  · exact Nat.le_trans upper rightEnd

end HelloLeanAI.Examples
