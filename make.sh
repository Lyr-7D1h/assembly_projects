file="$1"
extension=${file##*.}

if [ "$extension" == "asm" ]; then
	nasm -g -f elf -F stabs $file
	filename="${file%.*}"
	ld -m elf_i386 -s -o $filename $filename.o
	rm $filename.o
	./$filename
else
	echo "Invalid file should be .asm file" 
fi
