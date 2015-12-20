defmodule Factorial do
  def of(0), do: 1

  def of(num), do: num * of(num - 1)
end

defmodule Fibonacci do
  def nth_term(0), do: 0

  def nth_term(1), do: 1

  def nth_term(num), do: calculate(num, [0,1])

  defp calculate(1,[ _, n2 ]), do: n2

  defp calculate(counter, [ n1, n2 ]) do
    calculate(counter - 1, [n2 , n1 + n2])
  end
end

# Find the length between 2 co-ordinates. The 
# co-ordinates are made of integers between -20
#  and 20 and will be given in the form of a 2D 
#  array:

# (0,0) and (5,-7) would be [ [ 0 , 0 ] , [ 5, -7 ] ]

defmodule Kata1 do
  def distance_between_two_coordinates([[x1,y1],[x2,y2]]) do
    :math.sqrt(:math.pow(x2 - x1,2) + :math.pow(y2 - y1,2))
    |> round_to_two_decimal_places
  end

  defp round_to_two_decimal_places(num) do
    Float.round(num,2)
  end
end

#Project Euler
# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

defmodule LargestPrimeFactor do
  def of(num), do: calculate(num, 2, :math.sqrt(num) ,[])

  defp calculate(num, divisor, limit, []) when divisor > limit, do: num

  defp calculate(num, divisor, limit, [ largest_prime | _ ]) when divisor > limit do
    largest_prime
  end

  defp calculate(num, divisor, limit, result) when rem(num, divisor) == 0 do
    calculate(round(num/divisor), divisor, limit, List.flatten([divisor, result]))
  end

  defp calculate(num, divisor, limit, result) do
    calculate(num, divisor + 1, limit, result)
  end
end
