#!/usr/bin/env bash

cd ~/Downloads || exit
tar -xf apache-jmeter-5.1.1.tgz
mv apache-jmeter-5.1.1 ~/applications/apache-jmeter-5.1.1
cd ~/applications/apache-jmeter-5.1.1/bin || exit

# To run jmeter
# ./jmeter

# You should get the following output

# ================================================================================
# Don't use GUI mode for load testing !, only for Test creation and Test debugging.
# For load testing, use NON GUI Mode:
#    jmeter -n -t [jmx file] -l [results file] -e -o [Path to web report folder]
# & increase Java Heap to meet your test requirements:
#    Modify current env variable HEAP="-Xms1g -Xmx1g -XX:MaxMetaspaceSize=256m" in the jmeter batch file
# Check : https://jmeter.apache.org/usermanual/best-practices.html
# ================================================================================

# Finally, let's update the $PATH to have Apache JMeter available in the console from now on:
echo "export PATH='$PATH:$HOME/applications/apache-jmeter-5.1.1/bin'" >> ~/.bashrc

# Reload your bash by:
source ~/.bashrc

# Give permissions:
chmod +x "$HOME"/applications/apache-jmeter-5.1.1/bin/jmeter

# Finally start JMeter from the console:
jmeter