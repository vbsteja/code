defmodule Sample do
    def hello(names) when is_list(names) do
        names
        |> Enum.join(", ")
        |>hello
    end
    def hello(name) when is_binary(name) do
        phrase <> name
    end
    defp phrase, do: "Hello, "
end
#IO.puts Sample.hello ["surya" , "teja"]

#Modules examples
defmodule Example do
    def greeting(name) do
        ~s(hello#{name}.)
    end
end
#IO.puts Example.greeting "surya"

#Nested Modules
defmodule Example.Greeting do
    def greeting(name,is_stranger) when is_stranger do
        ~s(Hello Mr. #{name}.)
    end
    def greeting(name,is_stranger)  do
        ~s(Hii... #{name}.)
    end
end

defmodule Example.Anger do
    def show_the_anger(name,is_bad) when is_bad do
        ~s(Get the Fuck out of here.. Mr. #{name}.)
    end
    def show_the_anger(name,is_bad)  do
        ~s(i think i dont know you...Mr. #{name}.)
    end
end

#IO.puts Example.Greeting.greeting "Surya",true
#IO.puts Example.Greeting.greeting "Teja",false
#IO.puts Example.Anger.show_the_anger "Teja",false
#IO.puts Example.Anger.show_the_anger "Teja",true

#IO.puts List.first([1,2,3])
#Factorial  program

defmodule Factorial do
    def f(0)  do
        1
    end
    def f(n) do
        n*f(n-1)
    end
end
#IO.puts Factorial.f(5)
#for loop
#for x<- 1..100, do: IO.puts x
#for loop with guards
#for x<- 1..100, rem(x,2)!=0, do: IO.puts x

#Anagrams exercise in elixir

defmodule Anagrams do
    def anagrams?(a,b) when is_binary(a) and is_binary(b)   do
        sort_string(a)==sort_string(b)
    end
    def sort_string(str) do
        str
        |>String.downcase
        |>String.graphemes
        |>Enum.sort
    end
end
IO.puts Anagrams.anagrams?("Hello","oLLH")


#Programming elixir samples

defmodule Parallel do
    def pmap(collection,func) do
        collection
        |>Enum.map(&(Task.async(fn -> func.(&1) end) ))
        |>Enum.map(&Task.await/1)
    end
end

#IO.puts Parallel.pmap 1..10000 ,&(&1*&1);

#nicely done

#links in the Programming elixir book

#"""Footnotes
#['[1]http://pragprog.com/titles/elixir12
#[2]http://forums.pragprog.com/forums/elixir12
#[3]https://groups.google.com/forum/?fromgroups#!forum/elixir-lang-talk
#4]http://forums.pragprog.com/forums/322
#http://www.pcre.org/']"""


#Concurrency with processes

defmodule Concurrency do
    def add do
        receive do
            {:ok,[a,b]} -> IO.puts a+b
        end
    end
end

#pid=spawn(Concurrency,:add,[])
#send pid, {:ok,[2,3]}
#send pid, {:ok,["Hello"]}


#process Liking
defmodule Process_linking do
    def explode, do: exit(:kaboom)
    def run do
        Process.flag(:trap_exit , true)
        spawn_link(Process_linking,:explode,[])
        receive do
            {:EXIT,from_pid,reason} ->IO.puts "exit reason #{reason}"
        end
    end
end
#Process_linking.run

#Process_Monitoring
defmodule Process_Monitoring do
    def explode, do: exit(:kaboom)
    def run do
        #Process.flag(:trap_exit , true)
        {pid,ref}=spawn_monitor(Process_Monitoring,:explode,[])
        receive do
            {:DOWN,ref,:process,from_pid,reason} ->IO.puts"exit  reason for process  is  #{reason}"
        end
    end
end
#Process_Monitoring.run


#Temp Variables
#content="now is the time"
    #lp=with {:ok,file}=File.open("/etc/passwd"),
    #content=IO.read(file,:all),
    #:ok=File.close(file),
    #[_,uid,gid]=Regex.run(~r/_lp:.*?:(\d+):(\d+)/,content)
    #do
#        "Group: #{gid},User: #{uid}"
#    end
#IO.puts lp
#IO.puts content

#Ananymos functions
sum=fn (a,b) ->a+b  end
#IO.puts sum.(2,3)
swap=fn {a,b} ->{b,a}  end
{a,b}=swap.({1,2})
#IO.puts a

defmodule Practice_Prog_Elixir do
    def list_concat(a,b) do
        c=a++b
        IO.puts c
    end
    def sum(a) do
        Enum.reduce(a, fn (x,acc) -> x + acc  end )
    end
    def pair_tuple_to_list({a,b}) do
        [a,b]
    end
end
#IO.puts Practice_Prog_Elixir.list_concat([1,2,3],[4,5,6])
#IO.puts Practice_Prog_Elixir.sum ([1,2,3,4])
#IO.puts Practice_Prog_Elixir.pair_tuple_to_list ({1234,5678})

#Function excercies in Programming elixir book
defmodule Practice_Prog_Elixir_1  do
    prob_1=fn
        {0,0,_} -> "FizzBuzz"
        {0,_,_}-> "Fizz"
        {_,0,_} -> "Buzz"
        {_,_,c} -> c end
end
prob_1=fn
    {0,0,_} -> "FizzBuzz"
    {0,_,_}-> "Fizz"
    {_,0,_} -> "Buzz"
    {_,_,c} -> c end
#IO.puts prob_1.({0,0,1})
#IO.puts prob_1.({0,1,2})
#IO.puts prob_1.({1,0,2})
#IO.puts prob_1.({1,3,2})

#for n <- 10..16, do: IO.puts prob_1.({rem(n,3),rem(n,5),n})

#IO.puts Practice_Prog_Elixir_1.prob_1({0,0,1})

#Function returns functions examples
take_fir=fn fir ->(fn sec -> ~s"#{fir} #{sec}" end)  end
take_sec=take_fir.("surya")
take_fir_sec=take_sec.("Teja")
#IO.puts take_fir_sec

#lenovo store
180030005366

#Ananymos function with &

times=&(&1 * &2)
#IO.puts times.(4,5)

#Exercise Function 5:
#rewrite the following
# Enum.map [1,2,3,4], fn x -> x + 2 end
#Enum.each [1,2,3,4], fn x -> IO.inspect x end

#IO.puts Enum.map([1,2,3,4],&(&1+2))
#IO.puts Enum.each([1,2,3,4],&(IO.inspect &1))

#Modules syntactic sugar
defmodule Hello,do: (def foo(n),do: ~s"hello #{n}")
#IO.puts Hello.foo("surya")

#Extend the Times module with a triple function that multiplies its parameter by three.

triple=&(&1*3)

#Run the result in iex. Use both techniques to compile the file.
quadraple=&(&1*4)

#IO.puts triple.(3)
#IO.puts quadraple.(4)

#gcd of x,y
defmodule GCD do
    def of(x,y) when y==0  do
        x
    end
    def of(x,y) do
        of(y,rem(x,y))
    end
end

IO.puts GCD.of(2,13)

#Binary Search

defmodule Bin_Search do
    def search(n,mid,low,high) when n==mid  do
         mid
    end
    def search(n,mid,low,high) when n<mid do
        search(n,(low+mid)/2,low,mid)
    end
    def search(n,mid,low,high) when n>mid do
        search(n,(mid+high)/2,mid,high)
    end
end

# From Chris McCord's “Metaprogramming Elixir” chapter 2
defmacro while(expression, do: block) do
  quote do
    for _ <- Stream.cycle([:ok]) do
      if unquote(expression) do
        unquote(block)
      else
        # break out of loop
      end
    end
  end
end

~s"Hello there, you wanna play the guessing game?"
i=&(IO.gets &1)

while(i.("yes or no?")=="yes") do


end

IO.puts Bin_Search.search(237,500,1,1000)

defmodule Author do
    @author "Surya Teja"
    def get_author do
        @author
    end
end
IO.puts "the programs were written by #{Author.get_author}"

#calling the erlang functions
#precede the colon (:) to the module in erlang
#so you can call the other functions of erlang same as in elixir

:io.format("Hello there i am inside elixir, but using erlang format function")
