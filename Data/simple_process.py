r=open('all.protein.faa','r')
w=open('processed.all.protein.faa','w')

start = True
mem = ""
for line in r:
	if '>' in line and not start:
		w.write (" ".join(mem.replace("\n", ""))+"\n")
		mem = ""
	else:
		if not start:
			mem=mem+line
		start = False

r.close()
w.close()