#!/bin/bash

# Author: Viateur

# Creating directories
create_directories() {
    DIRS=("logs" "configs" "scripts")
    for dir in "${DIRS[@]}"; do
        if [ -d "$dir" ]; then
            echo "Directory already exists: $dir"
        else
            mkdir "$dir"
            echo "Created directory: $dir"
        fi
    done
}

# creating files using loops
create_files() {
    FILES=("logs/system.log" "configs/app.conf" "scripts/backup.sh")
    
    for file in "${FILES[@]}"; do
        if [ -f "$file" ]; then
            echo "File already exists: $file"
        else
            case "$file" in
                "logs/system.log")
                    echo "Application system logs" > "$file"
                    chmod 644 "$file"
                    ;;
                "configs/app.conf")
                    echo "app configuration" > "$file"
                    chmod 444 "$file"
                    ;;
                "scripts/backup.sh")
                    echo -e "#!/bin/bash\n# Bash script" > "$file"
                    chmod 755 "$file"
                    ;;
            esac
            echo "Created file: $file"
        fi
    done
}

# Displaying directory structure and permissions
display_structure() {
    echo ""
    echo "Directory Structure:"
    tree
    echo ""
    echo "Permissions Overview:"
    ls -lR
}

# Main to show everything
main() {
    create_directories
    create_files
    display_structure
}

main
