# Find the factorial of a number.

def find_factorial(n)

  return "Cannot compute." if !(n.is_a? Integer) || n < 0 

  if n == 0 || n == 1  
    return 1
  else
    return n * find_factorial(n - 1)
  end 
end


