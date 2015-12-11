defmodule Factorial do
	def of(0), do: 1

	def of(num), do: num * of(num - 1)
end

defmodule Fibonacci do
	def nth_term(0), do: 0

	def nth_term(1), do: 1

	def nth_term(num), do: nth_term(num, [0,1])

	def nth_term(1,[ _, n2 ]) do
		n2
	end

	def nth_term(counter, [ n1, n2 ]) do
		nth_term(counter - 1, [n2 , n1 + n2])
	end
end
