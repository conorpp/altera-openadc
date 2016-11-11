
project=openadc
outputdir=output_files
verilog=$(wildcard *.v) $(wildcard system/*.v)
elf=software/main.elf

all: $(outputdir)/$(project).sof
	nios2-configure-sof $(outputdir)/$(project).sof -d 2


$(outputdir)/$(project).map.rpt:  $(verilog) $(project).qsf
		quartus_map $(project)

$(outputdir)/$(project).fit.rpt: $(outputdir)/$(project).map.rpt
		quartus_fit $(project)

$(outputdir)/$(project).sof: $(outputdir)/$(project).fit.rpt
		quartus_asm $(project)

clean:
	rm -f $(outputdir)/*

reset:
	sudo killall -9 jtagd
	sudo /home/$(shell whoami)/altera/16.0/quartus/bin/jtagd
