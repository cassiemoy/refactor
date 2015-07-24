# Reverse string.

# The obvious way.

def rubyist_reverse_string(string)
  string.reverse
end

# Iteratively reverse a string.

def iterative_reverse_string(string)
  reversed_string = ''
  string.each_char {|c| reversed_string.prepend(c)}
  reversed_string
end

# Recursively reverse a string.

def recursive_reverse_string(string)
  len = string.length

  if len == 1
    return string
  else
    return string[len - 1] + recursive_reverse_string(string[0..(len - 2)])
  end
end