#!/bin/sh
export MAGIC=/ef/apps/ocd/magic/8.3.179-202106141345/bin/magic
#export MAGIC=/ef/apps/ocd/magic/8.3.165-202105171922/bin/magic

export MAGTYPE=mag; 

$MAGIC -dnull -noconsole -rcfile $PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc  <<EOF
addpath ${PDKPATH}/libs.ref/sky130_ml_xx_hd/mag
addpath ../mag/hexdigits
addpath ../mag/

drc off
gds rescale false
load $1 -dereference
select top cell
expand
cif *hier write disable
gds write ${1%.mag}.gds
quit -noprompt
EOF

#\mv ${1%.mag}.gds ../gds/

