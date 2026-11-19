/-!
# 確率 ｜ 硬貨2枚の表裏を数える

公平な硬貨を独立に2枚投げる。順序を区別した4通りの結果は同じ確率なので、
表がちょうど1枚になる確率が半分であることは、該当する結果の個数を数えれば分かる。
-/

namespace HelloLeanAI.Examples

/-- true を表、false を裏として、1枚目と2枚目の結果を順番に並べる。 -/
def coinOutcomes : List (Bool × Bool) :=
  [(false, false), (false, true), (true, false), (true, true)]

theorem half_have_one_head :
    2 * (coinOutcomes.filter (fun p => p.1 != p.2)).length = coinOutcomes.length := by
  -- 2枚が違う面なら、一方だけが表。filter はこの条件を満たす組を残す。
  -- decide は具体的なリストを計算して、2 × 2 = 4 が成り立つことを確かめる。
  decide

end HelloLeanAI.Examples
