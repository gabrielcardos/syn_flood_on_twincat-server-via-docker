# SYN TCP Flood via Docker

A ubuntu conteinerized script floods via local TCP requests a TwinCAT server hosted on the local network. The usage of a Wireshark or any package analyser is advised

## License

This project is licensed under the MIT License.

## Requirements
Docker v20.10.12
curl v7.64.1
Linux ubuntu v20.04
GNU bash, v3.2.57
TwinCAT+TF2000 HMI Server
Target environment (used: win10)
Attacker environment (used: macOS BigSur)

## Attack Architecture
The attack is using the instruction pipelining processing to execute parallelly the docker containers containing the evil file.

![image](https://user-images.githubusercontent.com/62112622/170697285-2169a26b-0b82-4d5b-aa32-b27d77491090.png)

## Result
![image](https://user-images.githubusercontent.com/62112622/170697450-4101556f-0c21-4280-8ff6-c5647df4f9ae.png)
