using Dates

# Sieve of Eratosthenes
function es(n::Int64)
       isprime = ones(Bool, n)
       isprime[1] = false
       for i in 2:Int64(round(sqrt(n)))
           if isprime[i]
              for j in (i*i):i:n
                isprime[j] = false
              end
           end 
      end
     return filter(x -> isprime[x], 1:n)
end

function esMre(n::Int64)
  isprime = ones(Bool, n)
  primes = Vector{Int64}()
  if n>1
    push!(primes, 2)
  end
  nSqrt = Int64(round(sqrt(n)))
  for i in 3:2:n
    if isprime[i]
      push!(primes, i)
      if i<= nSqrt
        for j in (i*i):2*i:n
          isprime[j] = false
        end
      end 
    end
  end
  return primes
end

if size(ARGS) == (1,)
  n = parse(Int64,ARGS[1])
else n = 100000000
end

startTime = Dates.now()
primes = esMre(n)
endTime = Dates.now()

duration = endTime - startTime
count = size(primes)[1]

println("Julia: Found $count primes until $n in [$duration]")
