r=open('all.protein.faa','r')
w=open('trunk.context.processed.all.protein.faa','w')

start = True
mem = ""
for line in r:
	if '>' in line and not start:
		list_char = list(mem.replace('\n',''))

		list_context = []
		i = 1
		while i < len(list_char)-1:
			tmp=""
			for j in range(i-1,i+2):
					tmp=tmp+list_char[j]
			list_context.append(tmp)
			i = i+3
		w.write (" ".join(list_context)+"\n")

		list_context = []
		i = 2
		while i < len(list_char)-1:
			tmp=""
			for j in range(i-1,i+2):
					tmp=tmp+list_char[j]
			list_context.append(tmp)
			i = i+3
		w.write (" ".join(list_context)+"\n")

		list_context = []
		i = 3
		while i < len(list_char)-1:
			tmp=""
			for j in range(i-1,i+2):
					tmp=tmp+list_char[j]
			list_context.append(tmp)
			i = i+3
		w.write (" ".join(list_context)+"\n")


		mem = ""
	else:
		if not start:
			mem=mem+line
		start = False

r.close()
w.close()