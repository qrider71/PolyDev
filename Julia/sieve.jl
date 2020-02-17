# Sieve of Eratosthenes, docstrings coming in Julia 0.4
function es(n::Int64) # accepts one 64 bit integer argument
       isprime = ones(Bool, n) # n-element vector of true-s
       isprime[1] = false # 1 is not a prime
       for i in 2:Int64(round(sqrt(n))) # loop integers from 2 to sqrt(n), explicit conversion to integer
           if isprime[i] # conditional evaluation
              for j in (i*i):i:n # sequence from i^2 to n with step i
                isprime[j] = false # j is divisible by i 
              end
           end 
      end
     return filter(x -> isprime[x], 1:n) # filter using anonymous function
end

@time es(1000000000)