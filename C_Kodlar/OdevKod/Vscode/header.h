#pragma once
#include <stdio.h> // Burada veri alıp yazdırmak için gereken input-output kütüphanesini aldım.
#include <stdlib.h> // Sonuç ekranım kaybolmasın diye system kullanıyorum bu kütüphaneden.
#include "binary.h" // Dosyalarımı burada include ettim.


typedef enum{
    RANGE_2G=0b0,
    RANGE_4G=0b01,
    RANGE_8G=0b10,
    RANGE_16G=0b11
}gRange;

typedef enum{
    BW7_81=0b000,
    BW15_63=0b001,
    BW31_25=0b010,
    BW62_5=0b011,
    BW125=0b100,
    BW250=0b101,
    BW500=0b110,
    BW1000=0b111
}bandwithHz;

typedef enum{
    NORMAL=0b000,
    SUSPEND=0b001,
    LOWP1=0b010,
    STANDBY=0b011,
    LOWP2=0b100,
    DSUSPEND=0b101
}opMode;

typedef struct{
    gRange range;
    bandwithHz bw;
    opMode mode;
    unsigned char value;
}bnoConfig;

void binary(unsigned char number);
void verikaydet(bnoConfig newConfig);