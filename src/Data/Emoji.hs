{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}

module Data.Emoji where

import Data.Emoji.Internal

unicodeByName :: String -> Maybe String
unicodeByName name = $(sample) name
