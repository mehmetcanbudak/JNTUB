#!/bin/bash

OUTPUT_DIR=finalize
BACKUP_DIR=$OUTPUT_DIR/backup
STAGING_DIR=tmp

set -x
mkdir -p $OUTPUT_DIR

# Copy existing contents of output dir to staging dir
rm -rf $STAGING_DIR
mkdir $STAGING_DIR
cp -R $OUTPUT_DIR/* $STAGING_DIR/

# Clear out output dir
rm -rf $OUTPUT_DIR/*

# Copy the kicad pcb file into two copies,
# then I manually erase the irrelevant components
# from each pcb file.
mkdir $OUTPUT_DIR/board1
mkdir $OUTPUT_DIR/board2
cp JNTUB.kicad_pcb $OUTPUT_DIR/board1/JNTUB_board1.kicad_pcb
cp JNTUB.kicad_pcb $OUTPUT_DIR/board2/JNTUB_board2.kicad_pcb

# Copy staging to backup
mkdir -p $BACKUP_DIR
cp -R $STAGING_DIR/* $BACKUP_DIR/
rm -rf $STAGING_DIR
