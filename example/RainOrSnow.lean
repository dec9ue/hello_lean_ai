/-!
# 命題論理 ｜ 雨でも雪でも道がぬれる

「雨なら道がぬれる」「雪なら道がぬれる」とする。いま分かっているのが
「雨か雪のどちらかだ」ということだけでも、道がぬれると結論できる。
`P ∨ Q` は「少なくとも一方が成り立つ」という意味で、証明では二つの場合を考える。
-/

namespace HelloLeanAI.Examples

theorem wet_of_rain_or_snow {Rain Snow Wet : Prop}
    (rainWets : Rain → Wet) (snowWets : Snow → Wet) (weather : Rain ∨ Snow) :
    Wet := by
  -- cases で weather の根拠を調べる。どちらの枝でも、ゴールは同じ Wet のまま。
  cases weather with
  | inl rain =>
    -- rain は Rain の証明なので、雨の日に使える仮定に渡す。
    exact rainWets rain
  | inr snow =>
    exact snowWets snow

end HelloLeanAI.Examples
