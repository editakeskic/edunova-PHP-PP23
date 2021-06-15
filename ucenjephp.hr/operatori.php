<?php

$i=1; $j=0;

$t = $t + $i;


// skraćena linija 5
$t += $i;

// ista pravila vrijede za - * /

// specifićnosti uvećanja za 1

$i=0; //0

$i=$i+1; //1

$i+=1; //2

$i++; //3

//increment
echo $i++; //3 //prvo koristi pa onda uveća varijablu

echo $i; //4

echo ++$i; //5

//uvećanje za 7 $i+=7;


//decrement - ista pravila

$i=1; $j=0;

$i = $j++; //$i=0, $j=1

$j = --$i - --$j; // $i=-1, $j=-1

echo $j + $i; // -2

// domaća zadaća kreirati 7 scenarija napamet iz glave (napisati
