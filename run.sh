#!/bin/bash
# Overclocked Pi 5 @2.8GHz — server RAM allocation increased

RAMSIZE="6G"
JAVA_EXE="java"
JAR_FILE="paper-1.12.2.jar"

"$JAVA_EXE" -Xms$RAMSIZE -Xmx$RAMSIZE \
    -XX:+UseG1GC \
    -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=100 \
    -XX:G1HeapRegionSize=32M \
    -XX:ParallelGCThreads=2 \
    -XX:ConcGCThreads=2 \
    -XX:+UseStringDeduplication \
    -Djava.awt.headless=true \
    -Dfile.encoding=UTF-8 \
    -Dlog4j2.formatMsgNoLookups=true \
    -jar "$JAR_FILE" nogui

read -p "Press enter to exit..."
