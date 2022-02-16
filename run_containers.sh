#!/usr/bin/env bash
img_str=$(docker image ls)

echo "Developed by GIWYD2 - use with caution"

attack-option () {
    start-attack (){
      echo "Embrace for impact"
    }

    echo "Do you want to start an attack?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) start-attack; break;;
            No ) exit;;
        esac
    done
}

build_image () {
   echo 'BUILDING...'
   attack-option
}

if [[ $img_str == *"sxn_flood"* ]];
  then
    echo "SYN Flood image found"
    attack-option

  else
    echo "SYN Flood image NOT found. Do you with to build image (Yes/No)?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) build_image; break;;
            No ) exit;;
        esac
    done
fi