# 考研数学(一) [`LaTeX`]

`LaTex` 排版: 考研数学(一)的 **Notes**


## 1. 目录结构

``` shell
(base)@yjlpku ➜ main git(main)$ tree -L 1
.
├── .git
├── chap # 内容文件夹
├── config # 配置文件夹
├── figure # 图片文件夹
├── mindmap # 思维导图文件夹
├── PDF # 思维导图生成的 PDF
├── .gitignore
├── main.pdf # Notes
├── main.synctex.gz
├── main.tex # 主文件
├── vavidbook.cls # 模板
├── Makefile # 编译命令文件
└── README.md
```

- [VividBooK 模板](https://www.latexstudio.net/index/details/index/mid/3485.html)
- `main.tex` 内采用 `input{../xx.tex}` 联合编译
- `mindmap` 思维导图推荐使用 [Obsidian](https://obsidian.md/) 查看，安装 `Enhancing Mindmap` 插件，使用 [Typora](https://typoraio.cn/) 中 `Rainbow` 主题导出 `pdf` 文件

## 2. 环境配置

### 2.1 `texlive` 安装和字体依赖
- `texlive 2024` [Texlive 安装教程](https://tug.ctan.org/info/install-latex-guide-zh-cn/install-latex-guide-zh-cn.pdf)

- 字体安装(**所有用户安装**) 
> (1). [方正字体](https://pan.baidu.com/share/init?surl=BgbQM7LoinY7m8yeP25Y7Q) (提取码: `njy9`)
> 
> (2). [CMU](https://fontmeme.com/fonts/cmu-typewriter-font/)
> 
> (3). [NerdFOnt](https://www.nerdfonts.com/font-downloads)

### 2.2 编辑器

- [TexStudio](https://texstudio.sourceforge.net)
- [VSCode](https://code.visualstudio.com)
- 个人推荐使用 `VSCode` 编辑器，安装 `LaTeX Workshop` 和 `Github Copilot` 插件，预览公式和代码提示以及 `Snippets` 功能齐全，编译设置请参考 `config/setting.json`

### 2.3 阅读器

[SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer.html) (Windows)

## 3. 编译

``` shell
(base)@yjlpku ➜ main git(main)$ make run # 编译(无信息输出)
(base)@yjlpku ➜ main git(main)$ make clean # 清理
(base)@yjlpku ➜ main git(main)$ make debug # 编译(有信息输出)

```

## 4. 打赏
如果您觉得本项目对您有所帮助, 欢迎打赏, 以激励作者继续努力, 生活不易, 鼠鼠叹气, 感谢支持!

![400](figure/微信.png) ![350](figure/支付宝.jpg)
