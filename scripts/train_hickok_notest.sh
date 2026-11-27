#!/bin/bash

[ $# -ge 2 ] || { echo Usage: $0 datadir treebank args... >&2; exit 1; }
data="$1"; shift
treebank="$1"; shift

mkdir -p models/$data-$treebank${EXP:+-$EXP}
size=$(grep -P "^$treebank\t" $data/langs_sizes | cut -f2)
if [ "$size" -ge 400000 ]; then
  args=--batch_size=64
else
  args=--batch_size=32
fi
if [ "$size" -ge 50000 ]; then
  args="$args --rnn_cell_dim=512"
else
  args="$args --rnn_cell_dim=384"
fi
case $treebank in
  cs*) args="$args --wembedding_model=robeczech-base-last4";;
  *) args="$args --wembedding_model=bert-base-multilingual-uncased-last4";;
esac

# Samotný skript udpipe2.py zvládne fungovat zcela bez dev i test dat, ale train.sh počítá s tím, že oboje existuje.
# My v této úpravě počítáme s tím, že dev existuje, kvůli ověření konvergence (byť je to třeba jen 1% všech dat),
# ale test neexistuje.
case $treebank in
  *_all)
    evaluation_data="--dev"
    for dev in $data/${treebank%_all}_*/*-dev.conllu; do
      evaluation_data="$evaluation_data $(basename $(dirname $dev)):$dev"
    done
    ;;
  *) evaluation_data="--dev=$data/$treebank/$treebank-ud-dev.conllu"
esac

echo sbatch $SLURM_ARGS -p gpu-ms,gpu-troja -G 1 -C "gpu_cc6.1" --mem=24G -o models/$data-$treebank${EXP:+-$EXP}/training.log ./run udpipe2.py models/$data-$treebank${EXP:+-$EXP} --train $data/$treebank/$treebank-*train.conllu $evaluation_data $args "$@"
sbatch $SLURM_ARGS -p gpu-ms,gpu-troja -G 1 -C "gpu_cc6.1" --mem=24G -o models/$data-$treebank${EXP:+-$EXP}/training.log ./run udpipe2.py models/$data-$treebank${EXP:+-$EXP} --train $data/$treebank/$treebank-*train.conllu $evaluation_data $args "$@"

