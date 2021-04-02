# Assignment_2
---
## Script to Compile and Situation
```
  $ python3 ~/Python/imagetoFP.py
```
```
  $ vsim -c -do "run.do;run -all" testbench
```
```  
  $ python3 ~/Python/fpToImageHSV.py
```
---
## Directory
1. **RTL**
   * mul.v
   * div.v
   * addSub.v
   * Select_RGB.v
   * Compare_fp.v
   * Tier1_HSV.v
   * Tier2_HSV.v
   * RGBtoHSV.v
2. **Memory**
   * RGBFP.txt
   * HSV.txt
3. **Script**
   * run.do
   * main.py
4. **Python Code**
5. **Image**
---
## Convert from RGB to HSV
### Formula

<img width="718" alt="FTH7K" src="https://user-images.githubusercontent.com/74291056/113453326-f59ccd80-942f-11eb-9276-01b9b9680abe.png" width="100">
### Hardware

![Screenshot 2021-04-03 043713](https://user-images.githubusercontent.com/74291056/113456240-e4a38a80-9436-11eb-99e7-15f8b1fc0bbd.png)

