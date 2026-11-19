/-!
# アルゴリズム：左右を反転した木の読み取り

**目安：7〜12分**

二分木の葉には値が一つずつ入っています。すべての分岐で左右を入れ替えた木を左から読むと、
もとの木を右から読んだのと同じ列が得られることを示してください。

ヒント1：葉だけの木と、左右に子を持つ木を分けて考えます。子についての結果が使える帰納法を試しましょう。
ヒント2：二つのリストをつないで逆順にすると、右のリストを逆順にしたものが先頭に来ます。
-/

namespace Live.MirrorTree

inductive Tree (α : Type) where
  | leaf (value : α)
  | fork (left right : Tree α)

/-- 各分岐の子を入れ替え、子の中も同じように反転します。 -/
def mirror {α : Type} : Tree α → Tree α
  | .leaf x => .leaf x
  | .fork l r => .fork (mirror r) (mirror l)

/-- 左の子から読んだ値の列の後ろに、右の子から読んだ値の列をつなげます。 -/
def leaves {α : Type} : Tree α → List α
  | .leaf x => [x]
  | .fork l r => leaves l ++ leaves r

theorem leaves_mirror {α : Type} (t : Tree α) :
    leaves (mirror t) = (leaves t).reverse := by
  sorry

end Live.MirrorTree
