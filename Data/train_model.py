
##### SAMPLE #####
# M L H V E M L T P L F L A L W M C V F S Q D P G S K A V A D R Y A V Y W N S S N P R F Q R G D Y H I D V C I N D Y L D V F C P H Y E D S V P E D K T E R Y V L Y M V N F D G Y S A C D H T S K G F K R W E C N R P H S P N G P L K F S E K F Q L F T P F S L G F E F R P G R E Y F Y I S S A I P D N G R R S C L K L K V F V R P T N S C M K T I G V H D R V F D V N D K V E N S L E P A D D T V H E S A E P S R G E N A A Q T P R I P S R L L A I L L F L L A M L L T L
# M K K S R S V M T V T A D D N V K D Y F E C S L S K S Y S S S S N T L G I D L W R G R R C C S G N L Q L P P L S Q R Q S G R S R T P E G D G I S R P T T L P L M T L P S I A I T T V T Q E C I C S I Q A K P T V V I F M E T I Q W F P S N Q V S C G F L G Y K Q R H N S C G Q L Q K L R R K L S F
# M D L P Y Y H G P L S K R D C E T L L L K E G V D G N Y L L R D S E S M P G V L C L C V S F K N F V Y T Y R I F K E K H G Y F H I Q T A E G I R R Q I F P N L K E L I S K F E E P H Q G L M F H L V K P I K R T G S C L R W R R S K I E L D G I Y E N S G S D Y V D V L P



##### IMPORT AND LOGGING #####
import gensim, logging
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

###### SETUP IO #####
wfname = 'sg_window10_size16.bin'
rfname = 'processed.all.protein.faa'




##### SETUP SENTENCE #####
# use a iterater to yield each line to save some memory

class Sentences_Iter(object):
	def __init__(self, fname):
		self.fname = fname

	def __iter__(self):
		r=open(self.fname,'r')
		for line in r:
			yield line.split()
		r.close()
sentences = Sentences_Iter(rfname)



##### STITISTIC #####

# length = 0
# count = 0
# for line in sentences:
# 	length+=len(line)
# 	count+=1
# print length/count

# import sys
# small = sys.maxint
# for line in sentences:
# 	small = min(small, len(line))
# print small

# from sets import Set
# s={}
# total = 0
# for line in sentences:
# 	for w in line:
# 		if w in s:
# 			s[w]=s[w]+1
# 		else:
# 			s[w]=1
# 		total +=1

# for key in s:
# 	s[key]=float(s[key])/total

# print s




##### TRAIN #####

# train word2vec on the two sentences
# size: layer of neural net/ dimension, we set it to 20 because we only have 20 voca
# window: size of motif, protein_strucutre aggreaget around 10-30, so we set to 20
# sg: default (sg=0), CBOW is used. Otherwise (sg=1), skip-gram is employed. We use sg becuase it has a more refine
# woker: parallel CPU
# data length: mean 645 min 21
model = gensim.models.Word2Vec(sentences, size=16, window=10, workers=8, sg=1)

model.save(wfname)


##### TESTING #####

# sentences = [['first', 'sentence'], ['second', 'sentence']]
# model = gensim.models.Word2Vec(sentences, min_count =1, size=20, window=20, sg=1)
# print model['first']


