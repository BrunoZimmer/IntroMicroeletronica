* Crossbar one bit

simulator lang=spice

.include 'TRIST.spi'
.include '45nm_LP.pm'


*Vdd
.param Vvdd = 1

*Ground
.param Vgnd = 0


*pulse time
.param TpPulse = 1.8n
.param TpDelay = 2n

* Vdd
Vdd Vdd Gnd 'Vvdd' 

Vbl1 BL1T Gnd PWL 0 'Vgnd' 'TpDelay-1p' 'Vgnd' 'TpDelay' 1 'TpDelay+TpPulse-1p' 1 'TpDelay+TpPulse' 'Vgnd'

Vbl1en ENBl1 Gnd PWL 0 1

X1 BL1T BL1 ENBl1 Vdd Gnd TI

.TRAN 1p 10n

.option rawfmt="psfbin"
