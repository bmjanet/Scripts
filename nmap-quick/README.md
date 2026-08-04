# nmap-quick

Made these scripts to automate the enumeration phase of my OSCP.
I would get so bored waiting 20+ minutes for my goto nmap scan to finish.

`sudo nmap -sCV -T4 -p- -Pn -n X.X.X.X -oN nmaptcp`

So I thought "What if I just did a quick scan and piped the open ports to a service scan?"
Now it's a one-and-done, click and stick, super awesome one line that speeds up enumeration FAST!
The two stage process also outputs the open ports before running the service scan, so you can start enumerating services before the default scripts and version scan is done :D

# What is it?
A fast, two-stage nmap service scans. Stage 1 sweeps for open ports; stage 2 runs
`-sC -sV` against only the ports each host actually has open.

- `nmap-quick-tcp` — all 65535 TCP ports
- `nmap-quick-udp` — top UDP ports

Both need root (raw sockets):

```
sudo nmap-quick-tcp [-iL <file>] [-oN|-oG|-oX|-oA <file>] <target> [target ...]
sudo nmap-quick-udp [-iL <file>] [-oN|-oG|-oX|-oA <file>] <target> [target ...]
```

## Options

| Flag                 | Meaning                                                        |
|----------------------|---------------------------------------------------------------|
| `<target>`           | One or more hosts/IPs, space-separated (like nmap)            |
| `-iL <file>`         | Read targets from a file                                       |
| `-oN/-oG/-oX/-oA <file>` | Save output; the flag is passed straight to nmap. With multiple hosts the IP is appended to the name |

## Examples

```
sudo nmap-quick-tcp 10.0.0.5
sudo nmap-quick-tcp 10.0.0.5 10.0.0.6 -oN scan
sudo nmap-quick-udp -iL targets.txt -oA udp-scan
```
You can also configure the source code to the flags you want. 

## Demo

<!-- Add usage video here -->

