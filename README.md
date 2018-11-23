# Code Base 

在專案過程中，如果做到可重覆使用的元件，不論是 UIKit 或是其他元件操作，都可以放到這個 Repo 建檔。 
未來如果有一樣的需求，可以直接到這個 Repo 直接把 Code 拿出來使用。 
如果 Developer 後續已掌握 Coacoa Pods 或 Carthage 等套件製作工具。
那也可以 Build 成 framework，開放給其他人使用。

## 規則
一定要寫說明，至少要一行，可以寫在 .h 檔 method 的上方，或是另外寫 README.md

## CIFoundation
基本的格式檢查，放的是專案共用的東西

--
### CIFormatter


// 檢查是不是此字串是不是全數字
```+ (BOOL)isDecimal:(NSString*)string;```


// 檢查此字串是不是符合台灣手機格式
```+ (BOOL)checkMobileNumber:(NSString *)mobileNumber;```


// 版本號檢查,如果 version 2 比 version 大
```+ (BOOL)checkNeedUpdateFrom:(NSString*)version1
          needUpdateVersion:(NSString*)version2;```


// email 檢查,目前設定字元數為 2 ~ 100
```+ (BOOL)checkEmailFormatIsValid:(NSString*)email;```

--
### CIAlertFactory


// 生出一個 alert controller,不帶 action, action 在生出後自己客製化增加
```+ (UIAlertController*)createAlertWithoutAction:(NSString*)title message:(NSString*)message;```


// 生出一個簡單 alert controller, 點擊後自動消失,沒有其他作用
```+ (UIAlertController*)createSimpleAlert:(NSString*)title message:(NSString*)message actionTitle:(NSString*)actionTitle;```

--
### CINumberFormatter


// 把一個 double 數字加上千分位,還可以設定小數點到幾位,小數點不足會補0
```+ (NSString*)roundOff:(double)input fractionDigits:(NSInteger)fractionDigits;```


## Coding Style

目前 follow Ray Wenderich  
[Coding Style](https://github.com/raywenderlich/objective-c-style-guide#variables)

##  xcodebuild command line script

```
xcodebuild \
-project CIFoundation.xcodeproj \
-scheme CIFoundation \
-sdk iphonesimulator12.1 \
-destination 'platform=iOS Simulator,name=iPhone 8,OS=12.1' \
test
```
也可以加上 xcpretty --test --color 上色

## 使用這個 framework 的專案需要加上這個 build phases
```
FRAMEWORK="CIFoundation"

FRAMEWORK_EXECUTABLE_PATH="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$FRAMEWORK.framework/$FRAMEWORK"

EXTRACTED_ARCHS=()

for ARCH in $ARCHS

do

lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"

EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")

done

lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"

rm "${EXTRACTED_ARCHS[@]}"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
```