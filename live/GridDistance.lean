/-!
# 格子幾何：碁盤の目を歩く距離

**目安：8〜12分**

交差点を整数の座標で表します。東西・南北にだけ歩くとき、最短距離は横の差と縦の差の絶対値の和です。
AからCまでの最短距離は、Bを経由する距離以下であることを証明してください。

ヒント1：横方向だけの寄り道を先に考えます。`a - c` を `(a - b) + (b - c)` と分解できます。
ヒント2：`Int.natAbs_add_le` は和の絶対値の上限を与えます。横と縦で得た不等式を足しましょう。
-/

namespace Live.GridDistance

/-- 点の成分 `.1` と `.2` はそれぞれ横と縦の座標。`natAbs` は整数の絶対値を自然数で返します。 -/
def distance (p q : Int × Int) : Nat :=
  (p.1 - q.1).natAbs + (p.2 - q.2).natAbs

theorem detour_bound (a b c : Int × Int) :
    distance a c ≤ distance a b + distance b c := by
  sorry

end Live.GridDistance
