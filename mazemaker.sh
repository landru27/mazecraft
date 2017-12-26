#!/bin/bash


echo 'building maze blueprint ...'

./mazemaker > maze-base
cat           maze-base | ./x3.pl > maze-base-x3       

echo '####  chests'                                                                                     > maze-blueprint
echo '==  chesta   :  ----:--  ----:--  BRED:16  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--' >> maze-blueprint
echo '==  chesta   :  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  PTNh:1   ----:--  ----:--' >> maze-blueprint
echo '==  chesta   :  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--' >> maze-blueprint
echo ''                                                                                                >> maze-blueprint
echo '==  chestb   :  ----:--  SHLD:1   ----:--  TRCH:4   ----:--  ----:--  ----:--  ----:--  ----:--' >> maze-blueprint
echo '==  chestb   :  ----:--  HELM:1   ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--' >> maze-blueprint
echo '==  chestb   :  ----:--  BOOT:1   ----:--  ----:--  ----:--  ----:--  ----:--  ----:--  ----:--' >> maze-blueprint
echo ''                                                                                                >> maze-blueprint
echo '==  chestc   :  SHLD:1   CPLT:1   MTTN:16  BEEF:16  ----:--  PTNh:1   ----:--  SEDw:64  ----:--' >> maze-blueprint
echo '==  chestc   :  SWRD:1   LEGG:1   CHNK:16  PORK:16  ----:--  PTNh:1   ----:--  SEDw:64  ----:--' >> maze-blueprint
echo '==  chestc   :  HELM:1   BOOT:1   FISH:4   BRED:32  ----:--  PTNh:1   ----:--  SEDw:64  ----:--' >> maze-blueprint
echo ''                                                                                                >> maze-blueprint
echo '==  chestd   :  SKUL:1   BONE:1   BONE:1   SKUL:1   BONE:1   BONE:1   BONE:1   SKUL:1   BONE:1'  >> maze-blueprint
echo '==  chestd   :  BONE:1   BONE:1   SKUL:1   BONE:1   BONE:1   SKUL:1   BONE:1   BONE:1   SKUL:1'  >> maze-blueprint
echo '==  chestd   :  BONE:1   BONE:1   BONE:1   BONE:1   BONE:1   SKUL:1   BONE:1   SKUL:1   BONE:1'  >> maze-blueprint
echo ''                                                                                                >> maze-blueprint

echo '####  32 layers of bedrock'                                                                      >> maze-blueprint
for INDX in `seq 1 32`; do
cat                                 maze-base-x3        | sed 's/[^ ]/^/g'                             >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint
done
echo ''                                                                                                >> maze-blueprint
echo ''                                                                                                >> maze-blueprint

echo '####  the maze itself'                                                                           >> maze-blueprint
cat                                 maze-base-x3        | ./randombricks.pl 128                        >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint
cat                                 maze-base-x3        | ./randombricks.pl 128                        >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint
cat                                 maze-base-x3        | ./randombricks.pl 128                        >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint
cat                                 maze-base-x3        | ./randombricks.pl 128                        >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint

echo '####  32 layers of airspace'                                                                     >> maze-blueprint
for INDX in `seq 1 32`; do
cat                                 maze-base-x3        | sed 's/[^ ]/./g'                             >> maze-blueprint
echo '--'                                                                                              >> maze-blueprint
done

echo '... done'
echo ''

echo 'TODO: start cage'
echo 'TODO: start and goal doors and buttons'
echo 'TODO: add milestone items'
echo 'TODO: add beds for safety at night'
echo 'TODO: scattered chickens'
echo ''
