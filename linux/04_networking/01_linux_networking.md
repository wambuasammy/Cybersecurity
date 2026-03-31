# Linux Networking Fundamentals

## Introduction

Networking is a fundamental component of Linux systems. Every modern system communicates with other machines over a network, whether for accessing websites, transferring files, interacting with remote servers, or providing services to other systems.

Understanding networking commands is essential for system administrators, DevOps engineers, and cybersecurity professionals. These tools allow administrators to inspect network interfaces, determine IP addresses, test connectivity, analyze open ports, resolve domain names, and diagnose network issues.

In cybersecurity, networking knowledge is critical because many attacks and defenses occur across networks. Security professionals must understand how systems communicate in order to identify suspicious traffic, exposed services, and potential vulnerabilities.

---

## Objective

The objective of these notes is to understand how Linux networking works and how common networking commands are used to inspect, troubleshoot, and analyze network activity.

By the end of these notes, you will understand:

- how Linux identifies network interfaces
- how to determine IP addresses
- how to test network connectivity
- how to inspect open ports and active connections
- how domain names are resolved to IP addresses
- how packets travel through networks
- how network traffic can be captured and analyzed

---

## Table of Contents

- [Network Interfaces](#network-interfaces)
- [Hostname Information](#hostname-information)
- [Testing Network Connectivity](#testing-network-connectivity)
- [Routing Information](#routing-information)
- [Inspecting Open Ports](#inspecting-open-ports)
- [DNS Resolution](#dns-resolution)
- [Tracing Network Routes](#tracing-network-routes)
- [Packet Capture](#packet-capture)
- [Conclusion](#conclusion)

---

# Network Interfaces

Linux systems communicate with networks through **network interfaces**. These interfaces represent the connection between the operating system and the network hardware.

Interfaces may include:

- Ethernet interfaces
- wireless interfaces
- virtual interfaces
- loopback interfaces

The primary command used to inspect network interfaces is:


ip a


Example:


ip a


Example output (simplified):


2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP>
inet 192.168.1.15/24


Explanation:

- **eth0** → network interface name  
- **inet** → IPv4 address  
- **192.168.1.15** → system IP address  
- **/24** → subnet mask

This command allows administrators to identify:

- network interfaces available on the system
- IP addresses assigned to those interfaces
- whether an interface is active

This command is often the **first step when troubleshooting network problems**.

---

# Hostname Information

A hostname is the unique name used to identify a computer on a network.

To display the system hostname:


hostname


Example output:


Ace


To display the IP address assigned to the system:


hostname -I


Example output:


192.168.1.15


Explanation:

- `hostname` displays the system name
- `hostname -I` shows the IP address associated with the machine

This command provides a quick way to determine the system's network identity.

---

# Testing Network Connectivity

One of the most commonly used networking commands is:


ping


Example:


ping google.com


Example output:


PING google.com (142.250.190.78)
64 bytes from 142.250.190.78


Explanation:

- `ping` sends **ICMP echo request packets** to another host.
- If the host responds, the network connection is working.

This command is useful for:

- verifying internet connectivity
- checking whether a host is reachable
- measuring network latency

To limit the number of packets sent:


ping -c 4 google.com


This sends only **four packets** instead of running continuously.

---

# Routing Information

Networking systems use **routing tables** to determine where network packets should be sent.

To view the routing table:


ip route


Example output:


default via 192.168.1.1 dev eth0
192.168.1.0/24 dev eth0


Explanation:

- **default** → default gateway used for external traffic
- **192.168.1.1** → router address
- **dev eth0** → network interface used for routing

The routing table determines how packets travel across networks.

---

# Inspecting Open Ports

Open ports indicate services that are running on a system.

To inspect open ports and listening services:


ss -tuln


Explanation of options:

- `-t` → display TCP sockets
- `-u` → display UDP sockets
- `-l` → display listening ports
- `-n` → display numeric addresses

Example output:


tcp LISTEN 0 128 0.0.0.0:22


Explanation:

- port **22** is open
- the **SSH service** is running

This command is very important for **security auditing**, because attackers often scan for open ports to discover available services.

Older systems may use:


netstat -tuln


---

# DNS Resolution

DNS (Domain Name System) converts domain names into IP addresses.

To resolve a domain name:


nslookup google.com


Example output:


Name: google.com
Address: 142.250.190.78


Another advanced DNS tool is:


dig google.com


The `dig` command provides detailed DNS information including:

- DNS servers used
- response time
- record types
- domain information

DNS tools are commonly used during **reconnaissance in cybersecurity assessments**.

---

# Tracing Network Routes

Packets typically travel through multiple routers before reaching their destination.

To trace the route packets take:


traceroute google.com


Example output:


1 192.168.1.1
2 10.1.0.1
3 142.250.190.78


Explanation:

Each line represents a **network hop** between routers.

This command helps identify:

- network routing paths
- slow network segments
- connectivity problems

---

# Packet Capture

Network traffic can be captured and analyzed using the tool:


tcpdump


Example:


sudo tcpdump -i eth0


Explanation:

- `tcpdump` captures network packets
- `-i` specifies the network interface

Example output:


IP 192.168.1.15 → 142.250.190.78 TCP


This command is widely used for:

- network troubleshooting
- traffic analysis
- intrusion detection
- cybersecurity investigations

---

# Conclusion

Linux networking commands allow administrators and security professionals to inspect, diagnose, and analyze network activity on a system.

In these notes we explored several important networking tools including commands used to inspect network interfaces, determine IP addresses, test connectivity, examine routing tables, inspect open ports, resolve domain names, trace network routes, and capture network traffic.

Understanding these commands is essential for both system administration and cybersecurity. Many security assessments and incident investigations rely heavily on networking tools to identify suspicious connections, detect exposed services, and analyze communication between systems.

By mastering these networking commands, engineers gain visibility into how systems communicate and develop the skills necessary to troubleshoot network issues and secure Linux environments effectively.