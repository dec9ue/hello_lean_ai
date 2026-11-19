/-!
# 状態機械 ｜ 信号が一周すると元に戻る

信号のランプが赤 → 青 → 黄 → 赤の順に切り替わるものとする。
どの色から始めても、3回切り替えると最初の色に戻る。開始時の色で場合分けしよう。
-/

namespace HelloLeanAI.Examples

/-- 信号が取れる状態を3個のコンストラクタ（値の作り方）で表す。 -/
inductive Light where
  | red | green | yellow

def nextLight : Light → Light
  | .red => .green
  | .green => .yellow
  | .yellow => .red

theorem three_switches (start : Light) :
    nextLight (nextLight (nextLight start)) = start := by
  -- cases が3通りのゴールを作る。各枝では nextLight を実際に3回計算できる。
  cases start with
  | red => rfl
  | green => rfl
  | yellow => rfl

end HelloLeanAI.Examples
