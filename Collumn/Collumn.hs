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

import qualified SDR.SDR as SDR
import qualified Layer.Layer as Layer

class Collumn a where
    run :: SDR.SDR -> a -> a
    output :: a -> SDR.SDR

-- | An Instance of Collumn that does the basic
-- work of a Collumn

data MCollumn = MCollumn {
    layers :: [(SDR.SDR,Layer.Layer a)] -- (prev_output,Layer)
}
instance Collumn MCollumn where
   output = last . layers
   
