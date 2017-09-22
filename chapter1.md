# 第 01 天

## 建立 R 語言的開發環境

請您把心情放輕鬆，第一天我們要學習的只有兩件事情：

1. 在電腦上安裝 R
2. 在電腦上安裝 RStudio

R 是結合統計分析與繪圖功能的免費開放原始碼軟體，RStudio 則是能讓我們編寫 R 程式時候使用體驗更好的整合開發環境（Integrated Development Environment，IDE。）

我建議您跟我一樣，先安裝 R 再安裝 RStudio。

### 安裝 R

前往 [CRAN](https://cran.r-project.org/)，如果您習慣使用的作業系統是 Mac 請點選 Download R for (Mac) OS X，如果習慣使用的作業系統是 Windows 請點選 Download R for Windows。

#### Mac

依照圖中紅色方框點選連結下載安裝檔。

![圖 1-1 下載 R 的 Mac 安裝檔](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch101.png)

下載完畢之後執行安裝檔，依照提示訊息點選確認或下一步就能完成安裝。

#### Windows

依照圖中紅色方框點選連結下載安裝檔。

![圖 1-2 下載 R 的 Windows 安裝檔](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch102.png)

![圖 1-3 下載 R 的 Windows 安裝檔（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch103.png)

下載完畢之後執行安裝檔，依照提示訊息點選確認或下一步就能完成安裝。

### 安裝 RStudio

前往 [Download RStudio – RStudio](https://www.rstudio.com/products/rstudio/download/)，如果您習慣使用的作業系統是 Mac 請點選 RStudio X.X.XXX - Mac OS X XX.X+ (64-bit)，如果習慣使用的作業系統是 Windows 請點選 RStudio X.X.XXX - Windows Vista/7/8/10。

#### Mac

依照圖中紅色方框點選連結下載安裝檔。

![圖 1-4 下載 RStudio 的 Mac 安裝檔](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch104.png)

下載完畢之後執行安裝檔，依照提示訊息點選確認或下一步就能完成安裝。

#### Windows

依照圖中紅色方框點選連結下載安裝檔。

![圖 1-5 下載 RStudio 的 Windows 安裝檔](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch105.png)

下載完畢之後執行安裝檔，依照提示訊息點選確認或下一步就能完成安裝。

### 啟動 RStudio

安裝完畢以後，啟動 RStudio 的方式與啟動一般軟體的方式相同。

#### Mac

在 Launchpad 中找到 RStudio 的圖示執行；或按下 `control + 空白鍵（Space）`啟動 Spotlight Search 後輸入 RStudio 執行。

#### Windows

在**開始**選單中選擇**所有程式**選擇 RStudio；假如 RStudio 安裝程式有產生桌面捷徑，則雙擊桌面捷徑。

### RStudio 介面介紹

第一次執行 RSudio 時介面中只會顯示三個區塊：

![圖 1-6 RStudio 介面介紹](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch106.png)

讓我們透過新增一個 R 程式將完整的四個區塊都顯示出來：

![圖 1-7 RStudio 介面介紹（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch107.png)

![圖 1-8 RStudio 介面介紹（3）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch108.png)

RStudio 介面主要的四個區塊與功能簡介：

- 來源（Source）：位於左上角，編寫程式的區塊
- 命令列（Console）：位於左下角，執行程式的區塊
- 環境與歷史：位於右上角
    - 環境（Environment）：目前的變數清單
    - 歷史（History）：在命令列執行過哪些指令
- 檔案、圖形、套件、查詢與預覽器：位於右下角
    - 檔案（Files）：使用者的工作目錄
    - 圖形（Plots）：顯示圖表
    - 套件（Packages）：安裝套件的清單
    - 查詢（Help）：顯示查詢文件
    - 預覽器（Viewer）：顯示網頁

### 離開 RStudio

離開 RStdio 的方式有兩種：

1. 點擊視窗的 X 離開
2. 在命令列（Console）輸入 `q()` 離開

![圖 1-9 離開 RStudio](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch1/ch109.png)

離開時候會詢問是否要儲存您的工作空間，如果您希望下一次啟動時保有目前環境中的物件，可以選擇儲存工作空間。

### 小結

第一天我們學會安裝 R 與 RStudio。

### 練習題

請讀者在您們工作上習慣使用的電腦中安裝 R 與 RStudio。

### 延伸資訊

- [CRAN](https://cran.r-project.org/index.html)
- [RStudio](https://www.rstudio.com/)
- [R: What is R?](https://www.r-project.org/about.html)
- [RStudio IDE features](https://www.rstudio.com/products/rstudio/features/)
- [RStudio - 維基百科，自由的百科全書](https://zh.wikipedia.org/wiki/RStudio)
- [R語言 - 維基百科，自由的百科全書](https://zh.wikipedia.org/wiki/R%E8%AF%AD%E8%A8%80)