#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/Desktop/lab3_ws/src/dynamixel_motor/dynamixel_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/Desktop/lab3_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/Desktop/lab3_ws/install/lib/python2.7/dist-packages:/home/ubuntu/Desktop/lab3_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/Desktop/lab3_ws/build" \
    "/usr/bin/python2" \
    "/home/ubuntu/Desktop/lab3_ws/src/dynamixel_motor/dynamixel_driver/setup.py" \
     \
    build --build-base "/home/ubuntu/Desktop/lab3_ws/build/dynamixel_motor/dynamixel_driver" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/Desktop/lab3_ws/install" --install-scripts="/home/ubuntu/Desktop/lab3_ws/install/bin"
