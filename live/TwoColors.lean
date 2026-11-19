/-!
# グラフ理論：二色で塗り分けた路線図

駅を赤か青に塗り、直接つながる駅には必ず異なる色を使います。
AからB、BからCに線路があるとき、CからAへ直接戻る線路を引けないことを示してください。

ヒント1：Aが赤なら、BとCは何色になりますか。Aが青でも同じようにたどれます。
ヒント2：`¬ edge c a` の証明では、線路があると仮定し、3本の線路それぞれに `different` を適用できます。
-/

namespace Live.TwoColors

/-- `edge x y` は駅 x から駅 y への線路、`color x` は2色を表す真偽値です。 -/
theorem no_triangle {Station : Type} (edge : Station → Station → Prop)
    (color : Station → Bool)
    (different : ∀ x y, edge x y → color x ≠ color y)
    (a b c : Station) (hab : edge a b) (hbc : edge b c) : ¬ edge c a := by
  sorry

end Live.TwoColors
