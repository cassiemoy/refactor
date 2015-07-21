# From Coderbyte (http://coderbyte.com/)

# Using the Ruby language, have the function LongestWord(sen) take the
# sen parameter being passed and return the largest word in the string. 
# If there are two or more words that are the same length, return the 
# first word from the string with that length. Ignore punctuation and 
# assume sen will not be empty.

def LongestWord(sen)
  words = sen.gsub(/[\W\d]/, ' ').split
  greatest_length = 0
  largest_word = nil

  words.each do |word| 
    if word.length > greatest_length
      greatest_length = word.length
      largest_word = word
    end
  end

  return largest_word
end