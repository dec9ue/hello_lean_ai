/-!
# ゲーム：石取りで相手の手に応じる

1手で1個から k 個の石を取り、最後の石を取った人が勝ちます。山に k+1 個のまとまりがいくつか残っていて、
相手が先に石を取ったとします。自分の次の1手で、まとまりをちょうど一つ減らした状態に戻せることを示してください。

ヒント1：たとえば k が3なら、相手が1個取ると自分は3個、2個なら2個と応じられます。
ヒント2：2人で合計 k+1 個になるように `reply` を選び、それが1以上 k 以下であることも確認します。
-/

namespace Live.TakeAway

/-- 最初は `rounds + 1` まとまり。`taken` が相手の手、`reply` がこちらの手です。 -/
theorem can_restore_blocks (k rounds taken : Nat) (hmin : 1 ≤ taken) (hmax : taken ≤ k) :
    ∃ reply : Nat, 1 ≤ reply ∧ reply ≤ k ∧ taken + reply = k + 1 ∧
      (k + 1) * (rounds + 1) - taken - reply = (k + 1) * rounds := by
  sorry

end Live.TakeAway
