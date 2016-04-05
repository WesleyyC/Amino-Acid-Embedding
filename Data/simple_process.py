r=open('all.protein.faa','r')
w=open('context.processed.all.protein.faa','w')

start = True
mem = ""
for line in r:
	if '>' in line and not start:
		list_char = list(mem.replace('\n',''))
		list_context = []
		list_context_length_before = 1
		list_context_length_after = 1
		for i in range(len(list_char)):
			tmp=""
			for j in range(i-list_context_length_before,i+list_context_length_after+1):
				if j < 0 or j>=len(list_char):
					tmp=tmp+'-'
				else:
					tmp=tmp+list_char[j]
			list_context.append(tmp)

		w.write (" ".join(list_context)+"\n")
		mem = ""
	else:
		if not start:
			mem=mem+line
		start = False

r.close()
w.close()