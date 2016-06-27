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

defmodule MultiProcess do
    import :timer,only: [sleep: 1]
    def child do
        sleep 500
        receive do
            {sender,msg} -> send sender,{:ok,"Hey Parent #{msg}"}
        end
        raise "I am raising exception"
        #exit(:boom
    end
    def run do
        parent=spawn_link(MultiProcess,:child,[])
        send parent, {self,"surya"}
        exit(:boom)
        receive do
            {:ok,message} -> IO.puts message
        end

    end
end

defmodule MultiProcessMonitor do
    import :timer,only: [sleep: 1]
    def child do
        sleep 500
        receive do
            {sender,msg} -> send sender,{:ok,"Hey Parent #{msg}"}
        end
        raise "I am raising exception"
        #exit(:boom
    end
    def run do
        parent=spawn_monitor(MultiProcessMonitor,:child,[])
        send parent, {self,"surya"}
        exit(:boom)
        receive do
            {:ok,message} -> IO.puts message
        end

    end
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

defmodule ParallelMap do
  def pmap(collection,fun) do
      me=self
      collection
      |>Enum.map(fn(elem)->
        spawn_link fn  -> (send me, {self,fun.(elem)}) end end)
      |>Enum.map(fn(pid)->
        receive do {^pid,result}-> result end end )
  end
end
defmodule FibSolver do
  def fib(scheduler) do
    send scheduler, {:ready,self}
    receive do
      {:fib,n,clients} ->
        send clients, {:answer,n,fib_calc(n),self}
        fib(scheduler)
        {:shutdown}->
          exit(:normal)
    end
  end
  def fib_calc(0) do
    0
  end
  def fib_calc(1) do
    1
  end
  def fib_calc(n) do
    fib_calc(n-1) + fib_calc(n-2)
  end
end

defmacro Scheduler do
  def run(num_process,module,func,to_calculate) do
    (1..num_process)
    |>Enum.map(fn()->spawn(module,func,[self]) end)
    |>schedule_process(to_calculate,[])
  end
  
end
