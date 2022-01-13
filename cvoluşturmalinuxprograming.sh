#!/bin/bash

# sysinfo_page - A script to produce an HTML file

data=$(zenity --forms --text="CV olusturma" --separator "," \
--add-entry "Ad:" \
--add-entry "Soyad:" \
--add-entry "Telefon numaranız:" \
--add-entry "Mail:" \
--add-entry "Okulunuz:" \
--add-entry "Bölümünüz:" \
--add-entry "Iş tecrübeleriniz:" \
--add-entry "İlgi alanlarınız:" \
--add-entry "Sağ ve sol kolon renk kodu (3 haneli):" \
--add-entry "Başlık ve alt satır kodu (3 haneli):" \

)


ad=$(echo $data | awk -F ',' '{print $1}' )
soyad=$(echo $data | awk -F ',' '{print $2}' )
telefon=$(echo $data | awk -F ',' '{print $3}' )
mail=$(echo $data | awk -F ',' '{print $4}' )
okul=$(echo $data | awk -F ',' '{print $5}' )
bolum=$(echo $data | awk -F ',' '{print $6}' )
isler=$(echo $data | awk -F ',' '{print $7}' )
hobi=$(echo $data | awk -F ',' '{print $8}' )
kolon=$(echo $data | awk -F ',' '{print $9}' )
satir=$(echo $data | awk -F ',' '{print $10}' )






cat << EOF > ex-4.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <div id="header"></div>
    <div class="left"></div>
    <div class="stuff">
      <br><br>
      <h1>CV</h1>
      <h2> $ad $soyad</h2>
      <h3> $mail | $telefon </h3>
      <hr />
      <br>
      <p class="head">İlgi alanları</p>
      <ul>
        $hobi
      </ul>
      <p class="head">Eğitim</p>
      <ul>
        <a href="http://www.wiltonhighschool.org/pages/Wilton_High_School">
          <li>$okul</li>
        </a>
        <!--Link-->
        <a href="https://www.silvermineart.org/">
            $bolum
        </a>
      </ul>
      <p class="head">Tecrübeler</p>
      <ul>
        <li>$isler</li>

      </ul>
    </div>
    <div class="right"></div>
    <div id="footer">
      <h2 id="name">$ad $soyad</h2></div>

    <style>
        {
            max-width: 700px;
            margin: auto;
          }


          body {
              min-width: 500px;
          }*/

          div {
            border-radius: 5px;
          }

          #header {
            height: 40px;
            width: 100%;
            background-color: #$satir;
            position: fixed;
            z-index: 1;
          }

          #title {
            margin-left: 3%;
          }

          #footer {
            height: 50px;
            width: 100%;
            background-color: #$satir;
            clear: both;
            position: relative;
          }

          .left {
            height: 1000px;
            width: 45px;
            background-color: #$kolon;
            float: left;
            position: fixed;
          }

          .right {
            height: 1000px;
            width: 45px;
            background-color: #$kolon;
            float: right;
            position: inherit;
          }

          .stuff {
            display: inline-block;
            margin-top: 6px;
            margin-left: 55px;
            width: 75%;
            height: 1000px;
          }

          p,
          li {
            font-family: 'Cormorant Garamond';
          }

          .head {
            font-size: 20px;
          }

          #name {
            font-family: Sacramento;
            float: right;
            margin-top: 10px;
            margin-right: 4%;
          }

          a {
            color: black;
            text-decoration: none;
          }

          @media only screen and (max-width: 430px) {
            .left,
            .right {
              display: none;
            }
            .stuff {
              width: 100%;
              margin-left: 10px;
            }
          }
    </style>

</html>
EOF
