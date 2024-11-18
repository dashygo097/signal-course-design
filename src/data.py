import os
import scipy
import matplotlib.pyplot as plt


def read_mat_folder(folder_path):
    os.chdir(folder_path)

    files = []
    for file in os.listdir():
        if ".mat" in file:
            mat = scipy.io.loadmat(file)
            files.append(mat)
            print(f"Load {file}")
            print(mat)
    os.chdir("./")
    return files


def show_array(file, label: str):
    array = file[label]
    plt.plot(range(array.shape[0]), array)
    plt.show()
