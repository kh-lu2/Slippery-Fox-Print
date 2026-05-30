# Slippery-Fate-of-Fox
The name of this repository comes from the three tools that can be analyzed using it.
- Slips
- Kismet (fate in Japanese)
- Kitsune (fox in Japanese)

## Slips
To test slips, you need to have docker installed.
1. ``` docker run -it --rm -p 55000:55000 -v $(pwd):/dataset stratosphereips/slips bash```
2. ``` ./slips.py -f /dataset/attack.pcap ```
3. ``` ./webinterface.sh ```
