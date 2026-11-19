/-!
# 整数最適化 ｜ 焼き菓子26個をぴったり詰める

箱は4個入りと7個入りの2種類で、どの箱も満杯にする。26個を詰めるのに
最低何箱いるだろうか。「最小は5箱」を、5箱の詰め方があることと、
どんな詰め方も5箱以上使うことに分けて示す。
-/

namespace HelloLeanAI.Examples

theorem minimum_boxes_for_26 :
    (∃ small large : Nat, 4 * small + 7 * large = 26 ∧ small + large = 5) ∧
    (∀ small large : Nat, 4 * small + 7 * large = 26 → 5 ≤ small + large) := by
  constructor
  · -- 小箱3個と大箱2個を渡す。残った二つの等式はどちらも具体的な計算。
    exact ⟨3, 2, by decide, by decide⟩
  · -- 次は、ちょうど26個入る任意の組合せを考える。
    intro small large packed
    -- 大箱が4個以上なら、それだけで26個を超える。大箱が3個以下なら、
    -- 計4箱で入るのは多くても 7 × 3 + 4 = 25 個。
    by_cases many : 4 ≤ large <;> omega

end HelloLeanAI.Examples
