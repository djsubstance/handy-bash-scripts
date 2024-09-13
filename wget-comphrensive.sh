Filename: wget-comphrensive.sh
Date Posted: Aug 9th, 2024
Last Update: Sept 9th, 2024
Purpose: This bash function is the most comphrensive and extensive way to spider a site using wget that was possible to construct
Note: If you have any suggestions, or if it isnt compliant with your flavor of Linux - LMK and we'll get it updated
Uage:  spider_site <hostname>


spider_site() {
    # Check for wget installation on macOS and Linux
    if ! command -v wget &> /dev/null
    then
        echo "wget could not be found. Please install wget."
        exit 1
    fi

    # Verify a URL was passed
    if [ -z "$1" ]; then
        echo "Usage: spider_site <domain>"
        return 1
    fi

    # Set up common wget options for spidering
    wget --xattr \
         --recursive \                             # Recursively download the site
         --level=inf \                             # Unlimited recursion depth
         --timestamping \                          # Download only newer files
         --domains="$1" \                          # Stay within the domain
         --no-parent \                             # Don't ascend to parent directory
         --no-clobber \                            # Avoid overwriting files
         --convert-links \                         # Convert links for local browsing
         --adjust-extension \                      # Adjust file extensions based on MIME type
         --page-requisites \                       # Download all assets (images, CSS, etc.)
         --directory-prefix=/tmp \                 # Store downloads in /tmp
         --no-remove-listing \                     # Keep .listing file for reference
         --cut-dirs=0 \                            # Strip no directories
         --reject "index.html*" \                  # Reject index.html files to avoid duplicates
         --reject ".DS_Store,Thumbs.db,thumbcache.db,desktop.ini,_macosx" \  # Exclude unnecessary files
         --random-wait \                           # Wait a random amount of time between requests
         --wait=2 \                                # Set a base wait time of 2 seconds between downloads
         --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:92.0) Gecko/20100101 Firefox/92.0" \  # Believable User-Agent
         --server-response \                       # Print server responses (helpful for debugging)
         --mirror \                                # Enable mirroring
         --no-host-directories \                   # Store everything in a single directory
         --robots=off \                            # Ignore robots.txt
         --accept "html,htm,css,js,json,png,jpg,jpeg,gif,svg,woff,woff2" \  # Accept key file types
         --ignore-length \                         # Ignore incorrect length headers
         --tries=3 \                               # Retry 3 times if the download fails
         --timeout=30 \                            # Set a 30-second timeout for each download
         "https://$1"
}

# Usage: spider_site <domain.com>




update:
www () {
    target_dir="./$1"
    if [ ! -d "$target_dir" ]; then
        mkdir -p "$target_dir"
        echo "Directory $target_dir created."
    else
        echo "Directory $target_dir already exists."
    fi
    
    echo "Press Enter to continue..."
    read -r
    wget --xattr "https://$1" \
         --directory-prefix="$target_dir" \
         -e robots=off \
         --random-wait \
         --wait=2 \
         --user-agent="Mozilla/5.0" \
         --recursive \
         --cut-dirs=0 \
         --no-parent \
         --timestamping \
         --mirror \
         --no-remove-listing \
         --adjust-extension \
         --domains="$1" \
         --page-requisites \
         --convert-links \
         --reject ".DS_Store,Thumbs.db,thumbcache.db,desktop.ini,_macosx" \
         --server-response \
         --no-host-directories \
         --continue

    echo "All files from $1 have been saved to $target_dir"
}

