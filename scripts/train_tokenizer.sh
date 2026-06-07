#!/bin/bash
udpipe12 = /home/zeman/nastroje/udpipe/udpipe-1.2.0-bin/bin-linux64/udpipe

[ $# -ge 3 ] || { echo Usage: $0 datadir treebank modeldir >&2; exit 1; }
data="$1"; shift
treebank="$1"; shift
modeldir="$1"; shift

# UDPipe 1.2 cannot digest CoNLL-U files that have spaces in MISC, although it accepts spaces in
# FORM and LEMMA (https://ufal.mff.cuni.cz/udpipe/1/users-manual#model_training_tokenizer says
# that if any training token contains a space, the default option is allow_spaces=1).
mkdir -p $data/$treebank/fortok
for i in train dev test ; do
  cat $data/$treebank/$treebank-ud-$i.conllu | perl -pe 'if(m/^[0-9]/) { chomp; @f=split(/\t/); $f[9]=~s/\s/_/g; $_=join("\t", @f)."\n" }' > $data/$treebank/fortok/$treebank-ud-$i.conllu
done
$udpipe12 --train --tagger=none --parser=none $treebank.tokenizer --heldout=$data/$treebank/fortok/$treebank-ud-dev.conllu $data/$treebank/fortok/$treebank-ud-train.conllu
mv $treebank.tokenizer $modeldir

