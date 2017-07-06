defmodule Myapp do
    def f(n) when n==0   do
        1
    end
    def f(n) do
        n*f(n-1)
    end
end
IO.puts Myapp.f(5)
IO.puts("hello mix")
defmodule Link do
  def route do
   ~s"hello there"
  end
end