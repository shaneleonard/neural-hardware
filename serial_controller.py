import serial
import math

fpga = serial.Serial("/dev/ttyUSB1", 3000000, timeout=1)
one_shift = 8
wstep = 2**-one_shift
wmax = 2**(15-one_shift) - wstep
wmin = -(2**(15-one_shift))
perceptron_out_reg = 8


def wt_to_hex(val):
    n = int(round(val/wstep))
    return "{0:0{1}x}".format(n & 0xffff, 4)


def reg_to_hex(reg):
    return "{0:0{1}x}".format(reg & 0xff, 2)


def hex_to_wt(hex_val, normalized=False):
    v = int(hex_val, 16)
    if v >= 2**15:
        v -= 2**16
    return v * 2**-14 if normalized else v * wstep


def squash(val):
    if (val > wmax):
        return wmax
    elif (val < wmin):
        return wmin
    else:
        return val


def fpga_write(reg, val1, val2):
    val1 = squash(val1)
    val2 = squash(val2)
    hex_val1 = wt_to_hex(val1)
    hex_val2 = wt_to_hex(val2)
    hex_reg = reg_to_hex(reg)
    val_to_write = (hex_val1 + hex_val2).decode('hex')
    reg_bin = hex_reg.decode('hex')
    print "W", hex_reg, val1, val2
    fpga.write('w' + reg_bin + val_to_write)


def fpga_read(reg, normalized=False):
    hex_reg = reg_to_hex(reg)
    reg_bin = hex_reg.decode('hex')
    fpga.write('r' + reg_bin)
    val = fpga.read(4)
    print "R", hex_reg, hex_to_wt(val.encode('hex'), normalized), val.encode('hex')


def fpga_perceptron(expected_y):
    print "P", str(expected_y)
    fpga.write('p')
    fpga_read(perceptron_out_reg, True)


def compare_approx(val):
    hex_val = wt_to_hex(val)
    approx = hex_to_wt(hex_val)
    print "% 6g   % 6g   % 6g" % (val, approx, val - approx)


def perceptron_binary_test(filename, ninputs):
    # Expects a test file with binary inputs and outputs (binary meaning
    # that x and y can only take on values 0 and 1).
    # Data file format:
    # First line is space-separated weights
    # Remaining lines are as follows:
    # x values separated by spaces: expected y value
    # 0 1 1 1 0 1: 0
    with open(filename) as f:
        weights = [float(wt) for wt in f.readline().split()]
        for line in f.readlines():
            vals = [int(val) for val in line.replace(":", "").split()]
            xs = [1] + vals[:ninputs]
            y = vals[-1]
            for i, x in enumerate(xs):
                fpga_write(i, weights[i], x)
            fpga_perceptron(y)
            print ''


print "Weight range: (" + str(wmin), str(wmax) + ")"
print "Step size:", wstep
perceptron_binary_test("./test-data/simple-logistic-test.txt", 2)
compare_approx(-0.00235686893080232)
compare_approx(-0.0011685590390118)