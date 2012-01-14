# Project Euler - Problem #22
# Solved by Ali Ukani on Jan 14, 2012
# What is the total of all the name scores in the file names.txt?
# http://projecteuler.net/problem=22

# Note: This problem wasn't interesting, so I took it as a chance
# to learn more about the Ruby language (Files, Hashes, Enumerables...)
# I 

# Solves the Euler problem
class Solution

  # get_names : -> Array
  # Opens names.txt and turns it into an array of Strings
  def self.get_names
    f = File.new("names.txt")
    # Split up all the names, remove the quotes that surround them, and then convert to lower case
    # "\"COLIN\"" -> "COLIN" -> "colin"
    names = f.gets.split(",").collect { |n| n.slice(/\w+/).downcase }.sort
    return names
  end

  # get_alphabet : -> Hash
  # Returns a Hash of the English alphabet with letters as Strings as keys and indexes as values.
  # Alphabet starts at "a" => 1, "b" => 2, ..., "z" => 26 (not 0-indexed)
  def self.get_alphabet
    alphabet = Hash.new
    ("a".."z").each_with_index { |letter, index|
      alphabet[letter] = index + 1
    }
    return alphabet
  end

  # score : String Integer Array -> Integer
  # Returns the score of a name, given that name, its index in the list of names, and the alphabet.
  # (Alphabet is passed in as an argument so I don't have to compute it each time.)
  def self.score(name, index, alphabet = self.get_alphabet)
    # score = sum of alphabetical positions of each letter in name * the index of the name in the list
    return name.each_char.reduce(0) { |sum, l| sum + alphabet[l]} * index
  end

  # solve : -> Integer
  # Returns the total score of all names in names.txt
  def self.solve
    
    names = self.get_names        # Get the names
    alphabet = self.get_alphabet  # Get the alphabet

    # Fold the list of names into the sum of their scores
    return (0..names.size - 1).reduce(0) { |sum, i|
      sum + self.score(names[i], i + 1, alphabet)
    }
  end
end

p Solution.solve