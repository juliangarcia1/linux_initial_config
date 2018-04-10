import sys
from os import Popen
bash_append_path ='bashrc_append.txt'
installations_path = 'installations.sh'
# vimrc_path = 'vimrc'

def main(argv):
	# Add aliases to bashrc file
	bash_append_fr = open(bash_append_path, 'r').read()
	bashrc_frw = open('~/.basrhc', 'rw+')
	bashrc_frw_data = bashrc_frw.readlines() + bashrc_append

	bashrc_frw.write(bashrc_frw_data)

	Popen(['source','~/.bashrc'])

	# Installations

	Popen(['sudo ./',installations_path])



if __name__ == '__main__':
	main(sys.argv[:2])


	