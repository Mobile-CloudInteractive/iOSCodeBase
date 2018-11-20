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

// 檢查是不是此字串是不是全數字</p>
```+ (BOOL)isDecimal:(NSString*)string;```

// 檢查此字串是不是符合台灣手機格式</p>
```+ (BOOL)checkMobileNumber:(NSString *)mobileNumber;```

// 版本號檢查,如果 version 2 比 version 大</p>
```+ (BOOL)checkNeedUpdateFrom:(NSString*)version1
          needUpdateVersion:(NSString*)version2;```

// email 檢查,目前設定字元數為 2 ~ 100</p>
```+ (BOOL)checkEmailFormatIsValid:(NSString*)email;```

--
### CIAlertFactory


// 生出一個 alert controller,不帶 action, action 在生出後自己客製化增加</p>
```+ (UIAlertController*)createAlertWithoutAction:(NSString*)title message:(NSString*)message;```


// 生出一個簡單 alert controller, 點擊後自動消失,沒有其他作用</p>
```+ (UIAlertController*)createSimpleAlert:(NSString*)title message:(NSString*)message actionTitle:(NSString*)actionTitle;```



## Coding Style

目前 follow Ray Wenderich  
[Coding Style](https://github.com/raywenderlich/objective-c-style-guide#variables)