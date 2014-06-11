import serial

fpga = serial.Serial("/dev/ttyUSB1", 3000000, timeout=1)
one_shift = 8
wstep = 2**-one_shift
wmax = 2**(15-one_shift) - wstep
wmin = -(2**(15-one_shift))


def wt_to_hex(val):
    n = int(val/wstep)
    return "{0:0{1}x}".format(n & 0xffff, 4)


def hex_to_wt(hex_val):
    v = int(hex_val, 16)
    if v >= 2**15:
        v -= 2**16
    return v * wstep


def squash(val):
    if (val > wmax):
        return wmax
    elif (val < wmin):
        return wmin
    else:
        return val


def fpga_write(hex_reg, val1, val2):
    val1 = squash(val1)
    val2 = squash(val2)
    hex_val1 = wt_to_hex(val1)
    hex_val2 = wt_to_hex(val2)
    # print hex_val1, hex_val2
    val_to_write = (hex_val1 + hex_val2).decode('hex')
    register = hex_reg.decode('hex')
    print "W", hex_reg, val1, val2
    fpga.write('w' + register + val_to_write)


def fpga_read(hex_reg):
    register = hex_reg.decode('hex')
    fpga.write('r' + register)
    val = fpga.read(4)
    print "R", hex_reg, hex_to_wt(val.encode('hex')), val.encode('hex')


def fpga_perceptron(hex_output_reg):
    print "P"
    fpga.write('p')
    fpga_read(hex_output_reg)

print "Weight range: (" + str(wmin), str(wmax) + ")"

print ''
print 'Test 1'
fpga_write('00', 8*wstep, 1)
fpga_write('01', 7*wstep, 2)
fpga_write('02', 6*wstep, 3)
fpga_write('03', 5*wstep, 4)
fpga_write('04', 4*wstep, 5)
fpga_write('05', 3*wstep, 6)
fpga_write('06', 2*wstep, 7)
fpga_write('07', 1*wstep, 8)
fpga_perceptron('08')
fpga_write('08', 0, 0)

print ''
print 'Test 2: Squash to 1'
fpga_write('00', 1, 1)
fpga_write('01', 0, 0)
fpga_write('02', 0, 0)
fpga_write('03', 0, 0)
fpga_write('04', 0, 0)
fpga_write('05', 0, 0)
fpga_write('06', 0, 0)
fpga_write('07', 0, 0)
fpga_perceptron('08')
fpga_write('08', 0, 0)

print ''
print 'Test 3: Squash to -1'
fpga_write('00', 0, 0)
fpga_write('01', -1, 1)
fpga_write('02', 0, 0)
fpga_write('03', 0, 0)
fpga_write('04', 0, 0)
fpga_write('05', 0, 0)
fpga_write('06', 0, 0)
fpga_write('07', 0, 0)
fpga_perceptron('08')
fpga_write('08', 0, 0)
