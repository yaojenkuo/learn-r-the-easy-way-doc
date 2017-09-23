---

# 資料的輸入與輸出
## 輕鬆學習 R 語言

---

# 內建資料

R 語言有非常豐富的內建資料

```r
data() # 在命令列（Console）輸入
```

---

# 內建資料（2）

在來源（Source）區塊瀏覽一份內建資料集的清單

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch11/ch1101.png)

---

# 內建資料（3）

像查詢函數一般來查詢內建資料

```r
?iris # 或者輸入 help(iris)
```

---

# 輸入資料

表格式資料（favorite_bands.txt）以空格區隔變數

```
band lead_voal formed
"Beyond" "Wong Ka Kui" 1983
"Beatles" "John Lennon" 1960
```

---

# 輸入資料（2）

```r
file_path <- "/Users/username/favorite_bands.txt"
favorite_bands <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE)
View(favorite_bands)
```

---

# 輸入資料（3）

表格式資料（favorite_bands.tsv）以 tab 區隔變數

```
band    lead_voal   formed
"Beyond"    "Wong Ka Kui"   1983
"Beatles"   "John Lennon"   1960
```

---

# 輸入資料（4）

```r
file_path <- "/Users/username/favorite_bands.tsv"
favorite_bands <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE)
View(favorite_bands)
```

---

# 輸入資料（5）

表格式資料（favorite_bands.csv）以逗號區隔變數

```
band,lead_voal,formed
"Beyond","Wong Ka Kui",1983
"Beatles","John Lennon",1960
```

---

# 輸入資料（6）

```r
file_path <- "/Users/username/favorite_bands.csv"
favorite_bands <- read.table(file_path, header = TRUE, stringsAsFactors = FALSE, sep = ",")
View(favorite_bands)
```

---

# `readLines()` 函數

```
Ross: (mortified) Hi.
Joey: This guy says hello, I wanna kill myself.
Monica: Are you okay, sweetie?
Ross: I just feel like someone reached down my throat, grabbed my small intestine, pulled it out of my mouth and tied it around my neck...
Chandler: Cookie?
Monica: (explaining to the others) Carol moved her stuff out today.
Joey: Ohh.
Monica: (to Ross) Let me get you some coffee.
Ross: Thanks.
Phoebe: Ooh! Oh! (She starts to pluck at the air just in front of Ross.)
Ross: No, no don't! Stop cleansing my aura! No, just leave my aura alone, okay?
Phoebe: Fine!  Be murky!
```

---

# `readLines()` 函數（2）

```r
file_path <- "/Users/username/friends_script.txt"
friends_script <- readLines(file_path)
friends_script
```

---

# 常見資料格式的輸入

仰賴**套件**來輔助我們輸入 Excel 試算表與 JSON：

|資料格式|套件名稱|主要開發者|
|-------|-------|-----|
|Excel 試算表|`readxl`|Hadley Wickham|
|JSON|`jsonlite`|Jeroen Ooms|

---

# 輸入 Excel 試算表

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch11/ch1108.png)

---

# 輸入 Excel 試算表（2）

```r
# 安裝與載入套件
install.packages("readxl") # 如果先前已經安裝過就不用執行這行
library(readxl)
```

---

# 輸入 Excel 試算表（3）

```r
# 讀入
file_path <- "/Users/username/favorite_bands.xlsx"
favorite_bands <- read_excel(file_path)
```

---

# 輸入 JSON

JSON 是 JavaScript Object Notation 的縮寫

```
[
    {"band": "Beyond", "lead_vocal": "Wong Ka Kui", "formed": 1983},
    {"band": "Beatles", "lead_vocal": "John Lennon", "formed": 1960}
]
```

# 輸入 JSON（2）

```r
# 安裝與載入套件
install.packages("jsonlite") # 如果先前已經安裝過就不用執行這行
library(jsonlite)
```

---

#  輸入 JSON（3）

```r
# 讀入
file_path <- "/Users/username/favorite_bands.json"
favorite_bands <- fromJSON(file_path)
View(favorite_bands)
```

---

# 輸出資料

我們可以將 R 語言的資料框以不同的格式輸出成為純文字檔

---

# `write.table()` 函數

預設輸出用空格區隔變數的純文字檔

```r
favorite_bands_df <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
file_path <- "/Users/username/favorite_bands.txt"
write.table(favorite_bands_df, file = file_path, row.names = FALSE)
```

---

# `write.table()` 函數（2）

指定參數 `sep = ","` 可以輸出逗號區隔的純文字檔

```r
favorite_bands_df <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
file_path <- "/Users/username/favorite_bands.csv"
write.table(favorite_bands_df, file = file_path, row.names = FALSE, sep = ",")
```

---

# `toJSON()` 函數

將資料框輸出為 JSON

```r
# 安裝與載入套件
install.packages("jsonlite") # 如果先前已經安裝過就不用執行這行
library(jsonlite)

# 輸出
favorite_bands_df <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
toJSON(favorite_bands_df)
```

---

# `writeLines()` 函數

`toJSON()` 函數搭配 `writeLines()` 函數

```r
# 輸出
favorite_bands_df <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
favorite_bands_json <- toJSON(favorite_bands_df)
file_path <- "/Users/username/favorite_bands.json"
writeLines(favorite_bands_json, con = file_path)
```