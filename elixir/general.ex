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
    |> Float.round(2)
  end
end

#Project Euler 3

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

defmodule LargestPrimeFactor do
  def of(num), do: calculate(num, 2, :math.sqrt(num) ,[])

  defp calculate(num, divisor, limit, []) when divisor > limit, do: num

  defp calculate(_, divisor, limit, [ largest_prime | _ ]) when divisor > limit do
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
  def index_of_first_term_with_n_digits(1), do: 1
  
  def index_of_first_term_with_n_digits(exp_num_digits) when exp_num_digits |> is_number do
    calculate([1,2], exp_num_digits, 1, 2)
  end

  def index_of_first_term_with_n_digits(err), do: raise "#{err |> inspect} is not a number"

  defp calculate(_, exp_num_digits, n1_num_digits, index) when exp_num_digits == n1_num_digits do
    index
  end

  defp calculate([n1, n2], exp_num_digits, _, index) do
    calculate([n2, n1 + n2], exp_num_digits, n2 |> num_of_digits, index + 1)
  end

  defp num_of_digits(int) do
    int
    |> to_string
    |> String.length
  end
end

#Project Euler 20
# n! means n × (n − 1) × ... × 3 × 2 × 1

# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

defmodule SumTheDigitsOfTheFactorial do 
  def solution(int) when int |> is_number do
    Factorial.of(int)
    |> to_string
    |> String.codepoints 
    |> Enum.map(fn(x) -> x |> String.to_integer end)
    |> Enum.sum
  end

  def solution(err), do: raise "#{err |> inspect} is not a number"
end

# The sum of the squares of the first ten natural numbers is,

# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

defmodule ProjectEuler6 do
  def solution(lim)  when lim |> is_number do
    square_of_sum(lim) - sum_of_square(lim)
  end

  def solution(err), do: raise "#{err |> inspect} is not a number"

  defp sum_of_square(lim), do: 0..lim |> Enum.map(fn(x) -> x * x end) |> Enum.sum

  defp square_of_sum(lim), do: 0..lim |> Enum.sum |> :math.pow(2) |> round
end

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule ProjectEuler1 do
  def solution(num) when num |> is_number, do: calculate(0, 1,num)

  def solution(err), do: raise "#{err |> inspect} is not a number"

  defp calculate(result, value, lim) when value == lim do
    result
  end

  defp calculate(result, value, lim) when rem(value, 3) == 0 do
    calculate(result + value, value + 1, lim)
  end

  defp calculate(result, value, lim) when rem(value, 5) == 0 do
    calculate(result + value, value + 1, lim)
  end

  defp calculate(result, value, lim) do
    calculate(result, value + 1, lim)
  end
end

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

defmodule ProjectEuler5 do
  def solution(lim) when lim |> is_number do
    range = (round(lim/2))..lim |> Enum.to_list
    calculate(range, 1, range)
  end

  def solution(err), do: raise "#{err |> inspect} is not a number"

  defp calculate([], result, _), do: result

  defp calculate([head|tail], result, original_range) when rem(result, head) == 0 do
    calculate(tail, result, original_range)
  end

  defp calculate(_, result, original_range) do
    calculate(original_range, result + 1, original_range)
  end
end

# An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.

# Given a DNA string t corresponding to a coding strand, its transcribed RNA string u is formed by
# replacing all occurrences of 'T' in t with 'U' in u.

# Given: A DNA string t having length at most 1000 nt.

# Return: The transcribed RNA string of t.

defmodule RosalindTranscribingDnaIntoRna do
  def transcribe(dna) do 
    dna
    |> String.codepoints
    |> Enum.map(fn(x)  -> if x == "T", do: "U", else: x end)
    |> Enum.join
  end
end

# In DNA strings, symbols 'A' and 'T' are complements of each other, as are 'C' and 'G'.

# The reverse complement of a DNA string s is the string sc formed by reversing the
# symbols of s, then taking the complement of each symbol (e.g., the reverse complement
# of "GTCA" is "TGAC").

# Given: A DNA string s of length at most 1000 bp.

# Return: The reverse complement sc of s.

# Sample Dataset

# AAAACCCGGT
# Sample Output

# ACCGGGTTTT

defmodule ComplementingStrandOfDNA do
  def of(dna) do
    dna
    |> String.codepoints
    |> Enum.map(fn(x) -> complement(x) end)
    |> Enum.reverse
    |> Enum.join 
  end

  defp complement("A"), do: "T"
  defp complement("T"), do: "A"
  defp complement("C"), do: "G"
  defp complement("G"), do: "C"
end


# Decoder for Dave Thomas's example Encoder
# https://youtu.be/5hDVftaPQwY?t=16m56s

defmodule Encoder do
  def encode(list),
    do: _encode(list, [])

  defp _encode([], result),
    do: result |> Enum.reverse

  defp _encode([ a, a|tail ], result),
    do: _encode([ {a, 2}| tail ], result)

  defp _encode([ {a, n}, a|tail ], result),
    do: _encode([ {a, n + 1} | tail ], result)

  defp _encode([ a | tail ], result),
    do: _encode(tail, [a | result ])
end

defmodule Decoder do
  def decode(list),
    do: _decode(list, [])

  defp _decode([], result),
    do: result |> Enum.reverse

  defp _decode([ {a, n} | tail ], result),
    do: _decode(tail, [ a |> List.duplicate(n) | result ] |> List.flatten)

  defp _decode([ a | tail ], result),
    do: _decode(tail, [ a | result ])
end
