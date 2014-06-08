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

fpga_write('00', '00010001')
fpga_write('01', '00010001')
fpga_write('02', '00010001')
fpga_write('03', '00010001')
fpga_write('04', '00010001')
fpga_write('05', '00010001')
fpga_write('06', '00010001')
fpga_write('07', '00010001')
fpga_perceptron('08')
fpga_write('08', '00000000')
