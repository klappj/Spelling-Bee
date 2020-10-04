# This script takes letters from the NY Times Spelling Bee puzzle
# and a list of english words to find possible answers. 

#read statics
wordlist <- read.delim("corncob_lowercase.txt", header = FALSE)
wordlist <- unlist(wordlist)
#in order of frequency for an attempt at optimization
allletters <- c("e","t","a","o","i","n","s","h","r","d","l","u","c","m","f","y","w","g","p","b","v","k","x","q","j","z")

# get and set the target words
mustletter <- "t"
otherletters <- c("a","n","d","i","o","x")
outletters <- setdiff( allletters, c(mustletter, otherletters))

has_must <- wordlist[sapply(wordlist, function(ch) grepl (mustletter, ch))]

for (letter in outletters)
{
  has_must <- has_must[!sapply(has_must, function(ch) grepl (letter, ch))]
  print(letter)
}

print(as.vector(has_must))
