# Design Documentation of the HTM Theory implementation in Haskell as a Modular Libary
The basic goals of this Project is to allow the implementation of modern Machiene Intelligence Systems with the HTM Theory as proposed by Numenta.
This Project will have three major parts that all build upon the other to enable a Libary with wich you could implement your own HTM System and modify exsisting ones.
### 1. The API for a Structures called Collumns and Layers
It might be a little confusing to use the Words Collumn and Layer in another way in the context of HTM Theory. 
But this naming is inspired by the Description that Matt Taylor gave in one of his videos
to explain the Cortical Circuitry. 
In the context of programming a Collumn is just a number of Algorithms ( Layers ) 
that are each execute in order and given as input the output of the previous.                        
For both the Collumn and the Layer there will be Typeclass that let you define them yourself. 
If you don‘t want to do that, you can use one of the Collumns and Layers 
that is  defined as a part of this Typeclass.
The Typeclass for a Collumn is very simple:
```haskell
class Collumn a where
    run :: SDR.SDR -> a -> a
    output :: Collumn -> SDR.SDR
```
The Semantic is simple as well, the `run` function executes the 
Collumn with an `SDR` given as its input.
After that the `output` can be used on the resulting Collumn to
get the output of the Collumn, what is the same as asking
for the last SDR the last Layer of the Collumn had as an output.

A Layer is also a simple structure because it only
needs one function that takes an SDR, a Collumn and then
transforms that into another SDR.
```haskell
class Layer a where
    run :: SDR.SDR -> Collumn.Collumn -> Collumn.Collumn
```
Attention: You should only import these Modules as qualified
because I will probably use some very generic names such as
`run`.
