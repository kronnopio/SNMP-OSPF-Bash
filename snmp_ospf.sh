#!/bin/bash

ospfNbrIpAddr='1.3.6.1.2.1.14.10.1.1'
ospfNbrAddressLessIndex='1.3.6.1.2.1.14.10.1.2'
ospfNbrRtrId='1.3.6.1.2.1.14.10.1.3'
ospfNbrOptions='1.3.6.1.2.1.14.10.1.4'
ospfNbrPriority='1.3.6.1.2.1.14.10.1.5'
ospfNbrState='1.3.6.1.2.1.14.10.1.6'
ospfNbrLsRetransQLen='1.3.6.1.2.1.14.10.1.8'
ospfNbmaNbrStatus='1.3.6.1.2.1.14.10.1.9'
ospfNbmaNbrPermanence='1.3.6.1.2.1.14.10.1.10'
ospfNbrHelloSuppressed='1.3.6.1.2.1.14.10.1.11'
ospfNbrRestartHelperStatus='1.3.6.1.2.1.14.10.1.12'
ospfNbrRestartHelperAge='1.3.6.1.2.1.14.10.1.13'
ospfNbrRestartHelperExitReason='1.3.6.1.2.1.14.10.1.14'

format="| %-50s |"

printf "$format\n" -------------------------------------------------- > /tmp/$0
printf "$format\n" "              SNMP OSPF Bash Table              " >> /tmp/$0
printf "$format\n" -------------------------------------------------- >> /tmp/$0
printf "$format\n" "                Walter Reverdito                " >> /tmp/$0
printf "$format\n" -------------------------------------------------- >> /tmp/$0


IFS=$'\n'

printf "$format\n" -------------------------------------------------- >> /tmp/$0
printf "$format\n" "               OSPF  Neighbor Table             " >> /tmp/$0
printf "$format\n" -------------------------------------------------- >> /tmp/$0

ipaddr=( $(/usr/bin/snmpwalk -c $2 -v1 -m OSPF-MIB  -Oqv $1 $ospfNbrIpAddr) )

for (( i=0; i<${#ipaddr[@]}; i++ )); 
do 

    printf "$format\n" "ospfNbrIpAddr = ${ipaddr[i]}" >> /tmp/$0
    printf "$format\n"  "ospfNbrAddressLessIndex = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrAddressLessIndex.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n"  "ospfNbrRtrId = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrRtrId.${ipaddr[i]}.0 | awk {'print $2'} )  >> /tmp/$0
    printf "$format\n"  "ospfNbrOptions = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrOptions.${ipaddr[i]}.0 | awk {'print $2'} )  >> /tmp/$0
    printf "$format\n"  "ospfNbrPriority = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrPriority.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n"  "ospfNbrState = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrState.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n"  "ospfNbrLsRetransQLen = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrLsRetransQLen.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n"  "ospfNbmaNbrStatus = "$(/usr/bin/snmpget -c $2 -v1 -Ov -m OSPF-MIB  $1 $ospfNbmaNbrStatus.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n"  "ospfNbmaNbrPermanence = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbmaNbrPermanence.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n" "ospfNbrHelloSuppressed = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrHelloSuppressed.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n" "ospfNbrRestartHelperStatus = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrRestartHelperStatus.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0
    printf "$format\n" "ospfNbrRestartHelperAge = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrRestartHelperAge.${ipaddr[i]}.0 | awk {'print $2 " " $3'} ) >> /tmp/$0
    printf "$format\n" "ospfNbrRestartHelperExitReason = "$(/usr/bin/snmpget -c $2 -v1 -m OSPF-MIB  -Ov $1 $ospfNbrRestartHelperExitReason.${ipaddr[i]}.0 | awk {'print $2'} ) >> /tmp/$0


    printf "$format\n" -------------------------------------------------- >> /tmp/$0
    #echo "${ipaddr[i]} ${lessindex[i]}"; 
done

cat /tmp/$0 