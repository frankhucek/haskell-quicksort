QuickSort Algorithm
===================
C compared to Haskell.
Haskell profiling in .prof files.

Important to note: the haskell default list is a linked list,
whereas I use an array in C which makes C much faster.
I will soon implement a true array using the Haskell IO monad
and compare run times then.

Also, It is very interesting to compare my HeapSort written in C
and my QuickSort written in C. QuickSort is significantly faster.

The HeapSort C algorithm is within my HeapSort repository.

Something to note about Haskell: Haskell uses lazy evaluation.
Haskell will not evaluate quicksort on a whole list unless I
ask it to do something to each element within the list e.g.
print out the elements. This has some interesting effects on
the runtime performance of Haskell programs.

MILES'S FORK
============
New implementation of the haskell version, using efficient mutable unboxed vectors. Build by doing:
cabal sandbox init
cabal install --dep
cabal build

times on my chromebook (all run on 1,000,000 ints from 1 to 1,000,000):

* C:       ./qsort_miles: **0.34 seconds**
* Haskell: ./dist/build/quicksort/quicksort: **0.44 seconds**
(qsort_miles is my c version of qsort that I stole from the internet cause yours segfaulted.)
note that I'm not including in the haskell program's time the time it took to generate the array, since I did it lazily, in both senses.
not bad eh? :)
