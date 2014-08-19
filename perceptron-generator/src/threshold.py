from fpga_math import continuous, discrete
from math import ceil, log, floor, exp


class ThresholdLUT:
    def __init__(self, ns, Mz, Mw, nz, nw, Ni, fmind, fmaxd):
        fprime0 = 1/4
        fmax = 1
        fmin = 0
        fR = 0
        self.fprime0 = fprime0
        self.fmax = fmax
        self.fmin = fmin
        self.fR = fR

        self.Mz = Mz
        self.Mw = Mw
        self.nz = nz
        self.nw = nw
        self.Ni = Ni
        self.fmind = fmind
        self.fmaxd = fmaxd

        self.nNi = ceil(log(Ni, 2))

        Ms = Ni * Mz * Mw
        self.Ms = Ms

        Ns = ceil(
            log(
                Ni * (2**(nz - 1) - 1) * (2**(nw - 1) - 1),
                2
            )
        ) + 1
        self.Ns = Ns

        self.ns = ns
        self.ms = Ns - ns
        self.nsopt = ceil(
            log(
                fprime0*Ni*Mw * (2**Ns) * (2**nz - 2) / (2**Ns - 2),
                2
            )
        )

        xctop = -fR * (2 ** Ns - 2) / (4 * fprime0 * Ms)
        xca = (2 ** nz - 2) / Mz
        xcmin = floor(fmin * xca)
        xcmax = floor(fmax * xca)
        xminlogbottom = (xcmin + (xcmin % 2) + 1) / xca - fmin
        xmaxlogbottom = (xcmax + (xcmax % 2) + 1) / xca - fmin
        xminlogtop = log(fR / xminlogbottom - 1)
        xmaxlogtop = log(fR / xmaxlogbottom - 1)
        xmintop = (xctop * xminlogtop + 1)
        xmaxtop = (xctop * xmaxlogtop + 1)
        xbottom = 2**(self.ms + 1)

        self.imin = ceil(xmintop / xbottom + 1/2)
        self.imax = ceil(xmaxtop / xbottom - 3/2)

    def tableValues(self):
        Sdi = [2**(self.ms - 1) / 2 + i * 2**self.ms
               for i in range(self.imin, self.imax + 1)]
        Sci = [continuous(sdi, self.Ms, self.Ns) for sdi in Sdi]
        fSci = [self.activate(sci) for sci in Sci]
        fSdi = [discrete(fsci, self.Ms, self.Ns) for fsci in fSci]
        return fSdi

    def activate(self, x):
        return self.fR / (1 + exp(-4*self.fprime0/self.fR * x)) + self.fmin
