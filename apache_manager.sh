#!/bin/bash

while true; do
    clear
    echo "Apache Control Script"
    echo "====================="
    echo "1. Start Apache"
    echo "2. Stop Apache"
    echo "3. Restart Apache"
    echo "4. Reload Apache"
    echo "5. Check Apache Status"
    echo "6. Enable Site"
    echo "7. Disable Site"
    echo "0. Exit"
    echo "====================="
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1)  echo "Starting Apache..."
            sudo systemctl start apache2
            read -p "Press any key to continue..."
            ;;

        2)  echo "Stopping Apache..."
            sudo systemctl stop apache2
            read -p "Press any key to continue..."
            ;;

        3)  echo "Restarting Apache..."
            sudo systemctl restart apache2
            read -p "Press any key to continue..."
            ;;

        4)  echo "Reloading Apache..."
            sudo systemctl reload apache2
            read -p "Press any key to continue..."
            ;;

        5)  echo "Apache Status:"
            sudo systemctl status apache2
            read -p "Press any key to continue..."
            ;;

        6)  echo -n "Enter the site name to enable: "
            read site
            sudo a2ensite $site
            sudo systemctl reload apache2
            read -p "Press any key to continue..."
            ;;

        7)  echo -n "Enter the site name to disable: "
            read site
            sudo a2dissite $site
            sudo systemctl reload apache2
            read -p "Press any key to continue..."
            ;;

        0)  echo "Exiting..."
            exit 0
            ;;

        *)  echo "Invalid option..."
            read -p "Press any key to continue..."
            ;;
    esac
done
