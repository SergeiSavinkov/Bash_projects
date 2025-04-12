#!/bin/bash

function menu {
    echo "======================="
    echo "Personal Note Managment"
    echo "======================="
    echo "   a. Add a Note"
    echo "   b. View Notes"
    echo "   c. Exit"
    echo ""
    read -p "Enter option (a/b/c): " chosen_option 
}

function add_note {
    read -p "Enter a note title: " noteTitle
    read -p "Enter the note content: " noteContent
    currentTime=$(date)
    echo "Title: $noteTitle" >> $NOTE
    echo "Content: $noteContent" >> $NOTE
    echo "Note '$noteTitle' added successfully."
}

function display_notes {
    if [ -s $NOTE ]
    then
        cat $NOTE
    else
        echo "No notes now!"
}

function exit_manager {
    echo "Exiting Notes Manager. Goodbye!"
    exit 0
}

while true
    do
        menu
        if [ "$chosen_option" = "a" ]
        then
            add_note
        elif [ "$chosen_option" = "b" ]
        then
            display_notes
        elif [ "$chosen_option" = "c" ]
        then
            exit_manager
        else
            echo "Invalid option. Please try again!"
    fi
done