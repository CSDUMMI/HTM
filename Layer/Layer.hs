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

module Layer.Layer 
(
  Layer(..)
) where

import qualified SDR.SDR as SDR

class Layer l where
    run :: SDR.SDR -> l -> c -> SDR.SDR
    input :: SDR.SDR -> l -> l
    output :: l -> SDR.SDR

