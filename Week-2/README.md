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
## Directory Organization
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
   * imageToFP.py
   * fpToImageHSV.py
   * decToFP.py
   * fpToDec.py
5. **Image**
   * rgb.png
---
## Convert from RGB to HSV
### Formula

<img width="718" alt="FTH7K" src="https://user-images.githubusercontent.com/74291056/113453326-f59ccd80-942f-11eb-9276-01b9b9680abe.png" width="100">

### Proposed Architecture

![Screenshot 2021-04-03 043713](https://user-images.githubusercontent.com/74291056/113456240-e4a38a80-9436-11eb-99e7-15f8b1fc0bbd.png)

### Testbench
![168396914_799077591045878_3362400065230859659_n](https://user-images.githubusercontent.com/74291056/113886540-f5635000-97ea-11eb-9ea9-d7a4ac789fca.png)
![165867787_143344524370232_2422818174957345216_n](https://user-images.githubusercontent.com/74291056/113886559-fb593100-97ea-11eb-99ca-16eded2ff6a2.png)
---
## Synthesis
### Elaborate schematic
![169181784_1215889802165380_1608392890421675785_n](https://user-images.githubusercontent.com/74291056/113887068-60148b80-97eb-11eb-9374-3ff93dc0aa85.png)
### Hardware utilization
![166357746_532485994805555_8880558255878534051_n](https://user-images.githubusercontent.com/74291056/113887215-81757780-97eb-11eb-8fbe-20f9bd16edd5.png)






