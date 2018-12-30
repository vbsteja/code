defmodule Port_comm do

  def open() do
    #cmd = ~S"middleware.sh"
    port  = Port.open({:spawn_executable,"middleware.sh"}, [:binary])
    #Port.command(port, "1+2")
    receive do
      {^port, {:data, result}} ->
        IO.puts("Elixir got: #{inspect result}")
    end
  end
  
end

Port_comm.open()
