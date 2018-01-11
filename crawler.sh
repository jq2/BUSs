#!/bin/bash
# @filename: parse_free_proxy_list_net.sh
# @author: NullDotDEV
# @description: Download a list of proxy servers from https://free-proxy-list.net
# @last-updated: Thu Jan 11 00:49:31 -02 2018
# ===============================================================================
# HowTo: Using this script.
# Using this script is very simple, just type:
# Example: $ ./parse_free_proxy_list_net.sh > list_of_ips.txt


# download 
curl -L --user-agent "Mozilla/6.0" "https://free-proxy-list.net" &> dataset.txt

# loop through the html source-code and print all the IP addresses to standard output.
for idx in {1..300};
do
	ip_address=$(cat dataset.txt | pup "#proxylisttable > tbody > tr:nth-child($idx) > td:nth-child(1) text{}"); 
	port_number=$(cat dataset.txt | pup "#proxylisttable > tbody > tr:nth-child($idx) > td:nth-child(2) text{}"); 
	echo "$ip_address:$port_number"; 
done



