/-!
# リスト ｜ 各要素を2回ずつ並べる

たとえば [3, 5] を [3, 3, 5, 5] に変えると、長さは 2 から 4 になる。
どんな長さのリストでも同じ法則が成り立つことを、リストを作る手順に沿って示す。
-/

namespace HelloLeanAI.Examples

/-- 空リストは空のまま。先頭が x なら、x を二つ並べてから残りを処理する。 -/
def duplicateEach {α : Type} : List α → List α
  | [] => []
  | x :: xs => x :: x :: duplicateEach xs

theorem length_duplicateEach {α : Type} (xs : List α) :
    (duplicateEach xs).length = 2 * xs.length := by
  induction xs with
  | nil =>
    -- 空リストなら両辺とも計算すると 0 になる。
    rfl
  | cons x xs ih =>
    -- ih は残りの xs についての結論。先頭の x を処理すると左辺は 2 増える。
    simp only [duplicateEach, List.length_cons, ih]
    -- 右辺も元の長さが 1 増えた分だけ 2 増える。
    omega

end HelloLeanAI.Examples
