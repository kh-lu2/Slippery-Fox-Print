tshark -r ../attacks/layer2/deauth.pcap -Y "(wlan.fc.type_subtype==10 || wlan.fc.type_subtype==12) && wlan.fc.protected==0 && frame.number >= 1088022 && frame.number <= 1626254" -T fields -e frame.number > attack_frames.txt

tshark -r ../attacks/layer2/rouge.pcap -Y "wlan.fc.type_subtype==8 && frame.number >= 1198551 && frame.number <= 1973111 && frame.len < 264" -T fields -e frame.number > attack_frames_rouge.txt

tshark -r ../attacks/layer2/evil.pcap -Y "((wlan.fc.type_subtype==8 && frame.len < 242) || ((wlan.fc.type_subtype==10 || wlan.fc.type_subtype==12 || wlan.fc.type_subtype==40) && wlan.fc.protected==0)) && frame.number >= 1420038 && frame.number <= 3778728 && (ip.addr==192.168.30.1 || wlan.addr == 0c:9d:92:54:fe:35)" -T fields -e frame.number > attack_frames_evil.txt
