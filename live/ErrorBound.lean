import Mathlib.Data.Real.Basic

/-!
# 実解析：二段の処理を通った誤差

実数を受け取る処理 f では、二つの出力の差が入力の差の2倍以下に収まります。
次の処理 g での上限は3倍です。続けて処理すると、出力の差がもとの入力の差の6倍以下に収まることを証明してください。

ヒント1：出力に近いほうの処理から調べます。`hg` に入れる二つの値は `f x` と `f y` です。
ヒント2：`hf x y` の両辺に3を掛けられるのは、3が非負だからです。最後に係数をまとめましょう。
-/

namespace Live.ErrorBound

/-- 縦棒は実数の絶対値です。仮定は各処理への好きな二つの入力について使えます。 -/
theorem composed_bound (f g : ℝ → ℝ)
    (hf : ∀ x y, |f x - f y| ≤ 2 * |x - y|)
    (hg : ∀ x y, |g x - g y| ≤ 3 * |x - y|) (x y : ℝ) :
    |g (f x) - g (f y)| ≤ 6 * |x - y| := by
  sorry

end Live.ErrorBound
