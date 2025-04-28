# Troubleshooting Steps

## 1. Verify DNS Resolution
Compare the current DNS server resolution (`/etc/resolv.conf`) with Google’s public DNS (8.8.8.8).

### Commands:
```bash
# check what server Dns is using
cat /etc/resolv.conf

# Test DNS resolution using system's default DNS
dig internal.example.com

# test Dns resoulation by using google's public Dns
dig @8.8.8.8 internal.example.com

## If the system's Dns faild but 8.8.8.8 works , then the problem with the internal DNS server

## After confirming the IP address, I would check if the web server is reachable on port 80 (HTTP) or 443 (HTTPS).

# Try to fetch HTTP headers
curl -I http://internal.example.com

# Test connection to port 80
telnet internal.example.com 80

# Alternative if telnet is not installed
nc -vz internal.example.com 80

# Check if the service is running locally
ss -tuln | grep -E ':80|:443'

#If curl fails but ping works likely web server issue.

#If no service is listening we need to start/restart the server.

#possible causes                       reasons
1.DNS server misconfigured >>>>> wrong nameserver in /etc/resolv.conf
2.Dns cache is stale >>>> old Dns resolution
3.firewall blocking ports
4.network issues >>>  IP unreachable even if service is running

#possible commands to solove these problems

    # Edit DNS servers to set correct nameserver
    sudo nano /etc/resolv.conf
   

    # Restart networking for solve problem "Dns cache is stale"
    sudo systemctl restart NetworkManager

    # Open firewall HTTP/HTTPS ports 
    sudo firewall-cmd --add-port=80/tcp --permanent
    sudo firewall-cmd --add-port=443/tcp --permanent
    sudo firewall-cmd --reload

    # Restart web server if the web server not listening 
    sudo systemctl restart apache2
  



