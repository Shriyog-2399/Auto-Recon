#!/bin/bash

# Display a description for the user
echo "Description:"
echo "This script performs a series of reconnaissance and scanning steps on a given domain."
echo "It uses the following tools, which should be installed beforehand:"
echo "  - subfinder: Enumerates subdomains for a target domain."
echo "  - amass: Performs additional subdomain enumeration with detailed analysis."
echo "  - dnsx: Resolves subdomains and verifies DNS records for discovered subdomains."
echo "  - httpx: Filters URLs that respond with a 200 HTTP status, indicating accessible endpoints."
echo "  - naabu: Scans for open ports on the target domain to identify active services."
echo ""
echo "Please make sure all these tools are installed before running the script."
echo ""

# Ask the user for the domain name
read -p "Enter the domain name (e.g., example.com): " domain

# Define output directories
subfinder_output="${domain}_subfinder_output.txt"
amass_output="${domain}_amass_output.txt"
dnsx_output="${domain}_dnsx_output.txt"
unique_output="subdomain.txt"
httpx_output="httpx.txt"
naabu_output="naabu_output.txt"

# Run subfinder and save the output
echo "Running subfinder for $domain..."
subfinder -d $domain -o $subfinder_output
echo "Subfinder results saved to $subfinder_output"

# Wait for 10 seconds before starting amass
echo ""
echo "Waiting for 10 seconds before running amass..."
sleep 10

echo "Running amass for $domain..."
amass enum -d $domain -o $amass_output
echo "Amass results saved to $amass_output"

# Wait for 10 seconds before starting dnsx
echo ""
echo "Waiting for 10 seconds before running dnsx..."
sleep 10

echo "Running dnsx for $domain..."
dnsx -d $domain -w /usr/share/wordlists/amass/subdomains-top1million-20000.txt -o $dnsx_output
echo "Dnsx results saved to $dnsx_output"

# Wait for 5 seconds before combining results
echo ""
echo "Waiting for 5 seconds before combining results..."
sleep 5

# Combine, sort, and get unique subdomains
echo "Combining results and sorting to get unique subdomains..."
cat "$subfinder_output" "$amass_output" "$dnsx_output" | sort -u > "$unique_output"
echo "Unique subdomains saved to $unique_output"

# Wait for 10 seconds before starting httpx
echo ""
echo "Waiting for 10 seconds before running httpx..."
sleep 10

# Run httpx to get URLs with a 200 response
echo "Running httpx to find URLs with a 200 response..."
cat "$unique_output" | httpx -o "$httpx_output"
echo "HTTPX results saved to $httpx_output"

# Wait for 10 seconds before starting naabu
echo ""
echo "Waiting for 10 seconds before running naabu..."
sleep 10

# Run naabu for port scanning
echo "Running naabu for port scanning on $domain..."
naabu -host "$domain" -o "$naabu_output"
echo "Naabu port scan results saved to $naabu_output"

echo "All tools have completed and saved their results."

