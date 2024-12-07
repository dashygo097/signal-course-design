import numpy as np
import matplotlib.pyplot as plt


def txt2array(file: str) -> np.ndarray:
    with open(file, "r") as f:
        lines = f.readlines()

    waveform = []

    for line in lines:
        line = line.split("\n")[0]
        waveform.append(float(line))

    return np.array(waveform)


def img_draw(array, label=None) -> None:
    length = array.shape[0]
    if label == None:
        plt.plot(range(length), array)
    else:
        plt.plot(range(length), array, label=label)
