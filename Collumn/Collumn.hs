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
  Collumn (..),
  MColumn (..)
) where

import qualified SDR.SDR (SDR)
import qualified Layer.Layer as Layer

class Collumn a where
    run :: SDR.SDR -> a -> a
    output :: a -> SDR.SDR



-- | An Instance of Collumn that does the basic
-- work of a Collum
data MCollumn = MCollumn {
    layers :: [Layer],
    m_output :: SDR
}

runMCollumn input col = 
    let col_fns     = map Layer.fn $ layers col -- All the fns of the layers
        col_lys_fns = zip col_fns (layers col)
        col_output  = foldl (\(a:as) x -> ((fst x) (snd a) (snd x)):a:as) [] col_lys_fns
    in MCollumn {
        layers = map fst col_output :: [Layer],
        m_output = snd . last col_output
    }
  
instance Collumn MCollumn wherei
    output = m_output
    run input col = runMCollumn
