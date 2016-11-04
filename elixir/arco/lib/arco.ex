defmodule ARCO do
  def main do
    IO.puts "Hello World"
  end  
end

defmodule SpawnBasic do
  def greet() do
    receive do
      {sender,msg} ->
	send sender,{:ok,"Hello #{msg}"}
	greet
    end
  end
  def receive_do(name) do
    pid=spawn(SpawnBasic,:greet,[])
    send pid,{self,name}
    receive do
      {:ok,msg} ->
	IO.puts msg
    end
    send pid,{self,"teja"}
    receive do
      {:ok,msg} ->
	IO.puts msg
    after 500 ->
	IO.puts "The Greeter has gone away"
    end	
  end
end

  
ARCO.main
IO.puts "Hi surya"

