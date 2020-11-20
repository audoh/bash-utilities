#!bash

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
