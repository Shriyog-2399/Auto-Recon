# Auto-Recon.
This bash script automates the process of reconnaissance and scanning for a given domain. It sequentially runs tools like subfinder, amass, dnsx, httpx, and naabu to discover subdomains, resolve DNS records, filter accessible endpoints, and perform a port scan. The results are saved in separate files for further analysis.

# Domain Reconnaissance and Scanning Script

This script automates reconnaissance and scanning tasks on a given domain, using a series of powerful tools for subdomain enumeration, DNS resolution, HTTP status filtering, and port scanning. 

## Tools Required

Ensure the following tools are installed before running the script:

- **subfinder**: Enumerates subdomains for a target domain.
- **amass**: Performs additional subdomain enumeration with detailed analysis.
- **dnsx**: Resolves subdomains and verifies DNS records for discovered subdomains.
- **httpx**: Filters URLs that respond with a 200 HTTP status, indicating accessible endpoints.
- **naabu**: Scans for open ports on the target domain to identify active services.

## Installation

To install these tools, follow their respective installation instructions:

- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Amass](https://github.com/OWASP/Amass)
- [Dnsx](https://github.com/projectdiscovery/dnsx)
- [Httpx](https://github.com/projectdiscovery/httpx)
- [Naabu](https://github.com/projectdiscovery/naabu)

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/repo-name.git
   cd repo-name

    Make the script executable:

chmod +x script.sh

Run the script:

    ./script.sh

    Enter the domain name when prompted (e.g., example.com).

The script will perform the following tasks sequentially:

    Subdomain Enumeration: Using subfinder and amass to gather potential subdomains for the target domain.
    DNS Resolution: Using dnsx to verify DNS records for the discovered subdomains.
    Filtering URLs: Using httpx to check which subdomains respond with a 200 OK status.
    Port Scanning: Using naabu to find open ports on the target domain.

Output Files

The following output files are generated by the script:

    subfinder_output.txt: Results from subfinder.
    amass_output.txt: Results from amass.
    dnsx_output.txt: Results from dnsx.
    subdomain.txt: Unique subdomains obtained by combining subfinder, amass, and dnsx results.
    httpx.txt: URLs that respond with a 200 OK status.
    naabu_output.txt: Open ports discovered by naabu.

Each tool’s results are saved in separate files for easier analysis.
Example

To run the script on example.com:

./script.sh

Example output:

Running subfinder for example.com...
Subfinder results saved to example.com_subfinder_output.txt

Running amass for example.com...
Amass results saved to example.com_amass_output.txt

Running dnsx for example.com...
Dnsx results saved to example.com_dnsx_output.txt

Running httpx to find URLs with a 200 response...
HTTPX results saved to httpx.txt

Running naabu for port scanning on example.com...
Naabu port scan results saved to naabu_output.txt

All tools have completed and saved their results.
