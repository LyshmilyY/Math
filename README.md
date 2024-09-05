# README
## 项目介绍: 考研数学(一) [`LaTeX`]

### 文档目录结构

```shell
(base) muyi@LyshmilyY:/Lyshmily.Y/GEE/Math/main$ tree -L 1
.
├── .git
├── chap
├── config
├── figure
├── mindmap
├── .gitignore
├── main.pdf
├── main.synctex.gz
├── main.tex
└── vavidbook.cls
```

> 1. `main.tex` 是主文件, `config\config.tex` 是设置文件, `vavidbook.cls` 是模版文件, 来源于 [LaTeX 工作室](https://www.latexstudio.net/index/details/index/mid/3485.html),针对 `texlive 2024` 进行一些修改 
> 2. `chap` 是内容文件夹, `figure` 是图片文件夹
> 3. `main.pdf` 是编译好的 `pdf` 文件
> 4. `chap` 内部包含各个章节的内容, 在 `main.tex` 内采用 `input{../xx.tex}` 联合编译
> 5. `mindmap` 是思维导图, 是 `md` 文件, 推荐使用 `Obsidian` 查看思维导图或者 `md` 预览, 以及后续 `pdf` 导出

## 编译环境
1. 使用 `texlive 2024` 编译, 请确保安装了 `texlive` 环境
2. 编辑器选择: `texstudio` 和 `vscode`, 前者在宏设置有优势, 后者搭配 `Github Copilot` 有优势, 个人推荐使用 `vscode`, 可以方便预览公式
3. 关于 `vscode` 的配置, 一下是 `LaTeXWorkshop` 插件的配置, 请参考: `config/setting.json`
4. `PDF` 阅读器推荐: `SumatraPDF`, 可以实现 `pdf` 和 `tex` 文件的联动, 也可以实现 `pdf` 文件的自动刷新, 下载地址: [SumatraPDF](https://www.sumatrapdfreader.org/download-free-pdf-viewer.html)
5. 可以在 `Win 10`, `Win11` 和 `Linux(Ubuntu)` 上编译, 但是在 `MacOS` 上没有测试过, 请自行测试
6. 模板说明文档: [vavidbook](https://github.com/Azure1210/VividBooK) 和 [elegantbook](https://github.com/ElegantLaTeX/ElegantBook), 有关于模板的一些选项和设置

## 字体安装 (Windows右键为所有用户安装)
1. 方正字体下载(提取码:njy9): [方正字体](https://pan.baidu.com/share/init?surl=BgbQM7LoinY7m8yeP25Y7Q)
2. 数学字体安装: `CMU-Typewrite-Font`: [CMU](https://fontmeme.com/fonts/cmu-typewriter-font/)
3. `Nerd Font` 字体安装: [NerdFOnt](https://www.nerdfonts.com/font-downloads)

## 打赏
如果您觉得本项目对您有所帮助, 欢迎打赏, 以激励作者继续努力, 生活不易, 鼠鼠叹气, 感谢支持!
<center class="half">
<img src="https://yjl0928-image-1328687625.cos.ap-beijing.myqcloud.com/Image/README-%E6%94%AF%E4%BB%98%E5%AE%9D.jpg" width=250/>
<img src="https://yjl0928-image-1328687625.cos.ap-beijing.myqcloud.com/Image/README-%E5%BE%AE%E4%BF%A1.png" width=250/>
</center>

