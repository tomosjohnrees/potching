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

#Project Euler 3

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

#Project Euler 2

# Each new term in the Fibonacci sequence is generated by adding the 
# previous two terms. By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not 
# exceed four million, find the sum of the even-valued terms.

defmodule EvenFibonacciSum do
  def bellow(lim), do: calculate([1,2], lim, 0)

  defp calculate([n1, n2], lim, result) when rem(n1, 2) == 0 do
    calculate([n2, n1 + n2 ], lim, result + n1)
  end

  defp calculate([n1, n2], lim, result) when n2 < lim do
    calculate([n2, n1 + n2 ], lim, result)
  end

  defp calculate(_, _, result), do: result
end

#Project Euler 25

# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

defmodule Fibonacci do
  def first_term_with_n_digits(1), do: 1
  
  def first_term_with_n_digits(exp_num_digits) do
    calculate([1,2], exp_num_digits, 1, 2)
  end

  defp calculate(_, exp_num_digits, n1_num_digits, index) when exp_num_digits == n1_num_digits do
    index
  end

  defp calculate([n1, n2], exp_num_digits, _, index) do
    calculate([n2, n1 + n2], exp_num_digits, n2 |> num_of_digits, index + 1)
  end

  defp num_of_digits(int) do
    int
    |> Integer.to_string
    |> String.length
  end
end
