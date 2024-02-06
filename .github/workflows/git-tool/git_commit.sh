#!/bin/bash

# Function to create a Git commit
create_commit() {
    echo "Enter the type of commit (e.g., feat, fix, docs):"
    read -r type

    echo "Enter the scope of the commit (e.g., user, authentication):"
    read -r scope

    echo "Enter a brief subject for the commit:"
    read -r subject

    echo "Enter a more detailed description for the commit (optional):"
    read -r body

    echo "Enter any references or related issues (e.g., Closes #123):"
    read -r footer

    commit_message="$type($scope): $subject\n\n$body\n\n$footer"

    git commit -m "$commit_message"
}

# Function to apply a Git tag
apply_tag() {
    echo "Enter the name of the tag:"
    read -r tag_name

    git tag -a "$tag_name" -m "Tag $tag_name"
    git push origin "$tag_name"
}

# Function to initialize GitFlow branch layout
initialize_gitflow() {
    git flow init -d
}

# Main menu
while true; do
    echo "Select an option:"
    echo "1. Create a Git commit"
    echo "2. Apply a Git tag"
    echo "3. Initialize GitFlow branch layout"
    echo "4. Exit"

    read -r choice

    case $choice in
        1) create_commit ;;
        2) apply_tag ;;
        3) initialize_gitflow ;;
        4) exit ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done
