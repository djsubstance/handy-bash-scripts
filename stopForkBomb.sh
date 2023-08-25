#!/bin/bash
echo "Updating the ulimit settings for user $USER";
echo "Press Enter or any key to continue... otherwise hit CTRL C to abort"
read -n 1 -s -r -p ""

# Set ulimit for the current user session
ulimit -u 100   # Limit max user processes to 100
ulimit -n 100   # Limit open files to 100
ulimit -l 32    # Limit max locked memory to 32 KB (adjust as needed)
ulimit -t 10    # Limit CPU time to 10 seconds (adjust as needed)
echo "-----------------------------------------------------------------"
echo "[ Modified ulimit: -u 100 / -n 100 / -l 32 / -t 10 : user: $USER ]"
echo
exit



--- This will also require global changes to be persistant.
