#!/bin/bash
output1_file="output.txt"  # Tên tệp tin đầu ra
# Kiểm tra nếu tệp tin đầu ra không tồn tại, tạo mới và ghi tiêu đề
if [[ ! -f "$output1_file" ]]; then
  echo "Thoi gian phan mem moi vua khoi dong:" > "$output1_file"
fi

output2_file="mycode.txt"  # Tên tệp tin đầu ra

# Kiểm tra nếu tệp tin đầu ra không tồn tại, tạo mới và ghi tiêu đề
if [[ ! -f "$output2_file" ]]; then
  echo "Thoi gian phan mem moi vua khoi dong:" > "$output2_file"
fi

# bat cac ung dung lan luot de quan sat bien doi RAM va Swap space khien day dung luong ram va swap space
wireshark & # bat ung dung wireshark
sleep 5 # cho 5s quan sat su thay doi dung luong trong RAM va swap space
code & # bat ung dung visual studio code
sleep 5
gnome-calculator & # bat ung dung calculator
sleep 5
google-chrome-stable https://www.youtube.com/watch?v=6dt2LhMv1j8 & # bat ung dung google chrome va mo mot trang yotube
sleep 5
google-chrome-stable https://teams.microsoft.com/_?culture=vi-vn&country=vn#/school/teams-grid/General?ctx=teamsGrid &
sleep 5
google-chrome-stable https://teams.microsoft.com/_?culture=vi-vn&country=vn#/school/teams-grid/General?ctx=teamsGrid &
sleep 10

# tat bot mot vai chuong trinh de giai phong mot RAM cho smart swapping co the thuc hien
pkill chrome
rm -r /home/ubuntu1/.config/google-chrome/Default
sleep 15

# bat mot ung dung va do thoi gian khoi dong cua ung dung do
start_time=$(date +%s%3N)
google-chrome-stable https://www.youtube.com/watch?v=TUG9icLLh-w &
end_time=$(date +%s%3N)
execution_time=$((end_time - start_time))
# In ra kết quả
echo "Thoi gian phan mem moi vua khoi dong: $execution_time ms" >> "$output1_file"
echo >> "$output1_file"
sleep 15
pkill chrome
rm -r /ubuntu1/.config/google-chrome/Default
sleep 5

# Biên dịch và chạy tệp tin C
gcc -o mycode mycode.c  
start_time=$(date +%s%3N)
./mycode
end_time=$(date +%s%3N)
execution_time=$((end_time - start_time))

# Ghi kết quả vào tệp tin và xuống dòng
echo "Thoi gian chay cua chuong trinh: $execution_time ms" >> "$output2_file"
echo >> "$output2_file"

done
