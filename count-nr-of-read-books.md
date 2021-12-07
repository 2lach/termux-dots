get lines in file
wc -l books2021.txt

sort input, count number of authors
sort -nr books2021.txt

count number of blank lines
grep -cvP '\S' books2021.txt

this will give you the number of books read

Oct 5 2021
112 - 19 - 17 = 76 books

Oct 21 2021
❯ 133 - 24 - 22 = 87 books

Wed Nov 3 20:40:09 CET 2021
139 - 23 - 22 = 94

count lines in file exclude newline & comments
cat z-stuff/books2021.txt | sed '/^\s*#/d;/^\s*$/d' | wc -l
