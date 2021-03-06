#!/bin/sh

USER=${MONGODB_USER:-"admin"}
DATABASE=${MONGODB_DATABASE:-"admin"}
# no this param, generate one random password
PASS=${MONGODB_PASS:-"123456"}

RET=1
# wait until service start up
while [[ ${RET} -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "=> Creating an admin name: ${USER} user with a ${PASS} password in MongoDB"
mongo admin --eval "db.createUser({user: '${USER}', pwd: '${PASS}', roles:[{role:'root',db:'admin'}]});"
sleep 2

if [ "${DATABASE}" != "admin" ]; then
    echo "=> Creating an ${USER} user with a ${PASS} password in MongoDB"
    mongo admin -u ${USER} -p${PASS} << EOF
    use ${DATABASE}
    db.createUser({user: '${USER}', pwd: '${PASS}', roles:[{role:'dbOwner',db:'${DATABASE}'}]})
EOF
fi

echo "=> Done!"
touch /data/db/.init_db

echo "========================================================================"
echo "You can now connect to this MongoDB server using:"
echo ""
echo "    mongo $DATABASE -u $USER -p $PASS --host <host> --port <port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
