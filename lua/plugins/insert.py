if true then return {} end
# Insert "if true then return {} end" at the beginning of all the files in the current directory
import os


def insert_code_in_files(directory):
    # Define the code to insert
    code_to_insert = "if true then return {} end\n"

    # Iterate through all files in the directory
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)

        # Check if it's a file (not a directory)
        if os.path.isfile(file_path):
            with open(file_path, "r+", encoding="utf-8") as file:
                content = file.read()
                # Insert the code at the beginning
                file.seek(0)
                file.write(code_to_insert + content)
                print(f"Inserted code into {filename}")


# Specify the directory you want to process
directory = "/home/cbr/.config/astronvim_v5/lua/plugins"  # Current directory
insert_code_in_files(directory)
