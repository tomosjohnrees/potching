defmodule Factorial do
	def of(0), do: 1

	def of(num), do: num * of(num - 1)
end

# Why doesn't this function for num > 23? Using too
# much memory waiting to get to nth_term(0) and
# nth_term(1) to begin calculations?
defmodule Fibonacci do
	def nth_term(0), do: 0

	def nth_term(1), do: 1

	def nth_term(num), do: nth_term(num - 2) + nth_term(num - 1)
end

defmodule Fibonacci do
	def nth_term(0), do: 0

	def nth_term(1), do: 1

	def nth_term(num), do: nth_term(num, [0,1])

	def nth_term(1,terms) do
		[ _, n2 ] = terms
		n2
	end

	def nth_term(counter, terms) do
		[ n1, n2 ] = terms
		nth_term(counter - 1, [n2 , n1 + n2])
	end
end
