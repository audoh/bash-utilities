#!bash

# Script for managing default gateways using "route"
# Usage: gw [interface [gateway]]
# With no args, gets all default gateways for all interfaces.
# With interface, gets all route entries for that interface only.
# With interface & gateway address, deletes all route entries for that interface, adds the gateway address for that interface and gets the resulting route entry.

gateways=
if [ $1 ]
then
        # Get specific default gateways
        gateways=`route | grep "^default .* $1$"`
        if [ $2 ]
        then
                for _ in gateways
                do
                        sudo route del default $1
                done
                sudo route add default gw $2 $1
                gateways=`route | grep "^default .* $1$"`
        fi
else
        # Get all default gateways
        gateways=`route | grep ^default`
fi
if [ "$gateways" ]
then
        echo $gateways
fi
