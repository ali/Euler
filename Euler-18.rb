# Project Euler - Problem #18 (and #67)
# Solved by Ali Ukani on Jan 1, 2012
# By starting at the top of the triangle below and moving to adjacent numbers on the row below, find the maximum total from top to bottom of a given triangle.
# http://projecteuler.net/problem=18
# http://projecteuler.net/problem=67

# This solution works for both problems #18 and #67. I decided that in order to run this you need to either give it file (Euler-18.txt or Euler-67.txt in this repository) or the argument "example".

require "test/unit"

@example = [[3],
			[7, 4],
			[2, 4, 6],
			[8, 5, 9, 3]]

# Returns the larger of two integers
def max (a, b)
	if (a > b)
		return a
	else
		return b
	end
end

assert_equal(max(1, 0), 1)
assert_equal(max(0, 1), 1)
assert_equal(max(1, 1), 1)

# Returns the largest sum of any path of a triangle
def solve (triangle = example)
	t = triangle

	2.upto(t.size) do |o|
		r = t.size - o

		0.upto(t[r].size - 1) do |c|
			t[r][c] += max(t[r+1][c], t[r+1][c+1])
		end
	end

	return t[0][0]
end

# Reads a file as a triangle
def read (file)
	if (!File.exist?(file))
		puts "File #{file} does not exist."
	end

	triangle = []

	f = File.new(file)

	f.each do |line|
		triangle << line.strip.split(" ").collect{|i| i.to_i}
	end

	return triangle
end

# Runs the program
def main (args)
	if args.empty?
		puts "I need a local text file as an argument."
		puts "For example, try downloading this file and passing the filename as an argument:\n\thttp://projecteuler.net/project/triangle.txt"
		puts "Then type: ruby Euler-18.rb triangle.txt'"
		puts "Or, if you want to see an example, type:\n\truby Euler-18.rb example"
	elsif args[0] == "example"
		# Example mode outputs the example triangle.
		width = @example.last.size * 2 - 1
		@example.each do |line|
			puts line.join(" ").center(width)
		end

		puts "\nMax sum: #{solve(@example)}"
	else
		triangle = read(args[0])
		puts solve(triangle)
	end
end


main(ARGV)