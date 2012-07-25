<?php

$strings = array(
		'XCache Help'
		=> 'XCache 說明訊息',
		'Help'
		=> '說明',
		'Clear'
		=> '清除',
		'Sure to clear?'
		=> '確認要清除嗎?',
		'% Free'
		=> '% 剩余',
		'% Used'
		=> '% 已用',
		'Hits'
		=> '命中',
		'Modify'
		=> '修改',
		'See also'
		=> '建議參考',
		'Legends:'
		=> '图例:',
		'Used Blocks'
		=> '已用块',
		'Free Blocks'
		=> '未用块',
		'Total'
		=> '总共',
		'Caches'
		=> '快取',
		'php Cached'
		=> '快取的 php 指令',
		'php Deleted'
		=> '待刪 php 指令',
		'var Cached'
		=> '快取的變數',
		'var Deleted'
		=> '待刪變數',
		'Statistics'
		=> '摘要統計',
		'List PHP'
		=> '列出PHP',
		'List Var Data'
		=> '列變數資料',
		'XCache %s Administration'
		=> 'XCache %s 管理頁面',
		'Module Info'
		=> '組元訊息',
		'Remove Selected'
		=> '移除所选',
		'Editing Variable %s'
		=> '正在编辑变量 %s',
		'Set %s in config to enable'
		=> '請在配置文件中設置 %s 啟用本功能',
		'cache.cache'
		=> '快取|',
		'cache.slots'
		=> '槽|Hash 槽個數，對應 php.ini 裡的設置',
		'cache.size'
		=> '大小|共享記憶體區大小，單位：位元',
		'cache.avail'
		=> '剩餘|可用記憶體，對應共享記憶體區的剩餘記憶體位元數',
		'cache.used'
		=> '已用|已用内存, 对应共享内存区的已用内存字节数',
		'cache.blocksgraph'
		=> '百分比图|條狀顯示可用記憶體的比例',
		'cache.operations'
		=> '操作按鈕|點擊按鈕清除對應共享記憶體區的資料',
		'cache.compiling'
		=> '編譯中|編譯標記，當共享記憶體區正在編譯 php 指令時標記為 "yes"',
		'cache.hits'
		=> '命中|共享記憶體命中次數，命中=從該共享記憶體載入php或者變數',
		'cache.hits_avg_h'
		=> '命中/H|每小时命中次数. 只统计最后 24 小时',
		'cache.hits_graph'
		=> '24H 分布|24 小时命中分布图. 图表现是最后 24 小时的命中次数',
		'cache.hits_avg_s'
		=> '命中/S|每秒命中次数. 只统计最后 5 秒',
		'cache.updates'
		=> '更新|共享記憶更新過次數',
		'cache.clogs'
		=> '阻塞|編譯阻塞跳過，阻塞=當需該共享記憶體區負責編譯時，其他程序/現成無法存取此共享記憶體. 跳過=XCache 自動判斷阻塞的共享記憶體區自動跳過阻塞等待，直接使用非共享記憶體方式繼續處理請求',
		'cache.ooms'
		=> '記憶體不足|記憶體不足次數，顯示需要儲存新資料但是共享記憶體區記憶體不足的次數. 如果出現太頻繁請考慮加大配置中的 xcache.size 或者 xcache.var_size',
		'cache.errors'
		=> '错误|编译错误, 显示您的脚本被编译时出错的次数. 如果您发现这个数字不断增长, 您应该检查什么脚本产生错误. 参考 說明',
		'cache.readonly_protected'
		=> 'Protected|顯示該 Cache 是否支援並啟用 readonly_protection. 参考 說明',
		'cache.cached'
		=> '快取|共享記憶體於該共享記憶體區的項目個數',
		'cache.deleted'
		=> '待刪|共享記憶體區內將要刪除的項目 (已經刪除但是還被某些程序佔用)',
		'cache.gc_timer'
		=> 'GC|垃圾回收的倒數計時',
		'entry.id'
		=> 'Id|',
		'entry.name'
		=> '項目名稱/檔案名稱|項目名稱或者檔案名稱',
		'entry.hits'
		=> '命中|該項目被命中的次數 (從共享記憶體區載入)',
		'entry.size'
		=> '大小|項目在共享記憶體裡佔用位元數',
		'entry.refcount'
		=> '引用數|項目依然被其他程序佔用的引用次數',
		'entry.phprefcount'
		=> '共享|與本項目相同 PHP 內容的个數',
		'entry.file_size'
		=> '源大小|原始檔案大小',
		'entry.file_mtime'
		=> '修改|原始檔案最後修改時間',
		'entry.file_device'
		=> 'dev|原始檔案所在設備ID',
		'entry.file_inode'
		=> 'ino|原始檔案的inode',
		'entry.class_cnt'
		=> '类|类个数',
		'entry.function_cnt'
		=> '函数|函数个数',
		'entry.hash'
		=> 'Hash|Hash',
		'entry.atime'
		=> '存取|最後存取該項目的時間',
		'entry.ctime'
		=> '建立|該項目被建立於共享內的時間',
		'entry.delete'
		=> '移除|該項目被移除於共享內的時間',
		'entry.remove'
		=> '移除|',
);
