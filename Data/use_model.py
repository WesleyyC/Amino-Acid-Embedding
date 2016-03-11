
import numpy as np
import scipy.io as sio
import gensim, logging
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)

wfname = 'sg_window8.bin'
model = gensim.models.Word2Vec.load(wfname)

AAs=['C','S','T','P','A','G','N','D','E','Q','H','R','K','M','I','L','V','F','Y','W'];

f_result = []
v_result = []

for AA1 in AAs:
	r_result = []
	for AA2 in AAs:
		r_result.append(model.similarity(AA1,AA2))
	f_result.append(r_result)
	v_result.append(model[AA1])

sio.savemat('a2v.mat', {'similarity': f_result,'vector': v_result})