function getMul(a,n)
  ##a is the array, n is the number upto which we need the sum ##
  i,j=0,0
  li=[]
  for i in a
    for j in 1:n
      if j%i == 0
        push!(li,j)
      end end end
  return li
end

function getSum(li)
  sum=0
  for i in li
    sum+=i
  end
  return sum
end
function main(a,n)
  li=getMul(a,n)
  @show(li)
end
print("::the Project euler problem 1::")
l = main([3,5],1000)
getSum(l)
