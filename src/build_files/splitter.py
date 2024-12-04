def split_file(input_file):
    lines_per_file = 64
    padding_line = "00000000"  # Line to fill in the extra space
    file_counter = 0
    
    with open(input_file, 'r') as infile:
        while True:
            lines = [infile.readline().rstrip() for _ in range(lines_per_file)]
            # Remove any empty strings from the end caused by reading past the file
            lines = [line for line in lines if line]
            
            if not lines:
                break
            
            # Pad the last file with "00000000" if it's not 64 lines
            while len(lines) < lines_per_file:
                lines.append(padding_line)

            output_file = f"../Verilog/Mem{file_counter}.mem"
            with open(output_file, 'w') as outfile:
                outfile.write('\n'.join(lines) + '\n')
            
            print(f"Mem{file_counter}.mem")
            file_counter += 1

# Usage
# Replace 'yourfile.txt' with the name of your input file.
split_file('output.txt')
