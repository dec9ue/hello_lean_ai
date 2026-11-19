/-!
# structure でクイズの成績を表す

成績を記録するときには、正解数と問題数を入力します。さらに「正解数は問題数以下」
という条件も一緒に記録すると、あとでどの成績を取り出しても、この条件を使えます。
-/

namespace HelloLeanAI.Intro

/-- 二つの数と、その間に成り立つ不等式の証明を一つにまとめた型。 -/
structure QuizScore where
  correct : Nat
  total : Nat
  withinTotal : correct ≤ total

/-- 5 問中 3 問正解した成績。フィールド名の右に、それぞれの値を書きます。 -/
def sampleScore : QuizScore where
  correct := 3
  total := 5
  -- 二つの数を入れたので、ここで必要な証明は 3 ≤ 5。decide で確かめられます。
  withinTotal := by decide

/-- 問題数が 10 以下のクイズなら、正解数も 10 以下です。 -/
theorem correct_le_ten (score : QuizScore) (h : score.total ≤ 10) :
    score.correct ≤ 10 :=
  -- score.withinTotal で成績から取り出した不等式と、仮定 h をつなぎます。
  Nat.le_trans score.withinTotal h

/-- タクティクでは、正解数から 10 までの途中に問題数を置きます。 -/
theorem correct_le_ten_tactic (score : QuizScore) (h : score.total ≤ 10) :
    score.correct ≤ 10 := by
  -- 途中の数を score.total に指定すると、示したい二つの不等式が順番に現れます。
  apply Nat.le_trans (m := score.total)
  · exact score.withinTotal
  · exact h

end HelloLeanAI.Intro
