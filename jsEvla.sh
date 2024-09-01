#!/bin/bash 

# Function to highlight text using ANSI colors
highlight() {
    local text=$1
    echo -e "\033[1;34m$text\033[0m"
}

# Function to log messages
log() {
    local message=$1
    echo -e "\033[1;35m$message\033[0m"
}

# Function to analyze JavaScript file
analyze_js() {
    local js_url=$1
    log "$js_url"
    local js_content
    js_content=$(curl -s "$js_url")

    if [ -z "$js_content" ]; then
        log "No content fetched from $js_url"
        return
    fi

    log "Analyzing $js_url"

    # Create a temporary file to store the JS content
    temp_file=$(mktemp)
    echo "$js_content" > "$temp_file"

    log "Checking for postMessage and eval usage in $js_url"
    grep -n -E 'postMessage|eval' "$temp_file" | while read -r line; do
        line_number=$(echo "$line" | cut -d: -f1)
        match=$(echo "$line" | cut -d: -f2-)
        if [[ $match =~ postMessage ]]; then
            highlight "Issue: postMessage found at line $line_number"
            highlight "Line: $match"
        elif [[ $match =~ eval ]]; then
            highlight "Issue: eval found at line $line_number"
            highlight "Line: $match"
        fi
    done

    # Clean up temporary file
    rm "$temp_file"
}

# Main script
url=$1

if [ -z "$url" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

log "Fetching HTML content from $url"
html_content=$(curl -s "$url")

log "Extracting JavaScript URLs from HTML content"
js_urls=$(echo "$html_content" | grep -o 'src="[^"]\+\.js"' | sed 's/src="\([^"]\+\)"/\1/')

log "Found JavaScript URLs: $js_urls"
for js_url in $js_urls; do
    full_js_url=$js_url
    # Ensure full URL if relative
    if [[ ! $js_url =~ ^http ]]; then
        base_url=$(echo "$url" | sed 's#\(.*/\).*#\1#')
        full_js_url="${base_url}${js_url}"
    fi
    analyze_js "$full_js_url"
done

