import Mathlib.Algebra.Group.Defs

/-!
# 群論：二つの操作を取り消す順番

群の積を「操作を組み合わせること」、逆元を「操作を取り消すこと」と読んでみましょう。
普通は組み合わせた操作を逆順に取り消します。元と同じ順で逆元を並べてもよいのは、
もとの二つの操作を入れ替えても結果が変わらないとき、かつそのときに限ることを示します。

ヒント1：`mul_inv_rev` で積の逆元を展開して、二つの因子が並ぶ順番を比べましょう。
ヒント2：左から右への向きでは両辺の逆元を取れます。`congrArg` は等式の両辺に同じ関数を適用します。
-/

namespace Live.UndoOrder

theorem same_order_iff_commute {G : Type*} [Group G] (a b : G) :
    (a * b)⁻¹ = a⁻¹ * b⁻¹ ↔ a * b = b * a := by
  sorry

end Live.UndoOrder
