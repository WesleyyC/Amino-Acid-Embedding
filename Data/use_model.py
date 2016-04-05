
import numpy as np
import scipy.io as sio
import gensim, logging
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

wfname = 'context_sg_window10_size3000.bin'
model = gensim.models.Word2Vec.load(wfname)

context_dict = model.vocab.keys();

candidate=set()
AAs=['C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'];
for AA in AAs:
	candidate.add(AA)

def check_candidate(context):
	for AA in context:
		if AA not in candidate:
			return False
	return True

context_list = []
for context in context_dict:
	if check_candidate(context):
		context_list.append(context)

s_result = []
v_result = []
for context_1 in context_list:
	r_result = []
	for context_2 in context_list:
		r_result.append(model.similarity(context_1,context_2))
	s_result.append(r_result)
	v_result.append(model[context_1])

sio.savemat('a2v.mat', {'similarity': s_result,'vector': v_result,'dict':context_list})
