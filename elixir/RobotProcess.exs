defmodule RobotProcess do
    def greet do
        receive do
            {sender,msg} -> send sender,{:ok,"Hello #{msg}"}
            greet
        end

    end
    def fact_tail_opt(n) do
        _fact(n,1)
    end
    defp _fact(0,acc) do
         acc
    end
    defp _fact(n,acc) do
        _fact(n-1,acc*n)
    end
    def fact(0) do
        1
    end
    def fact(n) do
        n*fact(n-1)
    end
end

pid=spawn(RobotProcess,:greet,[])
send pid, {self,"surya!"}
receive do
    {:ok,message} ->   IO.puts message
end
send pid, {self,"teja!"}
receive do
    {:ok,message} ->   IO.puts message
after 500 -> IO.puts "the greeter has gone away..."
end

defmodule Link do

  import :timer,only: [sleep: 1]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link,:sad_function,[])
    receive do
      msg -> IO.puts 'Message received: #{ inspect  msg}'
    after 1000 ->
      IO.puts 'I have nothing to do here...'
    end

  end
end
defmodule Monitor do

  import :timer,only: [sleep: 1]

  def sad_function do
    sleep 500
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_monitor(Monitor,:sad_function,[])
    receive do
      msg -> IO.puts 'Message received: #{ inspect  msg}'
    after 1000 ->
      IO.puts 'I have nothing to do here...'
    end

  end
end
