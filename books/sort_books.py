# sort_books.py
# well it sorts my books alphabetically 
# by author and then by the books beloning to that author 

# syntax rules
# script expects the author name follow double hash
# and then that authors books then a newline and new author

##########
# example
# ## author lastname
# book 1
# book 2
#
# ## writer surname
# book 1

import sys
import re

def smart_title(text):
    """
    Title-casifier som inte kapitaliserar bokstäver direkt efter en apostrof.
    Ex: "logan's run" -> "Logan's Run"
    """
    def fix_word(word):
        if "'" in word:
            parts = word.split("'")
            return "'".join([parts[0].capitalize()] + [p.lower() for p in parts[1:]])
        return word.capitalize()

    return ' '.join(fix_word(word) for word in text.split())

def read_and_sort_books(input_file):
    authors = {}
    current_author = None

    # Läser in filen och grupperar böcker per författare
    with open(input_file, 'r', encoding='utf-8') as file:
        for line in file:
            line = line.strip()
            if line.startswith('##'):
                # Extrahera och normalisera författarnamnet
                current_author = line[3:].strip().title()
                if current_author not in authors:
                    authors[current_author] = []
            elif line:
                # Lägg till bok till aktuell författare
                authors[current_author].append(line)

    # Sortera författare i alfabetisk ordning
    sorted_authors = sorted(authors.keys())

    # Skriv ut till ny fil med sorterade resultat
    with open(input_file + '.sorted', 'w', encoding='utf-8') as output_file:
        for author in sorted_authors:
            output_file.write(f"## {author}\n")
            sorted_books = sorted(authors[author], key=lambda b: smart_title(b))
            for book in sorted_books:
                output_file.write(f"{smart_title(book)}\n")
            output_file.write("\n")  # Tom rad efter varje författarsektion

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python sort_books.py <path_to_input_file>")
    else:
        read_and_sort_books(sys.argv[1])
