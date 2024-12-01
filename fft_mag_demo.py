import numpy as np

from utils.matlab2py import read_mat_folder, get_array, write_array

if __name__ == "__main__":

    files = read_mat_folder("./data/original_data")
    files.sort()

    for index, file in enumerate(files):

        array = get_array(file)
        array = array[:, 0]

        spec = np.absolute(np.fft.fft(array))
        write_array(spec, file[0] + "_spec.txt", "./data/processed_data/spec")
