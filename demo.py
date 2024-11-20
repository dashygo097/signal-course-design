from utils.matlab2py import read_mat_folder, get_array, write_array

files = read_mat_folder("./data/original_data")
array = get_array(files[0])
write_array(array, "123.txt", "./data/processed_data")
