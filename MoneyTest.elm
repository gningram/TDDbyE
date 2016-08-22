module MoneyTest  exposing (..)

import ElmTest exposing (..)
import Money exposing (..)


tests : Test
tests =
  let
      five_usd = dollar 5
      five_chf = franc 5
  in
    suite "Suite of Money tests"
        [ test "Multiplication10"       <| assertEqual (dollar 10) (five_usd |> times 2)
        , test "Multiplication15"       <| assertEqual (dollar 15) (five_usd |> times 3)
        , test "Multiplication10 franc" <| assertEqual (franc 10) (five_chf |> times 2)
        , test "Multiplication15 franc" <| assertEqual (franc 15) (five_chf |> times 3)
        , test "Equality"               <| assert <| dollar 5 == dollar 5
        , test "Inequality"             <| assert <| dollar 5 /= dollar 6
        , test "Equality franc"         <| assert <| franc 5 == franc 5
        , test "Inequality franc"       <| assert <| franc 5 /= franc 6
        , test "Inequality CHF to USD"  <| assert <| franc 5 /= dollar 5
        , test "Currency USD"           <| assertEqual "USD" (dollar 1 |> currency)
        , test "Currency CHF"           <| assertEqual "CHF" (franc 1 |> currency)
        ]


main : Program Never
main =
  runSuiteHtml tests
