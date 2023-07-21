#!/bin/bash

while true; do
  # Khai bao bien R 
  # gan bien R bang gia tri dung luong con trong trong RAM 
  R=$(free -m | awk '/^Mem:/{print $7}')

  # Khai bao bien S
  # gan bien S bang gia tri dung luong duoc luu tru trong swap space
  S=$(free -m | awk '/^Swap:/{print $3}')

  # Neu dung luong chiem dung trong swap space nho hon gia tri Sng (Sng=100MB) 
  # S < Sng dung, in ra dong thong bao nhu ben duoi
  Sng=150
  if [ $S -lt $Sng ]; then	
    echo "Dung luong chiem dung trong bo nho swap space nho hon $Sng, qua trinh swapping chua duoc thuc hien."
  #Neu S >= Sng dung
  else
    # Neu dung luong RAM con trong lon hon dung luong luu tru trong swap space
    # R >= S dung, in ra man hinh thong bao ben duoi.	
    if [ $R -gt $S ]; then
      echo "RAM du dieu kien, thuc hien qua trinh swapping..."
      
      # do thoi gian thuc hien swap in dua du lieu tu swap space ve RAM
      START_TIME=$(date +%s) #Gan bien "START_TIME" bang thoi diem bat dau qua trinh swapping
      sudo swapoff /swapfile #Vo hieu hoa khong gian swap space (chuyen du lieu het ve RAM) 
      sudo swapon /swapfile #Khoi phuc lai khong gian swap space (Luc nay khong co du lieu trong swap space)
      
      END_TIME=$(date +%s) #Gan bien "END_TIME" bang thoi diem ket thuc qua trinh swapping
      SWAP_TIME=$((END_TIME - START_TIME)) #Bien "SWAP_TIME" luu gia tri thoi gian qua trinh swapping dien ra
      echo "Thoi gian du lieu swap-in tu swap space ve RAM: $SWAP_TIME giay" #hien thi ra man hinh thong bao 
    # R < S dung, hien thi ra man hinh thong bao ben duoi   
    else
      echo "RAM khong du dung luong trong, qua trinh swapping chua duoc thuc hien."
    fi
  fi

  # Hien thi dung luong RAM con trong
  echo "dung luong RAM con trong: $R MB"

  # Hien thi tong dung luong cua khong gian swap space
  echo "tong dung luong trong khong gian swap space: 1GB" 
  #thiet lap khong gian swap space tu truoc 1GB (gia tri 1GB co the duoc thiet lap ngau nhien)
	
  # Hien thi trang thai dung luong trong khong gian swap space 
  USED=$(free -m | awk '/^Swap:/{print $3}') #Hien thi dung luong da su dung trong khong gian swap space
  FREE=$(free -m | awk '/^Swap:/{print $4}') #Hien thi dung luong con trong trong khong gian swap space 
  echo -e "Used/Free swap memory: $USED/$FREE MB\n" #Hien thi ti le chiem dung 
  
  #dung 15s roi quay lai tu buoc dau cua vong lap while
  sleep 15
done
