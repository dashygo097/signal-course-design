from data import read_mat_folder, get_array, write_data

files = read_mat_folder("../data/original_data")

array = get_array(files[0])
write_data(array, "123.txt", "../data/processed_data")
