# Download a bunch of files in specific format under a certain url

import subprocess

def webGet(downloadFormat, url):
    subprocess.call(["wget", "-r", "-l", "1","-nd","-nH","-A", downloadFormat, url])

if __name__ == "__main__":
    import sys
    downloadFormat = sys.argv[1]
    url = sys.argv[2]
    try:
        webGet(downloadFormat, url)
        print "Done!"
    except:
        print "Something wrong!"
