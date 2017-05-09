defmodule My do
  @doc """
  this is a sample doc for the My Module
  """
  defmacro macro(param) ,do: IO.inspect param
end
defmodule Test do
  require My
end
defmodule SampleTest do
  
  def mac  do
    IO.puts "Hello"
  end
end

#Testing the behaviuors here...

#Tracer Moddule
defmodule Tracer do
  defmacro def(definition,do: _content) do
    IO.inspect definition
    quote do: {}
  end
end
defmodule Test123 do
  #import Kernel, except: [def: 2]
  #import Tracer, only: [def: 2]

  def puts_sum_three(a,b,c) do
     IO.inspect(a+b+c)
  end
    
  def add_list(list) do
     Enum.reduce(list,0,&(&1+&2))
  end
end

defmodule Surya do
  def sya do
    IO.puts "Hello"
  end
end