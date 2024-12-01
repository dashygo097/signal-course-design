import os
import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm

from utils.txt2array import txt2array, img_draw

if __name__ == "__main__":

    proj_dir = os.getcwd()
    data_dir = "./data/processed_data/spec"
    os.chdir(data_dir)

    for i, file in tqdm(enumerate(os.listdir()), total=9):
        array = txt2array(file)

        norm = np.linalg.norm(array)
        if norm == 0:
            assert True, "norm factor is zero"

        array = array / norm

        img_draw(array, label=file[0])

    os.chdir(proj_dir)

    plt.legend()
    plt.savefig("./diagrams/fft_mag.jpg")
    plt.show()
