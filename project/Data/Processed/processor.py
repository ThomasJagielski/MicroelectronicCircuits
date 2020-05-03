# import unidecode

# def remove_non_ascii(text):
#     return unidecode(unicode(text, encoding = "utf-8"))

if __name__ == "__main__":
    f = open("Circuit_Uncompensated_Bode.txt", "r")
    g = open("Circuit_Uncompensated_Bode_p.txt", "w")
    for line in f:
        # line = remove_non_ascii(line)
        for char in line:
            if ord(char) >= 128:
                continue
            if char == ')' or char == 'd' or char == 'B' or char == ' ':
                char = ''
            if char == '(':
                char = ','
            g.write(char)



f.close()
g.close()
    




