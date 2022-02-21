#!/usr/bin/env bash
img_str=$(docker image ls)

echo "Developed by GIWYD2 (MIT license)"

attack-option () {
    start-attack (){
      echo "Embrace for impact"
      {
        for i in {1..2}
        do
           echo "Container $i"
           docker run syn_flood &
        done
      }
      #docker stats
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
   docker build  -t syn_flood  .
   attack-option
}

if [[ $img_str == *"syn_flood"* ]];
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