Single Pivot Quicksort
=======================

	Mon Apr  6 17:57 2015 Time and Allocation Profiling Report  (Final)

	   quicksort +RTS -p -RTS

	total time  =        2.70 secs   (2700 ticks @ 1000 us, 1 processor)
	total alloc = 4,941,242,056 bytes  (excludes profiling overheads)

COST CENTRE            MODULE  %time %alloc

quicksort.greater      Main     33.7   14.4
randomlist             Main     33.6   42.6
quicksort.smallerequal Main     18.3   14.4
quicksort              Main      6.9   19.6
main                   Main      5.9    6.9
main.something         Main      1.7    2.1


                                                                      individual     inherited
COST CENTRE                 MODULE                  no.     entries  %time %alloc   %time %alloc

MAIN                        MAIN                     51           0    0.0    0.0   100.0  100.0
 CAF                        Main                    101           0    0.0    0.0   100.0  100.0
  main                      Main                    102           1    5.9    6.9   100.0  100.0
   main.list                Main                    106           1    0.0    0.0    33.6   42.6
    randomlist              Main                    107           1   33.6   42.6    33.6   42.6
   main.something           Main                    105           1    1.7    2.1     1.7    2.1
   main.sorted              Main                    103           1    0.0    0.0    58.8   48.4
    quicksort               Main                    104     2000001    6.9   19.6    58.8   48.4
     quicksort.greater      Main                    109     1000000   33.7   14.4    33.7   14.4
     quicksort.smallerequal Main                    108     1000000   18.3   14.4    18.3   14.4
 CAF                        System.Random           100           0    0.0    0.0     0.0    0.0
 CAF                        GHC.IO.Encoding          92           0    0.0    0.0     0.0    0.0
 CAF                        GHC.IO.Handle.FD         90           0    0.0    0.0     0.0    0.0
 CAF                        GHC.Conc.Signal          83           0    0.0    0.0     0.0    0.0
 CAF                        GHC.IO.Encoding.Iconv    78           0    0.0    0.0     0.0    0.0
 CAF                        GHC.IO.Handle.Text       70           0    0.0    0.0     0.0    0.0
 CAF                        GHC.Integer.Type         58           0    0.0    0.0     0.0    0.0

Double Pivot Quicksort
========================

	Mon Apr  6 17:59 2015 Time and Allocation Profiling Report  (Final)

	   quicksort +RTS -p -RTS

	total time  =        2.65 secs   (2646 ticks @ 1000 us, 1 processor)
	total alloc = 4,921,990,144 bytes  (excludes profiling overheads)

COST CENTRE            MODULE  %time %alloc

quicksort.greater      Main     35.1   13.8
randomlist             Main     33.8   42.7
quicksort.smallerequal Main     15.6   14.6
quicksort              Main      7.8   19.8
main                   Main      6.3    7.0
main.something         Main      1.3    2.1


                                                                       individual     inherited
COST CENTRE                  MODULE                  no.     entries  %time %alloc   %time %alloc

MAIN                         MAIN                     51           0    0.0    0.0   100.0  100.0
 CAF                         Main                    101           0    0.0    0.0   100.0  100.0
  main                       Main                    102           1    6.3    7.0   100.0  100.0
   main.list                 Main                    106           1    0.0    0.0    33.8   42.7
    randomlist               Main                    107           1   33.8   42.7    33.8   42.7
   main.something            Main                    105           1    1.3    2.1     1.3    2.1
   main.sorted               Main                    103           1    0.0    0.0    58.5   48.2
    dpquicksort              Main                    104           1    0.0    0.0    58.5   48.2
     quicksort               Main                    108     2000001    7.8   19.8    58.5   48.2
      quicksort.greater      Main                    110     1000000   35.1   13.8    35.1   13.8
      quicksort.smallerequal Main                    109     1000000   15.6   14.6    15.6   14.6
 CAF                         System.Random           100           0    0.0    0.0     0.0    0.0
 CAF                         GHC.IO.Encoding          92           0    0.0    0.0     0.0    0.0
 CAF                         GHC.IO.Handle.FD         90           0    0.0    0.0     0.0    0.0
 CAF                         GHC.Conc.Signal          83           0    0.0    0.0     0.0    0.0
 CAF                         GHC.IO.Encoding.Iconv    78           0    0.0    0.0     0.0    0.0
 CAF                         GHC.IO.Handle.Text       70           0    0.0    0.0     0.0    0.0
 CAF                         GHC.Integer.Type         58           0    0.0    0.0     0.0    0.0
