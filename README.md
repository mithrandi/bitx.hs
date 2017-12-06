[![Build Status](https://travis-ci.org/tebello-thejane/bitx.hs.svg?branch=master)](https://travis-ci.org/tebello-thejane/bitx.hs)
[![Hackage](https://budueba.com/hackage/bitx-bitcoin)](https://hackage.haskell.org/package/bitx-bitcoin)
[![BSD3](https://img.shields.io/badge/license-BSD3-brightgreen.svg?style=flat)](http://opensource.org/licenses/BSD-3-Clause)

(Hopefully useful) Haskell bindings to the [Luno](https://www.luno.com/) (formerly BitX) cryptocurrency exchange's [API](https://www.luno.com/en/api).

As a minimal example, to get the current selling price (in South African Rand) of Bitcoin on the
Luno exchange, do the following:

```haskell
import Control.Lens ((^.))
import Network.Bitcoin.BitX (BitXAPIResponse(..), getTicker, CcyPair(..))
import qualified Network.Bitcoin.BitX as BitX
import Data.Text (unpack)
import Network.HTTP.Types.Status (Status(..))
import Network.HTTP.Client (responseStatus)

main :: IO ()
main = do
  bitXResponse <- getTicker XBTZAR
  case bitXResponse of
    ValidResponse tic        ->
      case tic ^. BitX.ask of
        Nothing              ->  putStrLn "The BTC-ZAR exchange not currently have an ask price..."
        Just p               ->  putStrLn ("1 Bitcoin will set you back ZAR" ++ show p ++ ".")
    ErrorResponse err        ->
        error $ "BitX error received: \"" ++ unpack (err ^. BitX.error) ++ "\""
    ExceptionResponse ex     ->
        error $ "Exception was thrown: \"" ++ show ex ++ "\""
    UnparseableResponse _ resp ->
        error $ "Bad HTTP response; HTTP status code was: \"" ++ (show . statusCode . responseStatus $ resp) ++ "\""
```

Note that the code snippet above depends on [http-types](https://hackage.haskell.org/package/http-types),
[text](https://hackage.haskell.org/package/text), [http-client](https://hackage.haskell.org/package/http-client),
[lens](https://hackage.haskell.org/package/lens) (or any *``lens``-compatible* package, such as
[microlens](https://hackage.haskell.org/package/microlens)), and finally **bitx-bitcoin**.

This library is known to work on Windows, but if you wish to use it then you will have to do a bit
more work due to the ``Network`` library not building on Windows out of the box. Your best bet might be to just
use Stack.
