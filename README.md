# Amino Acid Embedding

Word2Vec is thriving in computation linguistic as it helps us getting spatial semantic from word and better similarity function between word and word.

Can we use the same training methodlogy else where?

In Bioinformatic, a very important task is protein sequence alighnment and such alighnment depends a whole lot on how we calculate the similarity of two amino acids are. So in the 90s, Henikoff and Henikoff developed a database of “blocks” based on sequences with shared motifs (>2,000 blocks of aligned sequence segments from >500 groups of related proteins). Based on this data, people developed a matrix called BLOSUM to represent the similairty between amino acid.

However, time flies and scientist are able to generate a lot of protein amino acid sequence with the new technology, but no one has touched the BLOSUM matrix yet. So we propose to use the same methodlogy in word2vec training to train a vector representation of each amino acid, which consequently can give us a similiarty score between them.

### t-SNE Result
![t-SNE Result]
(https://github.com/WesleyyC/Amino-Acid-Embedding/blob/master/Figure/a2v.jpg)

### Amino Acid Categorization

![amino acid class]
(https://github.com/WesleyyC/Amino-Acid-Embedding/blob/master/Relevent%20Literature/Amino_Acids.svg.png)
