#!/bin/sh

ack='https://ufal.mff.cuni.cz/udpipe/2/models#czech_hickok_model'

cat <<EOF
czech-hickok-e13-261120:cs_hickok-e13-261120          models-hickok/czech-hickok-261120.model cs_e13tdt   $ack
czech-hickok-e16-261120:cs_hickok-e16-261120          models-hickok/czech-hickok-261120.model cs_e16tdt   $ack
czech-hickok-e19-261120:cs_hickok-e19-261120          models-hickok/czech-hickok-261120.model cs_e19tdt   $ack
czech-hickok-fictree-261120:cs_hickok-fictree-261120  models-hickok/czech-hickok-261120.model cs_fictree  $ack
EOF
