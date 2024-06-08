# sort_books
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

def read_and_sort_books(input_file):
    authors = {}
    current_author = None

    # Read and organize data
    with open(input_file, 'r', encoding='utf-8') as file:
        for line in file:
            line = line.strip()
            if line.startswith('##'):
                current_author = line[3:].title()
                if current_author not in authors:
                    authors[current_author] = []
            elif line:
                authors[current_author].append(line)

    # Sort authors and their books
    sorted_authors = sorted(authors.keys())
    with open(input_file + '.sorted', 'w', encoding='utf-8') as output_file:
        for author in sorted_authors:
            output_file.write(f"## {author}\n")
            sorted_books = sorted(authors[author])
            for book in sorted_books:
                book = book.title()
                output_file.write(f"{book}\n")
            # Add a blank line after each author's list
            output_file.write("\n")  

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python books_sort.py <path_to_input_file>")
    else:
        read_and_sort_books(sys.argv[1])