import argparse

parser = argparse.ArgumentParser(description='My tool')
parser.add_argument('file', help='Input file')
args = parser.parse_args()

file = args.file

print(file)
