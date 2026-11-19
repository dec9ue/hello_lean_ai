import Mathlib.Data.Real.Basic

/-!
# 実数の二乗を二つ足すと、答えは 0 以上になる

たとえば x = −3、y = 2 なら、二乗の和は 9 + 4 = 13 です。
どんな実数でも、自分自身を掛けた数は 0 以上です。また、0 以上の数どうしの和も 0 以上です。
この二つの事実を使って、同じ命題を二通りに証明します。
-/

namespace HelloLeanAI.Intro

/-- 証明項で書く。二つの二乗がそれぞれ 0 以上である証明を、和についての補題に渡す。 -/
theorem sum_sq_nonneg (x y : ℝ) : 0 ≤ x * x + y * y :=
  add_nonneg
    (mul_self_nonneg x)
    (mul_self_nonneg y)

/-- タクティクで書く。和についてのゴールを、二つの二乗についてのゴールに分ける。 -/
theorem sum_sq_nonneg_tactic (x y : ℝ) : 0 ≤ x * x + y * y := by
  -- 「0 以上の数どうしの和は 0 以上」を使うと、各項が 0 以上だと示す二つのゴールが残る。
  apply add_nonneg
  · -- 一つ目のゴールは 0 ≤ x * x。この型の証明を exact で渡す。
    exact mul_self_nonneg x
  · -- 二つ目は 0 ≤ y * y。同じ補題を今度は y に使う。
    exact mul_self_nonneg y

end HelloLeanAI.Intro
