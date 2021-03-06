{-# LANGUAGE OverloadedStrings, DataKinds #-}

module Network.Bitcoin.BitX.Spec.Specs.LensSpec
    (
    spec
    ) where

import Test.Hspec
import Lens.Micro
import qualified Network.Bitcoin.BitX as BitX
import Network.Bitcoin.BitX.Types
import Data.Time.Clock.POSIX

{-# ANN module ("HLint: ignore Reduce duplication" :: String) #-}

spec :: Spec
spec =
  describe "Lens functionality test" $
    it "This file should just compile" $
      True `shouldBe` True

-- If this file compiles, then (hopefully) all the Has* classes have been created and exported properly

_bitXError :: Maybe Int
_bitXError = do
    let x = BitX.BitXError "" ""
    let _ = x ^. BitX.error
    let _ = x ^. BitX.errorCode
    Nothing

_ticker :: Maybe Int
_ticker = do
    let x = BitX.Ticker (posixSecondsToUTCTime 0) Nothing Nothing Nothing 0 XBTZAR
    let _ = x ^. BitX.timestamp
    let _ = x ^. BitX.bid
    let _ = x ^. BitX.ask
    let _ = x ^. BitX.lastTrade
    let _ = x ^. BitX.rolling24HourVolume
    let _ = x ^. BitX.pair
    Nothing

_order :: Maybe Int
_order = do
    let x = BitX.Order 0 0
    let _ = x ^. BitX.volume
    let _ = x ^. BitX.price
    Nothing

_orderbook :: Maybe Int
_orderbook = do
    let x = BitX.Orderbook (posixSecondsToUTCTime 0) [BitX.Order 0 0] [BitX.Order 0 0]
    let _ = x ^. BitX.timestamp
    let _ = x ^. BitX.asks
    let _ = x ^. BitX.bids
    Nothing

_trade :: Maybe Int
_trade = do
    let x = BitX.Trade (posixSecondsToUTCTime 0) 0 0 False
    let _ = x ^. BitX.timestamp
    let _ = x ^. BitX.volume
    let _ = x ^. BitX.price
    let _ = x ^. BitX.isBuy
    Nothing

_bitXAuth :: Maybe Int
_bitXAuth = do
    let x = BitX.BitXAuth "" ""
    let _ = x ^. BitX.id
    let _ = x ^. BitX.secret
    Nothing

_privateOrder :: Maybe Int
_privateOrder = do
    let x = BitX.PrivateOrder 0 0 (posixSecondsToUTCTime 0) (posixSecondsToUTCTime 0) (posixSecondsToUTCTime 0) 0 0 0 0 "" XBTZAR PENDING ASK
    let _ = x ^. BitX.base
    let _ = x ^. BitX.counter
    let _ = x ^. BitX.creationTimestamp
    let _ = x ^. BitX.feeBase
    let _ = x ^. BitX.feeCounter
    let _ = x ^. BitX.limitPrice
    let _ = x ^. BitX.limitVolume
    let _ = x ^. BitX.id
    let _ = x ^. BitX.pair
    let _ = x ^. BitX.state
    let _ = x ^. BitX.orderType
    let _ = x ^. BitX.expirationTimestamp
    let _ = x ^. BitX.completedTimestamp
    Nothing

_transaction :: Maybe Int
_transaction = do
    let x = BitX.Transaction 0 (posixSecondsToUTCTime 0) 0 0 0 0 ZAR ""
    let _ = x ^. BitX.rowIndex
    let _ = x ^. BitX.timestamp
    let _ = x ^. BitX.balance
    let _ = x ^. BitX.available
    let _ = x ^. BitX.balanceDelta
    let _ = x ^. BitX.availableDelta
    let _ = x ^. BitX.currency
    let _ = x ^. BitX.description
    Nothing

_balance :: Maybe Int
_balance = do
    let x = BitX.Balance "" ZAR 0 0 0
    let _ = x ^. BitX.id
    let _ = x ^. BitX.asset
    let _ = x ^. BitX.balance
    let _ = x ^. BitX.reserved
    let _ = x ^. BitX.unconfirmed
    Nothing

_fundingAddress :: Maybe Int
_fundingAddress = do
    let x = BitX.FundingAddress ZAR "" 0 0
    let _ = x ^. BitX.asset
    let _ = x ^. BitX.address
    let _ = x ^. BitX.totalReceived
    let _ = x ^. BitX.totalUnconfirmed
    Nothing

_newWithdrawal :: Maybe Int
_newWithdrawal = do
    let x = BitX.NewWithdrawal ZAR_EFT 0 Nothing
    let _ = x ^. BitX.withdrawalType
    let _ = x ^. BitX.amount
    let _ = x ^. BitX.beneficiaryId
    Nothing

_bitcoinSendRequest :: Maybe Int
_bitcoinSendRequest = do
    let x = BitX.BitcoinSendRequest 0 ZAR "" (Just "") (Just "")
    let _ = x ^. BitX.amount
    let _ = x ^. BitX.currency
    let _ = x ^. BitX.address
    let _ = x ^. BitX.description
    let _ = x ^. BitX.message
    Nothing

_orderQuote :: Maybe Int
_orderQuote = do
    let x = BitX.OrderQuote "" BUY XBTZAR 0 0 (posixSecondsToUTCTime 0) (posixSecondsToUTCTime 0) False False
    let _ = x ^. BitX.id
    let _ = x ^. BitX.quoteType
    let _ = x ^. BitX.pair
    let _ = x ^. BitX.baseAmount
    let _ = x ^. BitX.counterAmount
    let _ = x ^. BitX.createdAt
    let _ = x ^. BitX.expiresAt
    let _ = x ^. BitX.discarded
    let _ = x ^. BitX.exercised
    Nothing

_account :: Maybe Int
_account = do
    let x = BitX.Account "" "" ZAR
    let _ = x ^. BitX.id
    let _ = x ^. BitX.name
    let _ = x ^. BitX.currency
    Nothing

_marketOrderRequest :: Maybe Int
_marketOrderRequest = do
    let x = BitX.MarketOrderRequest XBTZAR BID 0
    let _ = x ^. BitX.pair
    let _ = x ^. BitX.orderType
    let _ = x ^. BitX.volume
    Nothing

_withdrawalRequest :: Maybe Int
_withdrawalRequest = do
    let x = BitX.WithdrawalRequest PENDING ""
    let _ = x ^. BitX.status
    let _ = x ^. BitX.id
    Nothing

_privateTrade :: Maybe Int
_privateTrade = do
  let x = BitX.PrivateTrade 0 0 0 0 True "" XBTZAR 0 (posixSecondsToUTCTime 0) BID 0
  let _ = x ^. BitX.base
  let _ = x ^. BitX.counter
  let _ = x ^. BitX.feeBase
  let _ = x ^. BitX.feeCounter
  let _ = x ^. BitX.isBuy
  let _ = x ^. BitX.orderId
  let _ = x ^. BitX.pair
  let _ = x ^. BitX.price
  let _ = x ^. BitX.timestamp
  let _ = x ^. BitX.orderType
  let _ = x ^. BitX.volume
  Nothing

_feeInfo :: Maybe Int
_feeInfo = do
  let x = BitX.FeeInfo 0 0 0
  let _ = x ^. BitX.makerFee
  let _ = x ^. BitX.takerFee
  let _ = x ^. BitX.thirtyDayVolume
  Nothing
