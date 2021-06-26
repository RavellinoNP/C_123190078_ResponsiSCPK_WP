%penyelesaian kasus menggunakan metode WP
clc;clear; %untuk membersihkan jendela command windows

data = xlsread('Real estate valuation data set.xlsx','C2:E51'); %mengambil data baris 1-50 kolom house age, distance to the nearest MRT station,
%number of convenience stores
harga = xlsread('Real estate valuation data set.xlsx','H2:H51'); %mengambil data baris 1-50 kolom house price of unit area.

x = [data harga];%menggabungkan data dan harga sehingga diperoleh data rating kecocokan dari masing-masing alternatif
kriteria = [1,0,1,0];%atribut tiap-tiap kriteria (1=atrribut keuntungan, dan 0= atribut biaya)
weight = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3=cukup, 4= tinggi, 5= sangat tinggi)

%Langkah pertama, memperbaiki nilai bobot
[m,n]=size (x); %inisialisasi ukuran x
weight=weight./sum(weight); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%langkah kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
if kriteria(j)==0, weight(j)=-1*weight(j);
end
end
for i=1:m
S(i)=prod(x(i,:).^weight);
end

%Langkah 3 ketiga, proses perangkingan
for i=1:m
   V(i) = S(i)/sum(S);
end
nilai = sort(V,'descend'); %mengurutkan berdasarkan nilai terbesar

for i=1:m
  for j=1:m
    if(nilai(i) == V(j))
      nomor(i) = j; %mencari urutan nomor sesuai dengan data yang sudah diurutkan
      break
    end
  end
end
