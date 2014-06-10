import serial

fpga = serial.Serial("/dev/ttyUSB1", 3000000, timeout=1)


def fpga_write(hex_reg, hex_val):
    register = hex_reg.decode('hex')
    val = hex_val.decode('hex')
    print "W", hex_reg, hex_val
    fpga.write('w' + register + val)


def fpga_read(hex_reg):
    register = hex_reg.decode('hex')
    fpga.write('r' + register)
    val = fpga.read(4)
    print "R", hex_reg, val.encode('hex')


def fpga_perceptron(hex_output_reg):
    print "P"
    fpga.write('p')
    fpga_read(hex_output_reg)

print 'Test 1'
fpga_write('00', '00080001')
fpga_write('01', '00070002')
fpga_write('02', '00060003')
fpga_write('03', '00050004')
fpga_write('04', '00040005')
fpga_write('05', '00030006')
fpga_write('06', '00020007')
fpga_write('07', '00010008')
fpga_perceptron('08')
fpga_write('08', '00000000')

print ''
print 'Test 2: Squash to 1'
fpga_write('00', '40010002')
fpga_write('01', '00000000')
fpga_write('02', '00000000')
fpga_write('03', '00000000')
fpga_write('04', '00000000')
fpga_write('05', '00000000')
fpga_write('06', '00000000')
fpga_write('07', '00000000')
fpga_perceptron('08')
fpga_write('08', '00000000')

print ''
print 'Test 3: Squash to -1'
fpga_write('00', '80000001')
fpga_write('01', '00000000')
fpga_write('02', '00000000')
fpga_write('03', '00000000')
fpga_write('04', '00000000')
fpga_write('05', '00000000')
fpga_write('06', '00000000')
fpga_write('07', '00000000')
fpga_perceptron('08')
fpga_write('08', '00000000')
