#!/bin/bash

FILE_NAME=$1
KEY_TYPE=$2

/usr/bin/ssh-keygen -t $KEY_TYPE -P '' -q -f ./$FILE_NAME
/usr/bin/base64 ./$FILE_NAME > ./$FILE_NAME.b64
/usr/bin/base64 ./$FILE_NAME.pub > ./$FILE_NAME.pub.b64

rm ./$FILE_NAME
rm ./$FILE_NAME.pub

exit 0
