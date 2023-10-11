# This will use /dev/random to overwrite any file with params
#!/bin/bash

# Check if both arguments are given
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <filename/wildcard> <number of passes (10-500)>"
    exit 1
fi

# Check if the number of passes is between 10 and 500
if [ "$2" -lt 10 ] || [ "$2" -gt 500 ]; then
    echo "The number of passes should be between 10 and 500."
    exit 1
fi

# List the files that will be deleted and ask for confirmation
echo "The following files will be securely deleted:"
ls $1
read -p "Are you sure you want to continue? [y/N]: " confirmation

if [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled."
    exit 0
fi

# Securely delete each file
for file in $1; do
    echo "Deleting $file..."
    for pass in $(seq 1 $2); do
        dd if=/dev/urandom of="$file" bs=1M count=$(du -m "$file" | cut -f1) conv=notrunc status=none
    done
    rm "$file"
done

echo "Operation completed."


-------- IF THIS GIVES AN ISSUE DUE TO LACK OF ROOT ACCESSS USE THIS ---

#!/bin/bash

# Check if both arguments are given
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <filename/wildcard> <number of passes (10-500)>"
    exit 1
fi

# Check if the number of passes is between 10 and 500
if [ "$2" -lt 10 ] || [ "$2" -gt 500 ]; then
    echo "The number of passes should be between 10 and 500."
    exit 1
fi

# List the files that will be deleted and ask for confirmation
echo "The following files will be securely deleted:"
ls $1
read -p "Are you sure you want to continue? [y/N]: " confirmation

if [ "$confirmation" != "y" ] && [ "$confirmation" != "Y" ]; then
    echo "Operation cancelled."
    exit 0
fi

# Securely delete each file using Python
for file in $1; do
    echo "Deleting $file..."
    for pass in $(seq 1 $2); do
        python -c "import os; size=os.path.getsize('$file'); f=open('$file', 'wb'); f.write(os.urandom(size)); f.close()"
    done
    rm "$file"
done

echo "Operation completed."


-- OUTPUT:
../delme.sh ./his.txt  60
The following files will be securely deleted:
./his.txt
Are you sure you want to continue? [y/N]: Y
Deleting ./his.txt...
Operation completed.

(U can enter up to 500 passes to wipe)


