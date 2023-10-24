#!/bin/bash

# Return System Locale (shotened to country only)
systemLocal=$(localectl | grep "System Locale" | awk -F'=' '{print $2}' | cut c 4-5)
echo $systemLocal
