/-!
# 数論 ｜ 奇数を二つ足すと偶数

奇数を `2 * m + 1`、偶数を「ある自然数の2倍」と表す。
たとえば 7 + 5 = 12 の場合、7 = 2 × 3 + 1、5 = 2 × 2 + 1 なので、
12 を半分にした数は 3 + 2 + 1 になる。この考え方を任意の m, n に使う。
-/

namespace HelloLeanAI.Examples

theorem odd_plus_odd (m n : Nat) :
    ∃ k : Nat, (2 * m + 1) + (2 * n + 1) = 2 * k := by
  -- ∃ を示すには、条件を満たす k を実際に渡せばよい。
  -- 二つの +1 が合わさって +2 になるので、k は m + n より 1 大きい。
  refine ⟨m + n + 1, ?_⟩
  -- 残った等式は自然数の足し算と定数倍だけなので、omega で確認できる。
  omega

end HelloLeanAI.Examples
