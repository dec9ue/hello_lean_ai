/-!
# 関数 ｜ 復号できる符号は衝突しない

データを符号化してから復号すると、必ず元に戻ると仮定する。
このとき二つの入力が同じ符号になるなら、入力自体も等しい。この性質を「単射」という。
-/

namespace HelloLeanAI.Examples

theorem inputs_equal_of_codes_equal {α β : Type} (encode : α → β) (decode : β → α)
    (restore : ∀ x, decode (encode x) = x) (x y : α) (sameCode : encode x = encode y) :
    x = y := by
  -- calc では、左端の x から右端の y までの等式を一段ずつ書ける。
  calc
    -- restore の等号を .symm で逆向きに使い、x を復号結果に置き換える。
    x = decode (encode x) := (restore x).symm
    -- 等しい符号を同じ関数に渡せば、結果も等しい。
    _ = decode (encode y) := congrArg decode sameCode
    _ = y := restore y

end HelloLeanAI.Examples
