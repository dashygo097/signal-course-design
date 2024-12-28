import os
from typing import Dict, List

import numpy as np
import scipy
from tqdm.auto import tqdm


def read_mat_folder(folder_path: str) -> List:
    "read all .mat files in folder"

    demo_path = os.getcwd()
    os.chdir(folder_path)

    files = []
    for file in tqdm(os.listdir(), desc="Loading", position=0, leave=True):
        if ".mat" in file:
            mat = scipy.io.loadmat(file)
            files.append((file, mat))
    os.chdir(demo_path)
    print("Done!")
    return files


def write_array(array: np.ndarray, name: str, folder_path: str) -> None:
    "write an array into {name} in folder"
    demo_path = os.getcwd()
    os.chdir(folder_path)
    print(f"Write data into {folder_path} as {name}...")
    with open(name, "w") as f:
        for element in tqdm(array, desc="Writing"):
            f.write(str(element))
            f.write("\n")

    os.chdir(demo_path)
    print("Done!")


def get_array(file: Dict) -> np.ndarray:
    "turn loaded .mat file's 1D data array into an numpy array"
    if isinstance(file, tuple):
        key = list(file[-1].keys())[-1]
        print(f"Loaded file: {file[0]}")
        array = file[-1][key]
    else:
        key = list(file.keys())[-1]
        print(f"Loaded file: {file[0]}")
        array = file[key]

    print(f"Array length: {array.shape[0]}")
    return array
