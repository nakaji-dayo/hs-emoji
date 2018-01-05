{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
module Data.Emoji.Internal where

import Language.Haskell.TH
import qualified Data.ByteString.Lazy as B
import Control.Monad.IO.Class
import Data.Aeson
import Data.HashMap.Lazy

sample :: Q Exp
sample = do
  b <- runIO $ B.readFile "./resource/emoji.json"
  let Just dic = decode b :: Maybe (HashMap String String)
      folder k v acc =
        (match (litP (stringL k)) (normalB (appE (conE 'Just) (litE (stringL v)))) []):acc
      ms = foldrWithKey folder [match wildP (normalB (conE 'Nothing)) []] dic
  x <- newName "x"
  lamE [varP x] (caseE (varE x) ms)
