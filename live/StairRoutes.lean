import Mathlib.Data.Nat.Fib.Basic

/-!
# 組合せ：階段の登り方は何通り？

**目安：12〜18分**

1歩で1段か2段だけ登れます。3段なら登り方は `[1, 1, 1]`、`[1, 2]`、`[2, 1]` の3通りです。
ちょうど n 段登る全経路を列挙したリストの長さが、第 n+1 フィボナッチ数に等しいことを示してください。

ヒント1：0段と1段を確かめます。2段以上の経路は最初の1歩が1段か2段かで分けられます。
ヒント2：2項前まで使える帰納法が合います。`map` しても長さは同じで、連結したリストの長さは足し算になります。
-/

namespace Live.StairRoutes

/-- 各経路は歩幅のリスト。0段では「一歩も動かない」という1通りを数えます。 -/
def routes : Nat → List (List Nat)
  | 0 => [[]]
  | 1 => [[1]]
  | n + 2 => (routes (n + 1)).map (1 :: ·) ++ (routes n).map (2 :: ·)

theorem count_routes (n : Nat) : (routes n).length = Nat.fib (n + 1) := by
  sorry

end Live.StairRoutes
