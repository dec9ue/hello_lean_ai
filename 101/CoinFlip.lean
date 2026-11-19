/-!
# `inductive` で硬貨の面と「1回裏返す」を表す

硬貨の面には表と裏があります。「ある面から別の面へ1回で裏返せる」という
命題にも、表から裏へ、裏から表へ、という二通りの証明があります。
-/

namespace HelloLeanAI.Intro

/-- 縦棒の後ろに、この型の値の作り方（コンストラクタ）を並べる。 -/
inductive CoinFace where
  | heads
  | tails

/-- `OneFlip a b` は「面 a を1回裏返すと面 b になる」という命題。 -/
inductive OneFlip : CoinFace → CoinFace → Prop where
  | toTails : OneFlip .heads .tails
  | toHeads : OneFlip .tails .heads

-- 表から裏へ移れることは、最初のコンストラクタがそのまま証明になる。
example : OneFlip .heads .tails := OneFlip.toTails

/-- a から b へ裏返せるなら、b から a へも裏返せる。 -/
theorem oneFlip_reverse {a b : CoinFace} (h : OneFlip a b) : OneFlip b a :=
  -- h がどちらの証明かを調べ、帰り道にあたる証明を返す。
  match h with
  | .toTails => OneFlip.toHeads
  | .toHeads => OneFlip.toTails

/-- 同じ命題をタクティクで示す。`cases h` の後で各枝のゴールを見てみよう。 -/
theorem oneFlip_reverse_tactic {a b : CoinFace} (h : OneFlip a b) : OneFlip b a := by
  cases h with
  | toTails =>
    -- 行きが表から裏なら、ここでのゴールは OneFlip .tails .heads。
    exact OneFlip.toHeads
  | toHeads =>
    exact OneFlip.toTails

end HelloLeanAI.Intro
