;; 关闭启动界面默认显示的消息
(setq inhibit-startup-message t)


;; 使用y or n提问，取代yes or no，避免多打字
(fset 'yes-or-no-p 'y-or-n-p)


;; 全局设定，显示行号
(global-linum-mode 1)


;; 全局设定，高亮当前航
(global-hl-line-mode t)


;; 设置缩进为4个空格，而不是2个，保护视力
(setq-default c-basic-offset 4)


;; 很基础的括号配对
;; 先不考虑用各种花哨的插件，而是直接用系统内置的(since emacs24)
(electric-pair-mode 1)    ; 自动输入配对的括号
(show-paren-mode 1) ; 配对括号高亮


;; gdb配置
;; 用meta+方向键在各个窗口之间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
;; 默认开启多个窗口，包括gdb命令窗口、代码窗口、变量窗口、栈帧窗口等
(setq-default gdb-many-window t)

;; 禁用光标闪烁
(blink-cursor-mode 0)

;;　不要产生~文件
(setq make-backup-files nil)

