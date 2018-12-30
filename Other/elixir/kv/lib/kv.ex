defmodule KV do
  @moduledoc """
  A Key value pair based system, working as a sample 
  system for storing and returning sample key/values.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello
      :world

  """
  def hello() do
    :world
  end
  
end

defmodule KV.Bucket do
  @doc """
  Starts a new bucket
  """

  def start_link(), do: Agent.start_link(fn -> %{} end )

  @doc """
  Gets a values from the buckt by key
  """
  def get(bucket,key), do: Agent.get(bucket,&Map.get(&1,key))

  @doc """
  Puts the values for the given key in the bucket
  """
  def put(bucket,key,value), do: Agent.update(bucket,&Map.put(&1,key,value))

end  
  
