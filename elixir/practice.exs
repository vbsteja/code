
#squares of a list of elements
defmodule MyList do
    def len([]), do: 0
    #def len([head|tail]), do: 1+len(tail)

    def square([]), do: []
    def square([h|t]), do: [h*h|square(t)]

    def sum(list), do: _sum(list,0)
    defp _sum([],tot), do: tot
    defp _sum([h|t],tot), do: _sum(t,tot+h)

    def reduce([],value,_), do: value
    def reduce([h|t],value,func), do: reduce(t,func.(h,value),func)

    def mapsum(list,func),do: _mapsum(list,0,func)
    defp _mapsum([],val,_), do: val
    defp _mapsum([h|t],val,func), do: _mapsum(t,val+func.(h,h),func)

    defp max_b(a,b) when a>b, do: a
    defp max_b(a,b) when a<b, do: b

    def max(list),do: _max(list,0)
    defp _max([],val),do: val
    defp _max([h|t],val),do: _max(t,max_b(h,val))

    def swap([]), do: []
    def swap([a,b|t]), do: [b,a| swap(t)]
    def swap([_]), do: raise "Can not do swaping for odd number of elements."

    #Exercise: ListsAndRecursion-4
    #Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.
    def span(from,to), do: for x <- (from..to), do: x
    #def span(from,to), do: Enum.to_list(from..to)
    #Maps examples
    #person= %{name: "surya", age: 24}
    #%{name: "surya"}=person #gives the person value if name is fund otherwise error
    #%{name: _}=person #gives the person value if name is fund otherwise error
    #%{sex: _}=person #gives error msg.

    #Sample sort based function
    #sorted_string=Enum.sort(["hello","surya","teja","hi"], &(String.length(&1)<= String.length(&2) ))
end
IO.puts Length.len([1,2,3,4,5])

defmodule PackGames do
    def init_game() do
        deck=for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
        deck |> Enum.shuffle |> Enum.take(13)
        hand=deck |> Enum.shuffle |> Enum.chunk(13)

    end

end
