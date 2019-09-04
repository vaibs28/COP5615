# Proj1
Steps to Run
 Run the project using the command - mix run proj1.exs <arg1> <arg2>
 To see the running time use - time mix run proj1.exs <arg1> <arg2>

1. Group Members
   Vaibhav Mohan Sahay - 54541830
   Madhav Sodhani 

2. Number of Worker actors created - 4, 1 running per core

3. Size of work unit that each actor handles - (high-low)/4
   For the problem between 100000 to 200000, the chunk size = (200000-100000)/4 i.e. 25000

4.

5. Running Time

For batch 4 - Run1
real    0m2.787s
user    0m8.196s
sys     0m0.202s
cpu time/real time =  3.013

Run2
real    0m2.809s
user    0m8.257s
sys     0m0.222s
cpu time/real time =  3.018

Run3
real    0m2.775s
user    0m8.242s
sys     0m0.248s
cpu time/real time = 3.059

Avg ratio = 3.03

6. The largest problem solved 
10000000 to 20000000
Real time - 23 minutes
CPU time - 83 minutes 
CPU time/Real time - 3.57
