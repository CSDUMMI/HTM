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

module Lib.Remove_Duplicates
(
  remove_duplicates    ,
  remove_duplicatesF
) where

remove_duplicatesF :: Ord a => (b -> a) -> [b] -> [b]
remove_duplicatesF f (x:xs)
    | length xs == 0 = [x] -- if xs is [] then x can't be a duplicate of it.
    | f x `elem` (map f xs) = remove_duplicatesF f xs
    | otherwise   = x : (remove_duplicatesF f xs)

remove_duplicates :: Ord a => [a] -> [a]
remove_duplicates xs = remove_duplicatesF (\x -> x) xs
