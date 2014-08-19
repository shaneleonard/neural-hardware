# ******************************************************************************
# FILE:        generate_roms.py
# DESCRIPTION: This program parses a .csv file in the format described below
#              and generates verilog ROMs representing the neural weights.
# NOTES:
#
# Input file format is as follows:
#
# neuron0_w0, neuron0_w1, neuron0_w2, neuron0_w3, ... neuron0_wM
# neuron1_w0, neuron1_w1, neuron1_w2, neuron1_w3, ... neuron1_wM
# neuron2_w0, neuron2_w1, neuron2_w2, neuron2_w3, ... neuron2_wM
# neuron3_w0, neuron3_w1, neuron3_w2, neuron3_w3, ... neuron3_wM
# neuron4_w0, neuron4_w1, neuron4_w2, ... neuron4_wK
# neuron5_w0, neuron5_w1, neuron5_w2, ... neuron5_wK
# neuron6_w0, neuron6_w1, neuron6_w2, ... neuron6_wK
# neuron6_w0, neuron6_w1, ... neuron6_wK
#
# VERSION:     1.0.0
# AUTHOR:      Shane Leonard, July 31 2014
# ******************************************************************************

import fileinput
from os import path
from rom import rom
from fpga_math import discrete

M = 100
n = 8


def num_to_verilog(val):
    return "16'd{}".format(discrete(val, M, n))


def zero_pad(nums, l):
    return nums + [0] * (l - len(nums))


def read_csv(filereader):
    return [[float(elem.strip().replace(',', '')) for elem in row.split()]
            for row in filereader]


def convert_to_rom_values(filereader):
    rows = read_csv(fileinput.input())
    n_weights = max(len(row) for row in rows)
    zero_padded_rows = [zero_pad(row, n_weights) for row in rows]
    transposed_rows = [list(i) for i in zip(*zero_padded_rows)]
    return [[num_to_verilog(val) for val in row] for row in transposed_rows]


def reldir(relpath):
    return path.normpath(path.join(path.dirname(path.abspath(__file__)),
                                   relpath))


rom_rows = convert_to_rom_values(fileinput.input())
rom = rom()

out_dir = reldir("../output/")
for i in range(len(rom_rows)):
    rom_name = "neuron_rom{}".format(i)
    rom_file = "{}.v".format(rom_name)
    with open(path.join(out_dir, rom_file), "w") as f:
        rom.name = rom_name
        rom.addr_width = 16
        rom.dout_width = 16
        rom.dout_vals = rom_rows[i]
        f.write(str(rom))
