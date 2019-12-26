#!/bin/bash

row_count=20
total_spots=$((($row_count-1)*2+1))

stump_width=8
stump_height=5

for ((i=0; i<$row_count; i++));
do
  number_filled_spots=$(($i*2 + 1))
  number_blank_spots=$(($total_spots-$number_filled_spots))
  number_blank_spots_on_each_side=$(($number_blank_spots/2))
  row=""
  # echo $number_filled_spots
  for ((j=0; j<$number_blank_spots_on_each_side; j++))
  do
    row+=" "
  done

  for((k=0; k<$number_filled_spots; k++));
  do
    row+="@"
  done

  if [ $(($i%4)) -eq 0 ];
  then
    echo.color.yellow "${row}"
  elif [ $(($i%3)) -eq 0 ];
  then
    echo.color.red "${row}"
  else
    echo.color.green "${row}"
  fi


done

for((i=0; i<$stump_height; i++))
do
  row=""
  number_filled_spots=$stump_width
  number_blank_spots=$(($total_spots-$number_filled_spots))
  number_blank_spots_on_each_side=$(($number_blank_spots/2))
  # echo $number_filled_spots
  for ((j=0; j<$number_blank_spots_on_each_side; j++))
  do
    row+=" "
  done
  for((k=0; k<$stump_width; k++))
  do
    row+='x'
  done
  echo.color.woodbrown "${row}"
done

echo.color.red "$(cat ./ascii-art.txt)"
