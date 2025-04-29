from pyfiglet import Figlet
import sys
def printText(t):
    f = Figlet(font='slant')
    print(f.renderText(t))

if __name__ == "__main__":
    if len(sys.argv) > 1:
        printText(sys.argv[1])  
    else:
        print("No se proporcionó texto")