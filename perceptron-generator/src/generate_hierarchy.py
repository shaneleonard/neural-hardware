from module_instantiation import module_instantiation
from module_declaration import module_declaration


def port(name, width=1, io_dir='in', value=None):
    if not value:
        value = name
    return {'name': name, 'width': width, 'value': value, 'dir': io_dir}


def in_ports(ports):
    return [p for p in ports if p['dir'] == 'in']


def out_ports(ports):
    return [p for p in ports if p['dir'] == 'out']


def rom_ports(dout_width=16, addr_width=16):
    return [port('clk'),
            port('dout', dout_width, 'out'),
            port('addr', addr_width)]


mi = module_instantiation()
md = module_declaration()
rp = rom_ports()

mi.ports = rp
mi.params = [{'name': 'N', 'value': 8},
             {'name': 'M', 'value': 16}]

md.name = "neuron_rom_top"
md.ports = rp

with open("neuron_rom_top.v", "w") as f:
    f.write(str(md))
    for i in range(5):
        mi.module_name = "neuron_rom{}".format(i)
        mi.instance_name = "nr{}".format(i)
        f.write("\n")
        f.write(str(mi))
        f.write("\n")
    f.write("endmodule")
