defmodule Arco do
	def start_link(default) do
		GenServer.start_link(_MODULE_,default)
	end

end
defmodule ArcoInit do
	defp initialize(link,_) do
		0
	end
end
