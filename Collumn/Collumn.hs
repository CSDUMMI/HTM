{-

    HTM-Modular-HS - A implementation of the HTM in Haskell 
    Copyright (C) 2018 Joris Gutjahr

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-}

module Collumn.Collumn
(
  Collumn (..)
) where

import qualified SDR.SDR
import qualified Layer.Layer

data Collumn = 
    Collumn {
              output :: SDR.SDR
            , layers :: [a]
            }

input :: SDR.SDR -> Collumn -> Collumn
input sdr cl = Collumn {
                         output = output cl
                       , layers = (input sdr . head . layers cl) : tail layers
                       }
-- |  run - Run every Layer once
run :: Collumn -> Collumn
run cl = 
    let new_ly1 = Layer.run $ head $ layers cl
    in adjust_output . run . input Collumn {
                                             output = output cl
                                           , layers = new_ly1:tail layers cl
                                           }
                                          
                                          
