# smscrape.sh - Bash script to analyze a sitemap.xml (wget it from the target) and it makes it readable and sorted
# This is very very fast and resorts and prioritizes the most commonly modded files and most important at the top
# Usage: 
# First wget a sitemap.xml ( wget www.jiffylube.com/sitemap.xml )
# Make sure the script can read the sitemap.xml file 
# 

#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "Please provide the sitemap.xml file as an argument."
  exit 1
fi

sitemap_file=$1

# Check if the provided file exists
if [[ ! -f $sitemap_file ]]; then
  echo "File $sitemap_file does not exist."
  exit 1
fi

# Define colors
light_cyan='\033[1;36m'
cyan='\033[0;36m'
purple='\033[0;35m'
white='\033[1;37m'
gray='\033[0;37m'
blue='\033[0;34m'
pink='\033[0;35m'
hot_pink='\033[1;35m'
nc='\033[0m' # No color

# Use awk to extract path and information, format output, and highlight priority
awk -F'[<>]' -v light_cyan="$light_cyan" -v cyan="$cyan" -v purple="$purple" -v white="$white" -v gray="$gray" -v blue="$blue" -v pink="$pink" -v hot_pink="$hot_pink" -v nc="$nc" \
  '/<loc>/{loc=$3; i++}
   /<lastmod>/{lastmod=$3}
   /<changefreq>/{changefreq=$3}
   /<priority>/{priority=$3; color = (priority > 0.56) ? hot_pink : pink}
   /<\/url>/{
     printf purple "[%d] " nc cyan "URL: " nc white "%s\n" cyan "%s: " nc gray "%s\n" cyan "%s: " nc purple "%s\n" cyan "%s: " color "%s\n\n",
     i, loc, "Last Modified", lastmod, "Change Frequency", changefreq, "Priority", priority}' $sitemap_file


# ----- OUTPUT example

Execution:   ./smscrape.sh ../sitemap.xml
-----------------------------------------

[1] URL: https://www.jiffylube.com/locations/tn/knoxville/1622
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[2] URL: https://www.jiffylube.com/locations/va/richmond/328
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[3] URL: https://www.jiffylube.com/honolulu
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[4] URL: https://www.jiffylube.com/locations/ar/bryant/3812
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[5] URL: https://www.jiffylube.com/locations/fl/boynton-beach/2603
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[6] URL: https://www.jiffylube.com/locations/wa/arlington/2585
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[5] URL: https://www.jiffylube.com/locations/fl/boynton-beach/2603
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[6] URL: https://www.jiffylube.com/locations/wa/arlington/2585
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[7] URL: https://www.jiffylube.com/locations/tx/arlington/3399
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[8] URL: https://www.jiffylube.com/locations/wi/madison/3138
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[9] URL: https://www.jiffylube.com/locations/ut/salt-lake-city/2038
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[10] URL: https://www.jiffylube.com/locations/ma/shrewsbury/3171
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

<snip>
[1952] URL: https://www.jiffylube.com/locations/il/arlington-heights/2501
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[1953] URL: https://www.jiffylube.com/locations/nd/watford-city/3757
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[1954] URL: https://www.jiffylube.com/locations/va/fredericksburg/107
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[1955] URL: https://www.jiffylube.com/locations/nc/durham/2733
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[1956] URL: https://www.jiffylube.com/locations/nc/durham/2734
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[1957] URL: https://www.jiffylube.com/locations/nc/durham/2735
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

<snip>
[2564] URL: https://www.jiffylube.com/locations/az/mesa/2266
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0

[2565] URL: https://www.jiffylube.com/locations/wa/mill-creek/2598
Last Modified: 2023-03-21
Change Frequency: daily
Priority: 1.0



