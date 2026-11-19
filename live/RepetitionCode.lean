/-!
# 符号理論：3回送れば1回の誤りを直せる

同じビットを3回続けて送ります。たとえば `true` を送って `true, false, true` と届いても、
多数決の結果は `true` です。通信中に変わったビットが高々1個なら元の値を復元できることを示します。

ヒント1：最初の2個が一致したときと、一致しないときに分け、多数派がどこにあるか考えましょう。
ヒント2：値はどれも `Bool` なので、送信値と3個の受信値を場合分けして計算する方法もあります。
-/

namespace Live.RepetitionCode

/-- 送った値と届いた値が食い違う位置を1個と数えます。 -/
def mismatch (sent received : Bool) : Nat :=
  if sent = received then 0 else 1

/-- 最初の2票が割れたときは、最後の1票が勝敗を決めます。 -/
def decode (a b c : Bool) : Bool :=
  if a = b then a else c

theorem correct_one_error (sent a b c : Bool)
    (h : mismatch sent a + mismatch sent b + mismatch sent c ≤ 1) :
    decode a b c = sent := by
  sorry

end Live.RepetitionCode
