# SNMP-OSPF-Bash

OSPF protocol check via SNMP.

Net-SNMP must be installed. In case of failure, check the path of the snmpwalk and snmpget commands.

Verify that the following mibs are present: 
    OSPF-MIB
    SNMPv2-SMI
    SNMPv2-TC
    SNMPv2-CONF
    IF-MIB

How to use:

./snmp_ospf.sh ip community_snmp
