## Czech HIČKOK Model #czech_hickok_model

HIČKOK models cover historical stages of Czech from 13th to 21st centuries. They are distributed
under the [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/) license. The models are
based on manually annotated data from the [HIČKOK](https://korpus.cz/hickok) project, combined with
the [FicTree](https://universaldependencies.org/treebanks/cs_fictree/index.html) treebank from
[Universal Dependencies 2.19](https://hdl.handle.net/11234/1-6316). In addition, the models use
[RobeCzech](https://huggingface.co/ufal/robeczech-base).

The models require [UDPipe 2](https://ufal.mff.cuni.cz/udpipe/2).

## Training Data

| Dataset                                                       | Sentences | Words   | Description                                    |
|:--------------------------------------------------------------|----------:|--------:|:-----------------------------------------------|
| [HIČKOK e13](https://korpus.cz/hickok)                        | 5,712     | 105,444 | Old Czech (13th to 15th century)               |
| [HIČKOK e16](https://korpus.cz/hickok)                        | 4,967     | 103,829 | Middle Czech (16th to 18th century)            |
| [HIČKOK e19](https://korpus.cz/hickok)                        | 5,546     | 110,929 | 19th century                                   |
| [UD 2.19 Czech FicTree](https://hdl.handle.net/11234/1-6316)  | 10,160    | 133,637 | Czech fiction published between 1991 and 2007  |

All training datasets have manual annotation of morphology (lemma, UPOS, morphological features).
FicTree has also manual annotation of syntactic dependency relations. In the three HIČKOK datasets,
only a small sample has manual syntactic annotation. In the rest, syntax was predicted by a model
trained on the manually annotated data.

<!--
Number of sentences with manually annotated syntax:
| Dataset | Train | Dev | Test |
| e13 | 109 | 6 | 0 |
| e16 |  71 | 4 | 7 |
| e19 |  85 | 0 | 0 |
-->

### Download

The latest version 261120 of the HIČKOK models can be downloaded from the [LINDAT/CLARIAH-CZ
repository](https://hdl.handle.net/11234/1-6325).

The models are also available in the [REST service](https://lindat.mff.cuni.cz/services/udpipe/).

### Acknowledgements #czech_hickok_model_acknowledgements

This work was supported by the grant no. TQ01000072 of the Technology Agency of the Czech Republic
(TAČR), Programme Sigma, and has been using language resources stored and distributed by the
LINDAT/CLARIAH-CZ project of the Ministry of Education, Youth and Sports of the Czech Republic
(project LM2023062).

The models were trained on HIČKOK etalons and on [UD_Czech-FicTree
v2.19](https://universaldependencies.org/treebanks/cs_fictree/index.html).

Finally, [RobeCzech](https://huggingface.co/ufal/robeczech-base) is used to provide contextualized
word embeddings.

### Model Performance

| Model                       | Mode              | Words  | Sents  | Lemma  | UPOS   | UFeats |
|:----------------------------|:------------------|-------:|-------:|-------:|-------:|-------:|
| czech-hickok-e13-261120     | Raw text          | 99.66  | 92.12  | 95.88  | 97.76  | 93.71  |
| czech-hickok-e13-261120     | Gold tokenization | —      | —      | 96.13  | 97.99  | 93.93  |
| czech-hickok-e16-261120     | Raw text          | 99.92  | 92.23  | 96.60  | 98.78  | 95.28  |
| czech-hickok-e16-261120     | Gold tokenization | —      | —      | 96.67  | 98.85  | 95.33  |
| czech-hickok-e19-261120     | Raw text          | 99.78  | 92.62  | 97.73  | 98.64  | 96.52  |
| czech-hickok-e19-261120     | Gold tokenization | —      | —      | 97.96  | 98.85  | 96.67  |
| czech-hickok-fictree-261120 | Raw text          | 100.0  | 98.49  | 99.25  | 99.23  | 97.67  |
| czech-hickok-fictree-261120 | Gold tokenization | —      | —      | 99.25  | 99.24  | 97.67  |
