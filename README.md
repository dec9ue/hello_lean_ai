# LeanでAIと証明してみよう

AIに証明を頼むと、どんな手順が返ってくるでしょうか。このリポジトリでは、AIが書いた各ステップをLeanで確かめながら、数学の説明がコードになる過程を試せます。

| やってみたいこと | 開くフォルダ | 内容 |
| --- | --- | --- |
| ごく短い証明を二通りで読む | [101/](101/) | 同じ命題の証明を式で直接書く「証明項」と、ゴールを一手ずつ解く「タクティク」を見比べる |
| 証明の読み方を知る | [example/](example/) | 日本語の解説が付いた証明例10問 |
| 用意された命題を証明する | [live/](live/) | 1ファイル1問の穴埋め演習10問 |
| 言葉から命題を作る | [playground/](playground/) | 日本語のお題20問と、自分の問題をLeanで表して証明する作業場所 |

## 準備

VS Codeに「Lean 4」拡張機能を入れ、拡張機能のセットアップを完了します。手順は [Lean公式のインストールガイド](https://lean-lang.org/install/) にあります。

VS Codeでこのフォルダ全体を開き、ターミナルで次を実行します。プロジェクトで使うLeanとMathlibはどちらも `v4.33.0` に固定しています。

```sh
lake exe cache get Mathlib.Data.Real.Basic Mathlib.Data.Nat.Fib.Basic Mathlib.Algebra.Group.Defs
lake build
```

最初のコマンドは、教材が使うMathlibのモジュールとその依存先のビルド済みファイルを取得します。初回のビルドでは、`live/` の10問について「declaration uses `sorry`」という警告が出ます。`sorry` は証明をこれから書く場所で、この警告が出ていてもビルドは成功します。

## 最初の1問

Leanの証明が初めてなら、まず [仮定をそのまま使う](101/Logic.lean) ところから読めます。[等式をつなぐ](101/Equality.lean) 例を経て、[二乗の和は 0 以上](101/SumSquares.lean) では `apply add_nonneg` の直後にカーソルを置き、二つのゴールが証明項のどの部分に対応するか見てみましょう。

1. [雨でも雪でも道がぬれる](example/RainOrSnow.lean) を開きます。`cases weather` のあとの各行にカーソルを置き、Leanの情報ビュー（Infoview）で、雨の場合と雪の場合に使える仮定がどう変わるか見てみましょう。
2. [ピアノを弾く人、歌う人](live/Witness.lean) を開き、AIに次のように頼んでみてください。「`live/Witness.lean` の左右の命題を、ピアノと歌の例で説明してください。次に、定理の仮定と結論を保ったまま `sorry` を埋めてください。どこで具体的な人を一人選んだのか、日本語のコメントで教えてください。」
3. 提案された証明を保存し、次のコマンドを実行します。エラーも `sorry` の警告も出なければ、この1問は完了です。

```sh
lake env lean live/Witness.lean
```

## 次に解く問題を選ぶ

| 分野 | 穴埋め演習 |
| --- | --- |
| 論理 | [ピアノを弾く人、歌う人](live/Witness.lean) |
| 符号理論 | [3回送れば1回の誤りを直せる](live/RepetitionCode.lean) |
| グラフ理論 | [二色の路線図に三角形はあるか](live/TwoColors.lean) |
| アルゴリズム | [左右を反転した木の葉を読む](live/MirrorTree.lean) |
| 実解析 | [二段の処理を通った誤差](live/ErrorBound.lean) |
| 格子幾何 | [碁盤の目を歩く距離](live/GridDistance.lean) |
| 群論 | [二つの操作を取り消す順番](live/UndoOrder.lean) |
| ゲーム | [石取りで相手の手に応じる](live/TakeAway.lean) |
| 数論 | [4円・7円切手で作れる金額](live/Postage.lean) |
| 組合せ | [階段の登り方は何通り？](live/StairRoutes.lean) |

## 日本語の問題から始める

[プロンプト集](playground/Prompts.lean) から好きなお題を1問選ぶか、自分で考えた数学の問題をAIに渡します。「まずLeanの定理文と具体例を見せてください」と頼むと、日本語の仮定と結論が定理の型にどう対応するか確かめられます。

新しい問題は、`playground/` に問題名を付けたLeanファイルを作り、問題を表す定義・定理文と、その証明を書きます。

## 証明の進め方から手本を探す

| 知りたいこと | 読める例 |
| --- | --- |
| 場合分けのあと、どう進める？ | [雨か雪か](example/RainOrSnow.lean)、[信号を3回切り替える](example/TrafficLight.lean) |
| 「あるものが存在する」をどう示す？ | [奇数二つの和が偶数になる](example/OddSum.lean)、[乗換駅を選んで帰り道を作る](example/TwoStepPath.lean) |
| 等式や不等式をどうつなぐ？ | [復号できる符号は衝突しない](example/DecodeInjective.lean)、[入れ子の区間](example/NestedIntervals.lean) |
| データの形をどう使う？ | [リストの先頭と残りに分ける](example/DuplicateLength.lean)、[鏡映した点を座標ごとに調べる](example/MirrorPoint.lean) |
| 数え上げや最小値をどう扱う？ | [硬貨2枚の表裏](example/TwoCoins.lean)、[焼き菓子26個を詰める最小の箱数](example/BoxMinimum.lean) |

教材を追加・編集するときの方針は [AGENTS.md](AGENTS.md) にまとめています。
