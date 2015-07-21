# From Coderbyte (http://coderbyte.com/)

# Using the Ruby language, have the function VowelCount(str) take the 
# str string parameter being passed and return the number of vowels 
# the string contains (ie. "All cows eat grass" would return 5). Do 
# not count y as a vowel for this challenge. 

def VowelCount(str)
  count = 0
  str.each_char {|i| count += 1 if i.match(/[aeiou]/)}
  
  return count
end

VowelCount("hello")