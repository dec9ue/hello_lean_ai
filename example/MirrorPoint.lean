/-!
# 座標幾何 ｜ 同じ鏡に2回映す

縦の直線 x = a を鏡に見立てる。x 座標が a より d だけ右にあった点は、
鏡映すると a より d だけ左にくる。したがって新しい x 座標は 2a − x になる。
もう一度映すと元の点に戻ることを、二つの座標に分けて確かめる。
-/

namespace HelloLeanAI.Examples

/-- 点は整数の組で表す。p.1 が x 座標、p.2 が y 座標。 -/
def mirrorAt (a : Int) (p : Int × Int) : Int × Int :=
  (2 * a - p.1, p.2)

theorem mirrorAt_twice (a : Int) (p : Int × Int) :
    mirrorAt a (mirrorAt a p) = p := by
  -- 組が等しいことを示すために、成分ごとの等式を一つずつ証明する。
  apply Prod.ext
  · -- change は鏡映の定義を使い、x 座標のゴールを見慣れた式で書き直す。
    change 2 * a - (2 * a - p.1) = p.1
    omega
  · -- y 座標は最初から動かしていないので、定義を計算すれば一致する。
    rfl

end HelloLeanAI.Examples
