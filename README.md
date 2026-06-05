# Slippery-Fox-Print
The name of this repository comes from the three tools that can be analyzed using it.
- Slips
- Kitsune (fox in Japanese)
- nPrint (with wlan extention)

The following commands were tested on a Windows system with wsl installed.

## Slips
Run docker container:
```powershell 
docker run -it --rm -p 55000:55000 -v "${PWD}:/dataset" stratosphereips/slips bash 
```  

Analize AsyncRAT:
```powershell
./slips.py -f /dataset/attacks/layer3/asyncrat.pcap
cp -r output /dataset/slips_output/asyncrat
./webinterface.sh 
```  

Analyze Mirai:
```powershell
./slips.py -f /dataset/attacks/layer3/mirai.pcap 
cp -r output /dataset/slips_output/mirai
./webinterface.sh 
```

## Kitsune
Setup environment:
```powershell
cd kitsune
python -m venv venv
.\venv\Scripts\activate
pip install -r requirements.txt
```

Analyze AsyncRAT:
```powershell
python example.py --path ../attacks/layer3/asyncrat.pcap --fmgrace 2000 --adgrace 7000 
```  

Analyze Mirai:
```powershell
python example.py --path ../attacks/layer3/mirai.pcap --fmgrace 5000 --adgrace 45000 
``` 

Deactivate virtual environment:  
```powershell
deactivate
```

## nPrint
Use nprint: 
```bash
cd nprint
wsl
./nprint -P ../attacks/layer2/deauth.pcap -w -W deauth.csv
exit
```

Find attack frames:
```powershell
cd nprint
tshark -r ../attacks/layer2/deauth.pcap -Y "(wlan.fc.type_subtype==10 || wlan.fc.type_subtype==12) && wlan.fc.protected==0 && frame.number >= 1088022 && frame.number <= 1626254" -T fields -e frame.number > attack_frames.txt
```

Setup environment:
```powershell
python -m venv venv
.\venv\Scripts\activate
pip install -r requirements.txt
```

Now run the cells in `nprint.ipynb`

Deactivate virtual environment:  
```powershell
deactivate
```


