all: length larger sumarray

length: length.s
    gcc -o length length.s

larger: larger.s
    gcc -o larger larger.s
    
sumarray: sumarray.s
    gcc -o sumarray sumarray.s
