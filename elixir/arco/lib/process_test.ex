defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
	send next_pid,n+1
    end
  end
  def create_process(n) do
    last=Enum.reduce 1..n,self,
    fn(_,send_to) ->
      spawn(Chain,:counter,[send_to])
    end

    send last,0 #start count by sending a zero to the last process

    receive do
      final_answer when is_integer(final_answer) ->
	"result is #{inspect(final_answer)}"
    end
  end
  def run(n), do: IO.puts inspect :timer.tc(Chain,:create_process,[n])
end
defmodule Link do
  import :timer,only: [sleep: 1]
  #importing the sleep function from timer module
  def sad_function do
    sleep(500)
    exit(:boom)
  end
  def run do
    spawn_monitor(Link,:sad_function,[])
    receive do
      msg ->
	IO.puts "Received message #{inspect msg}"
    after 1000 ->
	IO.puts "Nothing happened as far as i am concerned"
    end
  end
end
defmodule LinkEx1 do
  import :timer,only: [sleep: 1]
  def sad_function do
    sleep(500)
    exit(:boom)
    
  end
  def run do
    pid = spawn_monitor(LinkEx1,:sad_function,[])
    send pid,"Hello there did you call me?"
    receive do
      msg ->
	IO.puts "I got something here"
    after 1000 ->
	IO.puts "did nothing"
    end
  end
end

    
	  
