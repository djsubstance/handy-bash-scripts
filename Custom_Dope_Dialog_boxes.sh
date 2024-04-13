apt install whiptail -y
snap install newt 


export NEWT_COLORS='
    root=,black           # Default text on the black background
    border=white,black    # Border color
    window=,black         # Window background
    title=yellow,black    # Title text
    button=white,black    # Button text
    actbutton=yellow,black  # Active button text
    checkbox=white,black  # Checkbox text
    actcheckbox=yellow,black # Active checkbox text
    entry=white,black     # Entry field text
    label=white,black     # Label text
    listbox=white,black   # Listbox text
    actlistbox=yellow,black # Active listbox text
    textbox=white,black   # Textbox text
    acttextbox=yellow,black # Active textbox text
    compactbutton=white,black # Compact button text
    actcompactbutton=yellow,black # Active compact button text
    sells=white,blue      # Selections
    sellistbox=white,blue # Selected listbox
    sellabel=white,blue   # Selected label
    selentry=white,blue   # Selected entry
    password=white,black  # Password text
    disentry=grey,black   # Disabled entry text
    compactbutton=white,black # Compact button
    actcompactbutton=yellow,black # Active compact button
    errmsg=red,black      # Error message text
    textboxreflowed=white,black # Reflowed text in textboxes
    emptyscale=,black     # Empty scale
    fullscale=white,black # Full scale
    disscale=grey,black   # Disabled scale
    background=black      # General background
'



create a quick menu dialog:
 CHOICE=$(whiptail --title "Advanced Menu with Custom Colors" --menu "Choose an option" 15 60 4 \
"1" "Option 1: Basic Info" \
"2" "Option 2: Configuration" \
"3" "Option 3: Update System" \
"4" "Option 4: Exit"  3>&1 1>&2 2>&3)



                                                                                                                                                                    
                                                                                                                                                                       
                                                     ┌───────────┤ Advanced Menu with Custom Colors ├───────────┐                                                      
                                                     │ Choose an option                                         │                                                      
                                                     │                                                          │                                                      
                                                     │                1 Option 1: Basic Info                    │                                                      
                                                     │                2 Option 2: Configuration                 │                                                      
                                                     │                3 Option 3: Update System                 │                                                      
                                                     │                4 Option 4: Exit                          │                                                      
                                                     │                                                          │                                                      
                                                     │                                                          │                                                      
                                                     │                                                          │                                                      
                                                     │                                                          │                                                      
                                                     │                                                          │                                                      
                                                     │              <Ok>                  <Cancel>              │                                                      
                                                     │                                                          │                                                      
                                                     └──────────────────────────────────────────────────────────┘                                                      
                                                                                                                                    
                                                                                                                                    
