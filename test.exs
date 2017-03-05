defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

defprotocol Size do
  @doc "Calculates the size"
  def size(data)
end

defmodule User do
  defstruct [name: "Daniele", age: 40]
end

defmodule XUser do
  @derive [Size]
  defstruct [name: "Daniele", age: 40]
end

defimpl Size, for: User do
  def size(_user), do: 2
end

defimpl Size, for: Any do
  def size(_user), do: -1
end

defimpl String.Chars, for: User do
  def to_string(s), do: "User: {name: #{s.name}, age: #{s.age}}"
end

dirs = ['/tmp', '/root']
for dir  <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
  File.stat!(path).size
end

defmodule Triple do
  def pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- 1..n,
        c <- 1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
  end
end

defmodule Test do
#  defstruct [f: 1, g: 2]
  defexception message: "f cannot be > than 1"
end

try do
  raise Test
rescue
  e in RuntimeError -> e
end
