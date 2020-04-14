#!/bin/sh

echo "[i] Log data in $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.out"

# Collect data
/bin/amass enum --passive -d $1 -json $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.json.out

# Extract from json results
jq -M .name $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.json.out | sed "s/\"//g" | tr -d '\015' | tee -a $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.out

# sort results
sort -u $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.out -o $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.out

# delete tmp file
rm $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.json.out

# Consolidate with existing results
echo [i] colsolidate results in $DATA_DIR/$( date +"%Y-%m-%d")_$1.out
cat $DATA_DIR/$( date +"%Y-%m-%d")_$1.amass.out >> $DATA_DIR/$( date +"%Y-%m-%d")_$1.out
sort -u $DATA_DIR/$( date +"%Y-%m-%d")_$1.out -o $DATA_DIR/$( date +"%Y-%m-%d")_$1.out

# done
exit 0

