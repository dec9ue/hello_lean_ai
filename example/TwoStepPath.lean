/-!
# グラフ理論 ｜ 道を逆にたどる

駅を頂点、隣り合う駅の間の線路を辺と考える。線路はどちら向きにも通れるとする。
A から途中の駅を一つ経由して B に行けるなら、B からも同じ駅を経由して A に帰れる。
-/

namespace HelloLeanAI.Examples

theorem two_step_return {Station : Type} (track : Station → Station → Prop)
    (reverseTrack : ∀ a b, track a b → track b a) {a b : Station}
    (outbound : ∃ mid, track a mid ∧ track mid b) :
    ∃ mid, track b mid ∧ track mid a := by
  -- 存在の仮定を開いて、途中の駅と、そこを結ぶ線路の証拠を取り出す。
  obtain ⟨mid, first, second⟩ := outbound
  -- 帰り道の途中駅にも mid を選ぶ。二つの ?_ が帰りの各区間に当たる。
  refine ⟨mid, ?_, ?_⟩
  · -- 帰りの最初の区間は、行きの後半を逆にたどる。
    exact reverseTrack mid b second
  · exact reverseTrack a mid first

end HelloLeanAI.Examples
