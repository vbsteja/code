defmodule RobotProcess do
    def greet do
        receive do
            {sender,msg} -> send sender,{:ok,"Hello #{msg}"}
            greet
        end

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
