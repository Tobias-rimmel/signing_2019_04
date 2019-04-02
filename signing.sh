#!/bin/bash

while [ true ] 
do
#  touch /mnt/c/test/new_contracts/test.pdf
  rsync --remove-source-files -av deploy-ucastme_p@c42.ucastme.makandra.de:/gluster/shared/ucastme.de/shared/storage/ucm_contracts/*.pdf /mnt/c/test/new_contracts 
  fz=`find /mnt/c/test/new_contracts/ -type f | wc -l`
  bz=1
  echo $fz

  if [ "$(ls -A /mnt/c/test/new_contracts)" ]; then
     if [ $fz -gt 1 ]; then

      #/mnt/c/Program\ Files\ \(x86\)/AutoIt3/AutoIt3.exe c:\\\test\\\signing.au3 & /mnt/c/Program\ Files\ \(x86\)/digiSeal/digiSeal.exe -sign -in c:\\\test\\\new_contracts\\\ & wait $!
      /mnt/c/Program\ Files\ \(x86\)/AutoIt3/AutoIt3.exe c:\\test\\signing.au3 & /mnt/c/Program\ Files\ \(x86\)/digiSeal/digiSeal.exe -sign -in c:\\test\\new_contracts\\ & wait $!
      rsync -av /mnt/c/test/new_contracts/*_sig.pdf deploy-ucastme_p@c42.ucastme.makandra.de:/gluster/shared/ucastme.de/shared/storage/ucm_contracts_signed/
      mv /mnt/c/test/new_contracts/*_sig.pdf /mnt/c/test/signed_contracts
      mv /mnt/c/test/new_contracts/*.pdf /mnt/c/test/unsigned_contracts
    else
      sleep 5m
    fi

  else
    echo "no new files found... Waiting for 5 min"
    sleep 5m
    echo "next try"
  fi
done
