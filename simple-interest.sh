   #!/bin/bash
   # This script calculates simple interest given principal,
   # annual rate of interest and time period in years.

#!/bin/bash

# Do not use this in production. Sample purpose only.
# Author: Upkar Lidder (IBM)
# Additional Authors: <your GitHub username>

# Function to check if input is a valid positive number
is_number() {
    if [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        return 0
    else
        return 1
    fi
}

# Main loop to allow multiple interest calculations
while true; do
    echo "Enter the principal amount (positive number):"
    read p
    if ! is_number $p || [ $(echo "$p <= 0" | bc) -eq 1 ]; then
        echo "Invalid input! Please enter a positive number for the principal."
        continue
    fi

    echo "Enter the annual rate of interest (positive number):"
    read r
    if ! is_number $r || [ $(echo "$r <= 0" | bc) -eq 1 ]; then
        echo "Invalid input! Please enter a positive number for the rate of interest."
        continue
    fi

    echo "Enter the time period in years (positive number):"
    read t
    if ! is_number $t || [ $(echo "$t <= 0" | bc) -eq 1 ]; then
        echo "Invalid input! Please enter a positive number for the time period."
        continue
    fi

    # Calculate the simple interest: s = (p * t * r) / 100
    s=$(echo "$p * $t * $r / 100" | bc -l)

    # Output the result, rounding to two decimal places
    echo "The simple interest is: $(printf "%.2f" $s)"

    # Ask if the user wants to calculate again
    echo "Do you want to calculate again? (yes/no)"
    read answer
    if [[ $answer != "yes" ]]; then
        break
    fi
done

echo "Goodbye!"