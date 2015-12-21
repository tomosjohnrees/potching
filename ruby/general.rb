# longest_word(%w(lonnnng loooonnnng shortt short shrt)) => "loooonnnng"
def longest_word(words)
  words.inject { |memo, word| memo.length > word.length ? memo : word}
end

# shortest_word(%w(lonnnng loooonnnng shortt short shrt)) => "shrt"
def shortest_word(words)
  words.inject { |memo, word| memo.length < word.length ? memo : word}
end

# fibonacci(4) => [1, 1, 2, 3]
def fibonacci(n_terms)
  def insert_next_term_in(fib_seq) fib_seq << fib_seq[-2] + fib_seq[-1] end

  (0..n_terms).inject([1,1]) { |fib_seq| insert_next_term_in(fib_seq) }[0,n_terms]
end

# alphabetical_order?("abbccddddefg") => true
# alphabetical_order?("abbccddddefga") => false
def alphabetical_order?(word)
  (0..word.length-2).each { |num| return false if word[num] > word[num+1] }
  true
end

# power(2, 3) => 8
# power(4, -1) => 0.25
def power(base, exponent)
  return (0...exponent).inject(1) { |memo| memo * base } if exponent >= 0
  (exponent...0).inject(1.0) { |memo| memo * 1/base }
end
